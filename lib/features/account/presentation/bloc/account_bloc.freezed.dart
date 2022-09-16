// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'account_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$AccountEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String email, String password) signIn,
    required TResult Function(String email, String password) signUp,
    required TResult Function() authorizeWithGoogle,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String email, String password)? signIn,
    TResult Function(String email, String password)? signUp,
    TResult Function()? authorizeWithGoogle,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String email, String password)? signIn,
    TResult Function(String email, String password)? signUp,
    TResult Function()? authorizeWithGoogle,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SignIn value) signIn,
    required TResult Function(_SignUp value) signUp,
    required TResult Function(_AuthorizeWithGoogle value) authorizeWithGoogle,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_SignIn value)? signIn,
    TResult Function(_SignUp value)? signUp,
    TResult Function(_AuthorizeWithGoogle value)? authorizeWithGoogle,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SignIn value)? signIn,
    TResult Function(_SignUp value)? signUp,
    TResult Function(_AuthorizeWithGoogle value)? authorizeWithGoogle,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AccountEventCopyWith<$Res> {
  factory $AccountEventCopyWith(
          AccountEvent value, $Res Function(AccountEvent) then) =
      _$AccountEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$AccountEventCopyWithImpl<$Res> implements $AccountEventCopyWith<$Res> {
  _$AccountEventCopyWithImpl(this._value, this._then);

  final AccountEvent _value;
  // ignore: unused_field
  final $Res Function(AccountEvent) _then;
}

/// @nodoc
abstract class _$$_SignInCopyWith<$Res> {
  factory _$$_SignInCopyWith(_$_SignIn value, $Res Function(_$_SignIn) then) =
      __$$_SignInCopyWithImpl<$Res>;
  $Res call({String email, String password});
}

/// @nodoc
class __$$_SignInCopyWithImpl<$Res> extends _$AccountEventCopyWithImpl<$Res>
    implements _$$_SignInCopyWith<$Res> {
  __$$_SignInCopyWithImpl(_$_SignIn _value, $Res Function(_$_SignIn) _then)
      : super(_value, (v) => _then(v as _$_SignIn));

  @override
  _$_SignIn get _value => super._value as _$_SignIn;

  @override
  $Res call({
    Object? email = freezed,
    Object? password = freezed,
  }) {
    return _then(_$_SignIn(
      email == freezed
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      password == freezed
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_SignIn implements _SignIn {
  const _$_SignIn(this.email, this.password);

  @override
  final String email;
  @override
  final String password;

  @override
  String toString() {
    return 'AccountEvent.signIn(email: $email, password: $password)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SignIn &&
            const DeepCollectionEquality().equals(other.email, email) &&
            const DeepCollectionEquality().equals(other.password, password));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(email),
      const DeepCollectionEquality().hash(password));

  @JsonKey(ignore: true)
  @override
  _$$_SignInCopyWith<_$_SignIn> get copyWith =>
      __$$_SignInCopyWithImpl<_$_SignIn>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String email, String password) signIn,
    required TResult Function(String email, String password) signUp,
    required TResult Function() authorizeWithGoogle,
  }) {
    return signIn(email, password);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String email, String password)? signIn,
    TResult Function(String email, String password)? signUp,
    TResult Function()? authorizeWithGoogle,
  }) {
    return signIn?.call(email, password);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String email, String password)? signIn,
    TResult Function(String email, String password)? signUp,
    TResult Function()? authorizeWithGoogle,
    required TResult orElse(),
  }) {
    if (signIn != null) {
      return signIn(email, password);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SignIn value) signIn,
    required TResult Function(_SignUp value) signUp,
    required TResult Function(_AuthorizeWithGoogle value) authorizeWithGoogle,
  }) {
    return signIn(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_SignIn value)? signIn,
    TResult Function(_SignUp value)? signUp,
    TResult Function(_AuthorizeWithGoogle value)? authorizeWithGoogle,
  }) {
    return signIn?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SignIn value)? signIn,
    TResult Function(_SignUp value)? signUp,
    TResult Function(_AuthorizeWithGoogle value)? authorizeWithGoogle,
    required TResult orElse(),
  }) {
    if (signIn != null) {
      return signIn(this);
    }
    return orElse();
  }
}

abstract class _SignIn implements AccountEvent {
  const factory _SignIn(final String email, final String password) = _$_SignIn;

