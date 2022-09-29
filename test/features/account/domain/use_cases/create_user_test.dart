// Package imports:
import 'package:dartz/dartz.dart';
import 'package:finner/features/account/domain/repositories/account_repository.dart';
import 'package:finner/features/account/domain/use_cases/create_user.dart';
import 'package:finner/utils/failure.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockingjay/mockingjay.dart';

class MockAccountRepository extends Mock implements AccountRepository {}

void main() {
  late MockAccountRepository repository;
  late CreateUser createUser;

  setUp(() {
    repository = MockAccountRepository();
    createUser = CreateUser(repository);
  });

  test('CreateUser calls repository', () async {
    when(() => repository.createUser(any(), any())).thenAnswer(
      (_) async => right(null),
    );

    expect(
      await createUser("test@test.pl", "test1"),
      equals(
        right<Failure, User?>(null),
      ),
    );

    verify(() => repository.createUser("test@test.pl", "test1"));
  });
}
