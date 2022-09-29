// Package imports:

// Package imports:
import 'package:dartz/dartz.dart';
import 'package:finner/features/account/data/data_sources/default_account_data_source.dart';
import 'package:finner/utils/failure.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockingjay/mockingjay.dart';

import '../../../common_mocks.dart';
import '../account_mocks.dart';

void main() {
  late DefaultAccountDataSource dataSource;
  late MockFirebaseAuth mockFirebaseAuth;
  late MockUserCredential mockUserCredential;
  late MockUser mockUser;

  setUp(() {
    mockFirebaseAuth = MockFirebaseAuth();
    dataSource = DefaultAccountDataSource(mockFirebaseAuth);
    mockUserCredential = MockUserCredential();
    mockUser = MockUser();
  });

  test('creating user', () async {
    when(
      () => mockFirebaseAuth.createUserWithEmailAndPassword(
          email: "", password: ""),
    ).thenAnswer(
      (_) async => mockUserCredential,
    );

    const expected = null;

    final r = await dataSource.createUser("", "");

    expect(
      r,
      equals(right<Failure, User?>(expected)),
    );
  });

  test('loggin user', () async {
    when(
      () =>
          mockFirebaseAuth.signInWithEmailAndPassword(email: "", password: ""),
    ).thenAnswer(
      (_) async => mockUserCredential,
    );

    const expected = null;

    final r = await dataSource.loginUser("", "");

    expect(
      r,
      equals(right<Failure, User?>(expected)),
    );
  });
  test('user status', () async {
    when(
      () => mockFirebaseAuth.currentUser,
    ).thenAnswer(
      (_) => mockUser,
    );

    var expected = mockUser;

    final r = await dataSource.checkUserStatus();

    expect(
      r,
      equals(right<Failure, User?>(expected)),
    );
  });
}
