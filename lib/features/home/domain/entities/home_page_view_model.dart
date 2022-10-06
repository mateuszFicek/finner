import 'package:finner/features/home/domain/entities/spending.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'home_page_view_model.freezed.dart';

@freezed
class HomePageViewModel with _$HomePageViewModel {
  const HomePageViewModel._();
  factory HomePageViewModel({
    final User? user,
    final List<Spending>? weekSpendings,
    final double? limit,
  }) = _HomePageViewModel;
}
