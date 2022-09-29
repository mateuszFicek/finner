// Package imports:
import 'package:dartz/dartz.dart';
import 'package:finner/features/account/domain/repositories/account_repository.dart';
import 'package:finner/features/account/domain/use_cases/check_user_status.dart';
import 'package:finner/utils/failure.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockingjay/mockingjay.dart';

class MockAccountRepository extends Mock implements AccountRepository {}

void main() {
  late MockAccountRepository repository;
  late CheckUserStatus checkUserStatus;

  setUp(() {
    repository = MockAccountRepository();
    checkUserStatus = CheckUserStatus(repository);
  });

  test('CheckUserStatus calls repository', () async {
    when(() => repository.checkUserStatus()).thenAnswer(
      (_) async => right(null),
    );

    expect(
      await checkUserStatus(),
      equals(
        right<Failure, User?>(null),
      ),
    );

    verify(() => repository.checkUserStatus());
  });
}
