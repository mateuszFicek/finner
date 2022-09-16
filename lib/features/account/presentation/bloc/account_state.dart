part of 'account_bloc.dart';

@freezed
class AccountState with _$AccountState {
  const factory AccountState.accountInitial() = _AccountInitial;

  const factory AccountState.accountInformationLoading() =
      _AccountInformationLoading;

  const factory AccountState.accountError(String message) = _AccountError;
  const factory AccountState.accountCreated() = _AccountCreated;
  const factory AccountState.signedIn() = _SignedIn;
}
