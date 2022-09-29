import 'package:bloc_test/bloc_test.dart';
import 'package:finner/features/account/domain/use_cases/authorize_with_google.dart';
import 'package:finner/features/account/domain/use_cases/check_user_status.dart';
import 'package:finner/features/account/domain/use_cases/create_user.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mockingjay/mockingjay.dart';
import 'package:finner/features/account/domain/use_cases/login_user.dart';
import 'package:finner/features/account/presentation/bloc/account_bloc.dart';

class MockAccountBloc extends MockBloc<AccountEvent, AccountState>
    implements AccountBloc {}

class MockLoginUser extends Mock implements LoginUser {}

class MockCreateUser extends Mock implements CreateUser {}

class MockAuthorizeWithGoogle extends Mock implements AuthorizeWithGoogle {}

class MockCheckUserStatus extends Mock implements CheckUserStatus {}

class MockUserCredential extends Mock implements UserCredential {}

class MockUser extends Mock implements User {}
