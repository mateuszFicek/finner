import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'account_event.dart';
part 'account_state.dart';
part 'account_bloc.freezed.dart';

@singleton
class AccountBloc extends Bloc<AccountEvent, AccountState> {
  AccountBloc() : super(const AccountState.accountInitial()) {
    on<AccountEvent>((event, emit) async {
      if (event is _SignIn) {
        emit(const AccountState.accountInformationLoading());
        await Future.delayed(Duration(seconds: 4));
        emit(AccountState.signedIn());
      }

      if (event is _SignUp) {
        emit(const AccountState.accountInformationLoading());
        await Future.delayed(Duration(seconds: 4));
        emit(AccountState.accountCreated());
      }
    });
  }
}