  String get email;
  String get password;
  @JsonKey(ignore: true)
  _$$_SignInCopyWith<_$_SignIn> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_SignUpCopyWith<$Res> {
  factory _$$_SignUpCopyWith(_$_SignUp value, $Res Function(_$_SignUp) then) =
      __$$_SignUpCopyWithImpl<$Res>;
  $Res call({String email, String password});
}

/// @nodoc
class __$$_SignUpCopyWithImpl<$Res> extends _$AccountEventCopyWithImpl<$Res>
    implements _$$_SignUpCopyWith<$Res> {
  __$$_SignUpCopyWithImpl(_$_SignUp _value, $Res Function(_$_SignUp) _then)
      : super(_value, (v) => _then(v as _$_SignUp));

  @override
  _$_SignUp get _value => super._value as _$_SignUp;

  @override
  $Res call({
    Object? email = freezed,
    Object? password = freezed,
  }) {
    return _then(_$_SignUp(
      email == freezed
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      password == freezed
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_SignUp implements _SignUp {
  const _$_SignUp(this.email, this.password);

  @override
  final String email;
  @override
  final String password;

  @override
  String toString() {
    return 'AccountEvent.signUp(email: $email, password: $password)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SignUp &&
            const DeepCollectionEquality().equals(other.email, email) &&
            const DeepCollectionEquality().equals(other.password, password));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(email),
      const DeepCollectionEquality().hash(password));

  @JsonKey(ignore: true)
  @override
  _$$_SignUpCopyWith<_$_SignUp> get copyWith =>
      __$$_SignUpCopyWithImpl<_$_SignUp>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String email, String password) signIn,
    required TResult Function(String email, String password) signUp,
    required TResult Function() authorizeWithGoogle,
  }) {
    return signUp(email, password);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String email, String password)? signIn,
    TResult Function(String email, String password)? signUp,
    TResult Function()? authorizeWithGoogle,
  }) {
    return signUp?.call(email, password);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String email, String password)? signIn,
    TResult Function(String email, String password)? signUp,
    TResult Function()? authorizeWithGoogle,
    required TResult orElse(),
  }) {
    if (signUp != null) {
      return signUp(email, password);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SignIn value) signIn,
    required TResult Function(_SignUp value) signUp,
    required TResult Function(_AuthorizeWithGoogle value) authorizeWithGoogle,
  }) {
    return signUp(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_SignIn value)? signIn,
    TResult Function(_SignUp value)? signUp,
    TResult Function(_AuthorizeWithGoogle value)? authorizeWithGoogle,
  }) {
    return signUp?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SignIn value)? signIn,
    TResult Function(_SignUp value)? signUp,
    TResult Function(_AuthorizeWithGoogle value)? authorizeWithGoogle,
    required TResult orElse(),
  }) {
    if (signUp != null) {
      return signUp(this);
    }
    return orElse();
  }
}

abstract class _SignUp implements AccountEvent {
  const factory _SignUp(final String email, final String password) = _$_SignUp;

  String get email;
  String get password;
  @JsonKey(ignore: true)
  _$$_SignUpCopyWith<_$_SignUp> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_AuthorizeWithGoogleCopyWith<$Res> {
  factory _$$_AuthorizeWithGoogleCopyWith(_$_AuthorizeWithGoogle value,
          $Res Function(_$_AuthorizeWithGoogle) then) =
      __$$_AuthorizeWithGoogleCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_AuthorizeWithGoogleCopyWithImpl<$Res>
    extends _$AccountEventCopyWithImpl<$Res>
    implements _$$_AuthorizeWithGoogleCopyWith<$Res> {
  __$$_AuthorizeWithGoogleCopyWithImpl(_$_AuthorizeWithGoogle _value,
      $Res Function(_$_AuthorizeWithGoogle) _then)
      : super(_value, (v) => _then(v as _$_AuthorizeWithGoogle));

  @override
  _$_AuthorizeWithGoogle get _value => super._value as _$_AuthorizeWithGoogle;
}

/// @nodoc

class _$_AuthorizeWithGoogle implements _AuthorizeWithGoogle {
  const _$_AuthorizeWithGoogle();

  @override
  String toString() {
    return 'AccountEvent.authorizeWithGoogle()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_AuthorizeWithGoogle);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String email, String password) signIn,
    required TResult Function(String email, String password) signUp,
    required TResult Function() authorizeWithGoogle,
  }) {
    return authorizeWithGoogle();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String email, String password)? signIn,
    TResult Function(String email, String password)? signUp,
    TResult Function()? authorizeWithGoogle,
  }) {
    return authorizeWithGoogle?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String email, String password)? signIn,
    TResult Function(String email, String password)? signUp,
    TResult Function()? authorizeWithGoogle,
    required TResult orElse(),
  }) {
    if (authorizeWithGoogle != null) {
      return authorizeWithGoogle();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SignIn value) signIn,
    required TResult Function(_SignUp value) signUp,
    required TResult Function(_AuthorizeWithGoogle value) authorizeWithGoogle,
  }) {
    return authorizeWithGoogle(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_SignIn value)? signIn,
    TResult Function(_SignUp value)? signUp,
    TResult Function(_AuthorizeWithGoogle value)? authorizeWithGoogle,
  }) {
    return authorizeWithGoogle?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SignIn value)? signIn,
    TResult Function(_SignUp value)? signUp,
    TResult Function(_AuthorizeWithGoogle value)? authorizeWithGoogle,
    required TResult orElse(),
  }) {
    if (authorizeWithGoogle != null) {
      return authorizeWithGoogle(this);
    }
    return orElse();
  }
}

