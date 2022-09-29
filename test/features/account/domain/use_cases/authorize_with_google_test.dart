// Package imports:
import 'package:dartz/dartz.dart';
import 'package:finner/features/account/domain/repositories/account_repository.dart';
import 'package:finner/features/account/domain/use_cases/authorize_with_google.dart';
import 'package:finner/utils/failure.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockingjay/mockingjay.dart';

class MockAccountRepository extends Mock implements AccountRepository {}

void main() {
  late MockAccountRepository repository;
  late AuthorizeWithGoogle authorizeWithGoogle;

  setUp(() {
    repository = MockAccountRepository();
    authorizeWithGoogle = AuthorizeWithGoogle(repository);
  });

  test('AuthorizeWithGoogle calls repository', () async {
    when(() => repository.authorizeWithGoogle()).thenAnswer(
      (_) async => right(null),
    );

    expect(
      await authorizeWithGoogle(),
      equals(
        right<Failure, User?>(null),
      ),
    );

    verify(() => repository.authorizeWithGoogle());
  });
}
