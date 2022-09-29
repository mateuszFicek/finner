// Package imports:
import 'package:dartz/dartz.dart';
import 'package:finner/features/account/domain/repositories/account_repository.dart';
import 'package:finner/features/account/domain/use_cases/login_user.dart';
import 'package:finner/utils/failure.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockingjay/mockingjay.dart';

class MockAccountRepository extends Mock implements AccountRepository {}

void main() {
  late MockAccountRepository repository;
  late LoginUser loginUser;

  setUp(() {
    repository = MockAccountRepository();
    loginUser = LoginUser(repository);
  });

  test('LoginUser calls repository', () async {
    when(() => repository.loginUser(any(), any())).thenAnswer(
      (_) async => right(null),
    );

    expect(
      await loginUser("test@test.pl", "test1"),
      equals(
        right<Failure, User?>(null),
      ),
    );

    verify(() => repository.loginUser("test@test.pl", "test1"));
  });
}