abstract class _AuthorizeWithGoogle implements AccountEvent {
  const factory _AuthorizeWithGoogle() = _$_AuthorizeWithGoogle;
}

/// @nodoc
mixin _$AccountState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() accountInitial,
    required TResult Function() accountInformationLoading,
    required TResult Function(String message) accountError,
    required TResult Function() accountCreated,
    required TResult Function() signedIn,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? accountInitial,
    TResult Function()? accountInformationLoading,
    TResult Function(String message)? accountError,
    TResult Function()? accountCreated,
    TResult Function()? signedIn,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? accountInitial,
    TResult Function()? accountInformationLoading,
    TResult Function(String message)? accountError,
    TResult Function()? accountCreated,
    TResult Function()? signedIn,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AccountInitial value) accountInitial,
    required TResult Function(_AccountInformationLoading value)
        accountInformationLoading,
    required TResult Function(_AccountError value) accountError,
    required TResult Function(_AccountCreated value) accountCreated,
    required TResult Function(_SignedIn value) signedIn,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_AccountInitial value)? accountInitial,
    TResult Function(_AccountInformationLoading value)?
        accountInformationLoading,
    TResult Function(_AccountError value)? accountError,
    TResult Function(_AccountCreated value)? accountCreated,
    TResult Function(_SignedIn value)? signedIn,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AccountInitial value)? accountInitial,
    TResult Function(_AccountInformationLoading value)?
        accountInformationLoading,
    TResult Function(_AccountError value)? accountError,
    TResult Function(_AccountCreated value)? accountCreated,
    TResult Function(_SignedIn value)? signedIn,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AccountStateCopyWith<$Res> {
  factory $AccountStateCopyWith(
          AccountState value, $Res Function(AccountState) then) =
      _$AccountStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$AccountStateCopyWithImpl<$Res> implements $AccountStateCopyWith<$Res> {
  _$AccountStateCopyWithImpl(this._value, this._then);

  final AccountState _value;
  // ignore: unused_field
  final $Res Function(AccountState) _then;
}

/// @nodoc
abstract class _$$_AccountInitialCopyWith<$Res> {
  factory _$$_AccountInitialCopyWith(
          _$_AccountInitial value, $Res Function(_$_AccountInitial) then) =
      __$$_AccountInitialCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_AccountInitialCopyWithImpl<$Res>
    extends _$AccountStateCopyWithImpl<$Res>
    implements _$$_AccountInitialCopyWith<$Res> {
  __$$_AccountInitialCopyWithImpl(
      _$_AccountInitial _value, $Res Function(_$_AccountInitial) _then)
      : super(_value, (v) => _then(v as _$_AccountInitial));

  @override
  _$_AccountInitial get _value => super._value as _$_AccountInitial;
}

/// @nodoc

class _$_AccountInitial implements _AccountInitial {
  const _$_AccountInitial();

  @override
  String toString() {
    return 'AccountState.accountInitial()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_AccountInitial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() accountInitial,
    required TResult Function() accountInformationLoading,
    required TResult Function(String message) accountError,
    required TResult Function() accountCreated,
    required TResult Function() signedIn,
  }) {
    return accountInitial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? accountInitial,
    TResult Function()? accountInformationLoading,
    TResult Function(String message)? accountError,
    TResult Function()? accountCreated,
    TResult Function()? signedIn,
  }) {
    return accountInitial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? accountInitial,
    TResult Function()? accountInformationLoading,
    TResult Function(String message)? accountError,
    TResult Function()? accountCreated,
    TResult Function()? signedIn,
    required TResult orElse(),
  }) {
    if (accountInitial != null) {
      return accountInitial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AccountInitial value) accountInitial,
    required TResult Function(_AccountInformationLoading value)
        accountInformationLoading,
    required TResult Function(_AccountError value) accountError,
    required TResult Function(_AccountCreated value) accountCreated,
    required TResult Function(_SignedIn value) signedIn,
  }) {
    return accountInitial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_AccountInitial value)? accountInitial,
    TResult Function(_AccountInformationLoading value)?
        accountInformationLoading,
    TResult Function(_AccountError value)? accountError,
    TResult Function(_AccountCreated value)? accountCreated,
    TResult Function(_SignedIn value)? signedIn,
  }) {
    return accountInitial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AccountInitial value)? accountInitial,
    TResult Function(_AccountInformationLoading value)?
        accountInformationLoading,
    TResult Function(_AccountError value)? accountError,
    TResult Function(_AccountCreated value)? accountCreated,
    TResult Function(_SignedIn value)? signedIn,
    required TResult orElse(),
  }) {
    if (accountInitial != null) {
      return accountInitial(this);
    }
    return orElse();
  }
}

