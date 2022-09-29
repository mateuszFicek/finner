// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:firebase_auth/firebase_auth.dart' as _i5;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../app_modules/api_module.dart' as _i20;
import '../app_modules/configuration/app_settings_cubit.dart' as _i3;
import '../common/template/data/data_sources/default_template_data_source.dart'
    as _i7;
import '../common/template/data/repositories/default_template_repository.dart'
    as _i9;
import '../common/template/domain/data_sources/template_data_source.dart'
    as _i6;
import '../common/template/domain/repositories/template_repository.dart' as _i8;
import '../common/template/domain/use_cases/get_template.dart' as _i17;
import '../features/account/data/data_sources/default_account_data_source.dart'
    as _i11;
import '../features/account/data/repositories/default_account_repository.dart'
    as _i13;
import '../features/account/domain/data_sources/account_data_source.dart'
    as _i10;
import '../features/account/domain/repositories/account_repository.dart'
    as _i12;
import '../features/account/domain/use_cases/authorize_with_google.dart'
    as _i14;
import '../features/account/domain/use_cases/check_user_status.dart' as _i15;
import '../features/account/domain/use_cases/create_user.dart' as _i16;
import '../features/account/domain/use_cases/login_user.dart' as _i18;
import '../features/account/presentation/bloc/account_bloc.dart' as _i19;
import 'router.dart' as _i4; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(
  _i1.GetIt get, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) {
  final gh = _i2.GetItHelper(
    get,
    environment,
    environmentFilter,
  );
  final firebaseClient = _$FirebaseClient();
  gh.singleton<_i3.AppSettingsCubit>(_i3.AppSettingsCubit());
  gh.singleton<_i4.FinnerRouter>(_i4.FinnerRouter());
  gh.singleton<_i5.FirebaseAuth>(
    firebaseClient.auth,
    instanceName: 'firebase_auth',
  );
  gh.factory<_i6.TemplateDataSource>(() => _i7.DefaultTemplateDataSource(
      get<_i5.FirebaseAuth>(instanceName: 'firebase_auth')));
  gh.factory<_i8.TemplateRepository>(
      () => _i9.DefaultTemplateRepository(get<_i6.TemplateDataSource>()));
  gh.factory<_i10.AccountDataSource>(() => _i11.DefaultAccountDataSource(
      get<_i5.FirebaseAuth>(instanceName: 'firebase_auth')));
  gh.factory<_i12.AccountRepository>(
      () => _i13.DefaultAccountRepository(get<_i10.AccountDataSource>()));
  gh.factory<_i14.AuthorizeWithGoogle>(
      () => _i14.AuthorizeWithGoogle(get<_i12.AccountRepository>()));
  gh.factory<_i15.CheckUserStatus>(
      () => _i15.CheckUserStatus(get<_i12.AccountRepository>()));
  gh.factory<_i16.CreateUser>(
      () => _i16.CreateUser(get<_i12.AccountRepository>()));
  gh.factory<_i17.GetTemplate>(
      () => _i17.GetTemplate(get<_i8.TemplateRepository>()));
  gh.factory<_i18.LoginUser>(
      () => _i18.LoginUser(get<_i12.AccountRepository>()));
  gh.singleton<_i19.AccountBloc>(_i19.AccountBloc(
    get<_i18.LoginUser>(),
    get<_i14.AuthorizeWithGoogle>(),
    get<_i16.CreateUser>(),
    get<_i15.CheckUserStatus>(),
  ));
  return get;
}

class _$FirebaseClient extends _i20.FirebaseClient {}
