part of 'account_bloc.dart';

@freezed
class AccountEvent with _$AccountEvent {
  const factory AccountEvent.signIn(String email, String password) = _SignIn;
  const factory AccountEvent.signUp(String email, String password) = _SignUp;
  const factory AccountEvent.authorizeWithGoogle() = _AuthorizeWithGoogle;
}