abstract class _AccountInitial implements AccountState {
  const factory _AccountInitial() = _$_AccountInitial;
}

/// @nodoc
abstract class _$$_AccountInformationLoadingCopyWith<$Res> {
  factory _$$_AccountInformationLoadingCopyWith(
          _$_AccountInformationLoading value,
          $Res Function(_$_AccountInformationLoading) then) =
      __$$_AccountInformationLoadingCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_AccountInformationLoadingCopyWithImpl<$Res>
    extends _$AccountStateCopyWithImpl<$Res>
    implements _$$_AccountInformationLoadingCopyWith<$Res> {
  __$$_AccountInformationLoadingCopyWithImpl(
      _$_AccountInformationLoading _value,
      $Res Function(_$_AccountInformationLoading) _then)
      : super(_value, (v) => _then(v as _$_AccountInformationLoading));

  @override
  _$_AccountInformationLoading get _value =>
      super._value as _$_AccountInformationLoading;
}

/// @nodoc

class _$_AccountInformationLoading implements _AccountInformationLoading {
  const _$_AccountInformationLoading();

  @override
  String toString() {
    return 'AccountState.accountInformationLoading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AccountInformationLoading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() accountInitial,
    required TResult Function() accountInformationLoading,
    required TResult Function(String message) accountError,
    required TResult Function() accountCreated,
    required TResult Function() signedIn,
  }) {
    return accountInformationLoading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? accountInitial,
    TResult Function()? accountInformationLoading,
    TResult Function(String message)? accountError,
    TResult Function()? accountCreated,
    TResult Function()? signedIn,
  }) {
    return accountInformationLoading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? accountInitial,
    TResult Function()? accountInformationLoading,
    TResult Function(String message)? accountError,
    TResult Function()? accountCreated,
    TResult Function()? signedIn,
    required TResult orElse(),
  }) {
    if (accountInformationLoading != null) {
      return accountInformationLoading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AccountInitial value) accountInitial,
    required TResult Function(_AccountInformationLoading value)
        accountInformationLoading,
    required TResult Function(_AccountError value) accountError,
    required TResult Function(_AccountCreated value) accountCreated,
    required TResult Function(_SignedIn value) signedIn,
  }) {
    return accountInformationLoading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_AccountInitial value)? accountInitial,
    TResult Function(_AccountInformationLoading value)?
        accountInformationLoading,
    TResult Function(_AccountError value)? accountError,
    TResult Function(_AccountCreated value)? accountCreated,
    TResult Function(_SignedIn value)? signedIn,
  }) {
    return accountInformationLoading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AccountInitial value)? accountInitial,
    TResult Function(_AccountInformationLoading value)?
        accountInformationLoading,
    TResult Function(_AccountError value)? accountError,
    TResult Function(_AccountCreated value)? accountCreated,
    TResult Function(_SignedIn value)? signedIn,
    required TResult orElse(),
  }) {
    if (accountInformationLoading != null) {
      return accountInformationLoading(this);
    }
    return orElse();
  }
}

