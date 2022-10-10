import 'package:bloc/bloc.dart';
import 'package:finner/features/home/domain/entities/home_page_view_model.dart';
import 'package:finner/features/home/domain/entities/spending.dart';
import 'package:finner/features/home/domain/use_cases/add_spending.dart';
import 'package:finner/features/home/domain/use_cases/get_current_month_spending_limit.dart';
import 'package:finner/features/home/domain/use_cases/get_current_week_spendings.dart';
import 'package:finner/features/home/domain/use_cases/set_month_spending_limit.dart';
import 'package:finner/utils/injectable.dart';
import 'package:finner/utils/router.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../../../account/domain/use_cases/check_user_status.dart';
import '../../../domain/use_cases/get_current_month_spendings.dart';

part 'home_page_event.dart';
part 'home_page_state.dart';
part 'home_page_bloc.freezed.dart';

@singleton
class HomePageBloc extends Bloc<HomePageEvent, HomePageState> {
  final CheckUserStatus _checkUserStatus;
  final GetCurrentWeekSpendings _getCurrentWeekSpendings;
  final GetCurrentMonthSpendings _getCurrentMonthSpendings;
  final GetCurrentMonthSpendingLimit _getCurrentMonthSpendingLimit;
  final SetMonthSpendingLimit _setMonthLimit;
  final AddSpending _addSpending;

  HomePageViewModel _model = HomePageViewModel();

  HomePageBloc(
    this._checkUserStatus,
    this._getCurrentWeekSpendings,
    this._getCurrentMonthSpendings,
    this._getCurrentMonthSpendingLimit,
    this._setMonthLimit,
    this._addSpending,
  ) : super(const _Initial()) {
    on<HomePageEvent>((event, emit) async {
      if (event is _Load) {
        emit(_Loading(_model));
        final userResponse = await _checkUserStatus();
        userResponse.fold(
            (l) => null, (r) => _model = _model.copyWith(user: r));

        final monthSpendingResponse = await _getCurrentMonthSpendings();
        double spentAmount = 0.0;
        monthSpendingResponse.fold((l) => null, (r) {
          spentAmount = r.fold(
            0.0,
            (previousValue, element) =>
                previousValue += element.amount.toDouble(),
          );
        });

        final currentWeekSpendingResponse = await _getCurrentWeekSpendings();
        currentWeekSpendingResponse.fold((l) => null, (r) {
          r.sort(((b, a) => a.date.compareTo(b.date)));
          _model = _model.copyWith(weekSpendings: r);
        });

        final spendingLimitResponse = await _getCurrentMonthSpendingLimit();
        spendingLimitResponse.fold((e) => null,
            (r) => _model = _model.copyWith(limit: r - spentAmount));
        emit(_Loaded(_model));
      }

      if (event is _SetLimit) {
        await _setMonthLimit(event.limit);
        add(const HomePageEvent.load());
      }

      if (event is _AddSpending) {
        final r = await _addSpending(event.spending);
        r.fold((l) => null, (f) {
          if (f) {
            getIt<FinnerRouter>().pop();
            add(const HomePageEvent.load());
          }
        });
      }
    });
  }
}
