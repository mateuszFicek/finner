import 'package:bloc/bloc.dart';
import 'package:finner/features/account/domain/use_cases/create_user.dart';
import 'package:finner/features/account/domain/use_cases/login_user.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../domain/use_cases/authorize_with_google.dart';

part 'account_event.dart';
part 'account_state.dart';
part 'account_bloc.freezed.dart';

@singleton
class AccountBloc extends Bloc<AccountEvent, AccountState> {
  final LoginUser _loginUser;
  final CreateUser _createUser;
  final AuthorizeWithGoogle _authorizeWithGoogle;

  AccountBloc(this._loginUser, this._authorizeWithGoogle, this._createUser)
      : super(const AccountState.accountInitial()) {
    on<AccountEvent>((event, emit) async {
      if (event is _SignIn) {
        emit(const AccountState.accountInformationLoading());
        final r = await _loginUser(event.email, event.password);
        r.fold(
          (e) => emit(AccountState.accountError(e.message)),
          (t) => emit(const AccountState.signedIn()),
        );
      }

      if (event is _SignUp) {
        emit(const AccountState.accountInformationLoading());
        final r = await _createUser(event.email, event.password);
        r.fold(
          (e) => emit(AccountState.accountError(e.message)),
          (t) => emit(const AccountState.signedIn()),
        );
      }

      if (event is _AuthorizeWithGoogle) {
        emit(const AccountState.accountInformationLoading());
        final r = await _authorizeWithGoogle();
        r.fold(
          (e) => emit(AccountState.accountError(e.message)),
          (t) => emit(const AccountState.signedIn()),
        );
      }
    });
  }
}