abstract class _AccountInformationLoading implements AccountState {
  const factory _AccountInformationLoading() = _$_AccountInformationLoading;
}

/// @nodoc
abstract class _$$_AccountErrorCopyWith<$Res> {
  factory _$$_AccountErrorCopyWith(
          _$_AccountError value, $Res Function(_$_AccountError) then) =
      __$$_AccountErrorCopyWithImpl<$Res>;
  $Res call({String message});
}

/// @nodoc
class __$$_AccountErrorCopyWithImpl<$Res>
    extends _$AccountStateCopyWithImpl<$Res>
    implements _$$_AccountErrorCopyWith<$Res> {
  __$$_AccountErrorCopyWithImpl(
      _$_AccountError _value, $Res Function(_$_AccountError) _then)
      : super(_value, (v) => _then(v as _$_AccountError));

  @override
  _$_AccountError get _value => super._value as _$_AccountError;

  @override
  $Res call({
    Object? message = freezed,
  }) {
    return _then(_$_AccountError(
      message == freezed
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_AccountError implements _AccountError {
  const _$_AccountError(this.message);

  @override
  final String message;

  @override
  String toString() {
    return 'AccountState.accountError(message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AccountError &&
            const DeepCollectionEquality().equals(other.message, message));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(message));

  @JsonKey(ignore: true)
  @override
  _$$_AccountErrorCopyWith<_$_AccountError> get copyWith =>
      __$$_AccountErrorCopyWithImpl<_$_AccountError>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() accountInitial,
    required TResult Function() accountInformationLoading,
    required TResult Function(String message) accountError,
    required TResult Function() accountCreated,
    required TResult Function() signedIn,
  }) {
    return accountError(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? accountInitial,
    TResult Function()? accountInformationLoading,
    TResult Function(String message)? accountError,
    TResult Function()? accountCreated,
    TResult Function()? signedIn,
  }) {
    return accountError?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? accountInitial,
    TResult Function()? accountInformationLoading,
    TResult Function(String message)? accountError,
    TResult Function()? accountCreated,
    TResult Function()? signedIn,
    required TResult orElse(),
  }) {
    if (accountError != null) {
      return accountError(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AccountInitial value) accountInitial,
    required TResult Function(_AccountInformationLoading value)
        accountInformationLoading,
    required TResult Function(_AccountError value) accountError,
    required TResult Function(_AccountCreated value) accountCreated,
    required TResult Function(_SignedIn value) signedIn,
  }) {
    return accountError(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_AccountInitial value)? accountInitial,
    TResult Function(_AccountInformationLoading value)?
        accountInformationLoading,
    TResult Function(_AccountError value)? accountError,
    TResult Function(_AccountCreated value)? accountCreated,
    TResult Function(_SignedIn value)? signedIn,
  }) {
    return accountError?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AccountInitial value)? accountInitial,
    TResult Function(_AccountInformationLoading value)?
        accountInformationLoading,
    TResult Function(_AccountError value)? accountError,
    TResult Function(_AccountCreated value)? accountCreated,
    TResult Function(_SignedIn value)? signedIn,
    required TResult orElse(),
  }) {
    if (accountError != null) {
      return accountError(this);
    }
    return orElse();
  }
}

abstract class _AccountError implements AccountState {
  const factory _AccountError(final String message) = _$_AccountError;

