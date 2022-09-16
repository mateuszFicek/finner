// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:firebase_auth/firebase_auth.dart' as _i4;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../app_modules/api_module.dart' as _i18;
import '../common/template/data/data_sources/default_template_data_source.dart'
    as _i6;
import '../common/template/data/repositories/default_template_repository.dart'
    as _i8;
import '../common/template/domain/data_sources/template_data_source.dart'
    as _i5;
import '../common/template/domain/repositories/template_repository.dart' as _i7;
import '../common/template/domain/use_cases/get_template.dart' as _i15;
import '../features/account/data/data_sources/default_account_data_source.dart'
    as _i10;
import '../features/account/data/repositories/default_account_repository.dart'
    as _i12;
import '../features/account/domain/data_sources/account_data_source.dart'
    as _i9;
import '../features/account/domain/repositories/account_repository.dart'
    as _i11;
import '../features/account/domain/use_cases/authorize_with_google.dart'
    as _i13;
import '../features/account/domain/use_cases/create_user.dart' as _i14;
import '../features/account/domain/use_cases/login_user.dart' as _i16;
import '../features/account/presentation/bloc/account_bloc.dart' as _i17;
import 'router.dart' as _i3; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  final firebaseClient = _$FirebaseClient();
  gh.singleton<_i3.FinnerRouter>(_i3.FinnerRouter());
  gh.singleton<_i4.FirebaseAuth>(firebaseClient.auth,
      instanceName: 'firebase_auth');
  gh.factory<_i5.TemplateDataSource>(() => _i6.DefaultTemplateDataSource(
      get<_i4.FirebaseAuth>(instanceName: 'firebase_auth')));
  gh.factory<_i7.TemplateRepository>(
      () => _i8.DefaultTemplateRepository(get<_i5.TemplateDataSource>()));
  gh.factory<_i9.AccountDataSource>(() => _i10.DefaultAccountDataSource(
      get<_i4.FirebaseAuth>(instanceName: 'firebase_auth')));
  gh.factory<_i11.AccountRepository>(
      () => _i12.DefaultAccountRepository(get<_i9.AccountDataSource>()));
  gh.factory<_i13.AuthorizeWithGoogle>(
      () => _i13.AuthorizeWithGoogle(get<_i11.AccountRepository>()));
  gh.factory<_i14.CreateUser>(
      () => _i14.CreateUser(get<_i11.AccountRepository>()));
  gh.factory<_i15.GetTemplate>(
      () => _i15.GetTemplate(get<_i7.TemplateRepository>()));
  gh.factory<_i16.LoginUser>(
      () => _i16.LoginUser(get<_i11.AccountRepository>()));
  gh.singleton<_i17.AccountBloc>(_i17.AccountBloc(get<_i16.LoginUser>(),
      get<_i13.AuthorizeWithGoogle>(), get<_i14.CreateUser>()));
  return get;
}

class _$FirebaseClient extends _i18.FirebaseClient {}
