import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:finner/features/account/presentation/bloc/account_bloc.dart';
import 'package:finner/utils/failure.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockingjay/mockingjay.dart';
import '../../account_mocks.dart';

void main() {
  late MockCreateUser createUser;
  late MockLoginUser loginUser;
  late MockAuthorizeWithGoogle authorizeWithGoogle;
  late MockCheckUserStatus checkUserStatus;
  late MockUser mockUser;

  setUp(() {
    createUser = MockCreateUser();
    loginUser = MockLoginUser();
    authorizeWithGoogle = MockAuthorizeWithGoogle();
    checkUserStatus = MockCheckUserStatus();
    mockUser = MockUser();
  });
  test('initial state is account initial', () {
    final bloc = AccountBloc(
        loginUser, authorizeWithGoogle, createUser, checkUserStatus);

    expect(
      bloc.state,
      equals(
        const AccountState.accountInitial(),
      ),
    );
  });

  group('account management functions result in success', () {
    blocTest<AccountBloc, AccountState>(
      'log in',
      build: () {
        when(() => loginUser(any(), any())).thenAnswer(
          (i) async => right(null),
        );
        return AccountBloc(
            loginUser, authorizeWithGoogle, createUser, checkUserStatus);
      },
      act: (bloc) => bloc.add(const AccountEvent.signIn("", "")),
      expect: () => [
        equals(
          const AccountState.accountInformationLoading(),
        ),
        equals(
          const AccountState.signedIn(),
        ),
      ],
    );

    blocTest<AccountBloc, AccountState>(
      'create account',
      build: () {
        when(() => createUser(any(), any())).thenAnswer(
          (i) async => right(null),
        );
        return AccountBloc(
            loginUser, authorizeWithGoogle, createUser, checkUserStatus);
      },
      act: (bloc) => bloc.add(const AccountEvent.signUp("", "")),
      expect: () => [
        equals(
          const AccountState.accountInformationLoading(),
        ),
        equals(
          const AccountState.accountCreated(),
        ),
      ],
    );

    blocTest<AccountBloc, AccountState>(
      'google authorization',
      build: () {
        when(() => authorizeWithGoogle()).thenAnswer(
          (i) async => right(null),
        );
        return AccountBloc(
            loginUser, authorizeWithGoogle, createUser, checkUserStatus);
      },
      act: (bloc) => bloc.add(const AccountEvent.authorizeWithGoogle()),
      expect: () => [
        equals(
          const AccountState.accountInformationLoading(),
        ),
        equals(
          const AccountState.signedIn(),
        ),
      ],
    );

    blocTest<AccountBloc, AccountState>(
      'user status when not logged in',
      build: () {
        when(() => checkUserStatus()).thenAnswer(
          (i) async => right(null),
        );
        return AccountBloc(
            loginUser, authorizeWithGoogle, createUser, checkUserStatus);
      },
      act: (bloc) => bloc.add(const AccountEvent.checkUserStatus()),
      expect: () => [
        equals(
          const AccountState.accountInformationLoading(),
        ),
        equals(
          const AccountState.accountError("No user."),
        ),
      ],
    );

    blocTest<AccountBloc, AccountState>(
      'checking if user is logged in',
      build: () {
        when(() => checkUserStatus()).thenAnswer(
          (i) async => right(mockUser),
        );
        return AccountBloc(
            loginUser, authorizeWithGoogle, createUser, checkUserStatus);
      },
      act: (bloc) => bloc.add(const AccountEvent.checkUserStatus()),
      expect: () => [
        equals(
          const AccountState.accountInformationLoading(),
        ),
        equals(
          const AccountState.signedIn(),
        ),
      ],
    );
  });

  group('account management functions result in failure', () {
    blocTest<AccountBloc, AccountState>(
      'log in',
      build: () {
        when(() => loginUser(any(), any())).thenAnswer(
          (i) async => left(const Failure("message")),
        );
        return AccountBloc(
            loginUser, authorizeWithGoogle, createUser, checkUserStatus);
      },
      act: (bloc) => bloc.add(const AccountEvent.signIn("", "")),
      expect: () => [
        equals(
          const AccountState.accountInformationLoading(),
        ),
        equals(
          const AccountState.accountError("message"),
        ),
      ],
    );

    blocTest<AccountBloc, AccountState>(
      'create account',
      build: () {
        when(() => createUser(any(), any())).thenAnswer(
          (i) async => left(const Failure("message")),
        );
        return AccountBloc(
            loginUser, authorizeWithGoogle, createUser, checkUserStatus);
      },
      act: (bloc) => bloc.add(const AccountEvent.signUp("", "")),
      expect: () => [
        equals(
          const AccountState.accountInformationLoading(),
        ),
        equals(
          const AccountState.accountError("message"),
        ),
      ],
    );

    blocTest<AccountBloc, AccountState>(
      'google authorization',
      build: () {
        when(() => authorizeWithGoogle()).thenAnswer(
          (i) async => left(const Failure("message")),
        );
        return AccountBloc(
            loginUser, authorizeWithGoogle, createUser, checkUserStatus);
      },
      act: (bloc) => bloc.add(const AccountEvent.authorizeWithGoogle()),
      expect: () => [
        equals(
          const AccountState.accountInformationLoading(),
        ),
        equals(
          const AccountState.accountError("message"),
        ),
      ],
    );
  });

  blocTest<AccountBloc, AccountState>(
    'checking if user is logged in',
    build: () {
      when(() => checkUserStatus()).thenAnswer(
        (i) async => left(const Failure("message")),
      );
      return AccountBloc(
          loginUser, authorizeWithGoogle, createUser, checkUserStatus);
    },
    act: (bloc) => bloc.add(const AccountEvent.checkUserStatus()),
    expect: () => [
      equals(
        const AccountState.accountInformationLoading(),
      ),
      equals(
        const AccountState.accountError("message"),
      ),
    ],
  );
}