  String get message;
  @JsonKey(ignore: true)
  _$$_AccountErrorCopyWith<_$_AccountError> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_AccountCreatedCopyWith<$Res> {
  factory _$$_AccountCreatedCopyWith(
          _$_AccountCreated value, $Res Function(_$_AccountCreated) then) =
      __$$_AccountCreatedCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_AccountCreatedCopyWithImpl<$Res>
    extends _$AccountStateCopyWithImpl<$Res>
    implements _$$_AccountCreatedCopyWith<$Res> {
  __$$_AccountCreatedCopyWithImpl(
      _$_AccountCreated _value, $Res Function(_$_AccountCreated) _then)
      : super(_value, (v) => _then(v as _$_AccountCreated));

  @override
  _$_AccountCreated get _value => super._value as _$_AccountCreated;
}

/// @nodoc

class _$_AccountCreated implements _AccountCreated {
  const _$_AccountCreated();

  @override
  String toString() {
    return 'AccountState.accountCreated()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_AccountCreated);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() accountInitial,
    required TResult Function() accountInformationLoading,
    required TResult Function(String message) accountError,
    required TResult Function() accountCreated,
    required TResult Function() signedIn,
  }) {
    return accountCreated();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? accountInitial,
    TResult Function()? accountInformationLoading,
    TResult Function(String message)? accountError,
    TResult Function()? accountCreated,
    TResult Function()? signedIn,
  }) {
    return accountCreated?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? accountInitial,
    TResult Function()? accountInformationLoading,
    TResult Function(String message)? accountError,
    TResult Function()? accountCreated,
    TResult Function()? signedIn,
    required TResult orElse(),
  }) {
    if (accountCreated != null) {
      return accountCreated();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AccountInitial value) accountInitial,
    required TResult Function(_AccountInformationLoading value)
        accountInformationLoading,
    required TResult Function(_AccountError value) accountError,
    required TResult Function(_AccountCreated value) accountCreated,
    required TResult Function(_SignedIn value) signedIn,
  }) {
    return accountCreated(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_AccountInitial value)? accountInitial,
    TResult Function(_AccountInformationLoading value)?
        accountInformationLoading,
    TResult Function(_AccountError value)? accountError,
    TResult Function(_AccountCreated value)? accountCreated,
    TResult Function(_SignedIn value)? signedIn,
  }) {
    return accountCreated?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AccountInitial value)? accountInitial,
    TResult Function(_AccountInformationLoading value)?
        accountInformationLoading,
    TResult Function(_AccountError value)? accountError,
    TResult Function(_AccountCreated value)? accountCreated,
    TResult Function(_SignedIn value)? signedIn,
    required TResult orElse(),
  }) {
    if (accountCreated != null) {
      return accountCreated(this);
    }
    return orElse();
  }
}

abstract class _AccountCreated implements AccountState {
  const factory _AccountCreated() = _$_AccountCreated;
}

/// @nodoc
abstract class _$$_SignedInCopyWith<$Res> {
  factory _$$_SignedInCopyWith(
          _$_SignedIn value, $Res Function(_$_SignedIn) then) =
      __$$_SignedInCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_SignedInCopyWithImpl<$Res> extends _$AccountStateCopyWithImpl<$Res>
    implements _$$_SignedInCopyWith<$Res> {
  __$$_SignedInCopyWithImpl(
      _$_SignedIn _value, $Res Function(_$_SignedIn) _then)
      : super(_value, (v) => _then(v as _$_SignedIn));

  @override
  _$_SignedIn get _value => super._value as _$_SignedIn;
}

/// @nodoc

class _$_SignedIn implements _SignedIn {
  const _$_SignedIn();

  @override
  String toString() {
    return 'AccountState.signedIn()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_SignedIn);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() accountInitial,
    required TResult Function() accountInformationLoading,
    required TResult Function(String message) accountError,
    required TResult Function() accountCreated,
    required TResult Function() signedIn,
  }) {
    return signedIn();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? accountInitial,
    TResult Function()? accountInformationLoading,
    TResult Function(String message)? accountError,
    TResult Function()? accountCreated,
    TResult Function()? signedIn,
  }) {
    return signedIn?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? accountInitial,
    TResult Function()? accountInformationLoading,
    TResult Function(String message)? accountError,
    TResult Function()? accountCreated,
    TResult Function()? signedIn,
    required TResult orElse(),
  }) {
    if (signedIn != null) {
      return signedIn();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AccountInitial value) accountInitial,
    required TResult Function(_AccountInformationLoading value)
        accountInformationLoading,
    required TResult Function(_AccountError value) accountError,
    required TResult Function(_AccountCreated value) accountCreated,
    required TResult Function(_SignedIn value) signedIn,
  }) {
    return signedIn(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_AccountInitial value)? accountInitial,
    TResult Function(_AccountInformationLoading value)?
        accountInformationLoading,
    TResult Function(_AccountError value)? accountError,
    TResult Function(_AccountCreated value)? accountCreated,
    TResult Function(_SignedIn value)? signedIn,
  }) {
    return signedIn?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AccountInitial value)? accountInitial,
    TResult Function(_AccountInformationLoading value)?
        accountInformationLoading,
    TResult Function(_AccountError value)? accountError,
    TResult Function(_AccountCreated value)? accountCreated,
    TResult Function(_SignedIn value)? signedIn,
    required TResult orElse(),
  }) {
    if (signedIn != null) {
      return signedIn(this);
    }
    return orElse();
  }
}

abstract class _SignedIn implements AccountState {
  const factory _SignedIn() = _$_SignedIn;
}
