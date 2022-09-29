// Package imports:
import 'package:dartz/dartz.dart';
import 'package:finner/features/account/data/repositories/default_account_repository.dart';
import 'package:finner/features/account/domain/data_sources/account_data_source.dart';
import 'package:finner/utils/failure.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockingjay/mockingjay.dart';

// Project imports:

class MockAccountDataSource extends Mock implements AccountDataSource {}

void main() {
  late MockAccountDataSource dataSource;
  late DefaultAccountRepository repository;

  setUp(() {
    dataSource = MockAccountDataSource();
    repository = DefaultAccountRepository(dataSource);
  });

  test('create user returns response from data source', () async {
    when(() => dataSource.createUser(any(), any())).thenAnswer(
      (_) async => left(const Failure('message')),
    );

    final r = await repository.createUser("", "");

    expect(r, equals(left(const Failure('message'))));
  });

  test('login user returns response from data source', () async {
    when(() => dataSource.loginUser(any(), any())).thenAnswer(
      (_) async => left(const Failure('message')),
    );

    final r = await repository.loginUser("", "");

    expect(r, equals(left(const Failure('message'))));
  });

  test('authorize with Google returns response from data source', () async {
    when(() => dataSource.authorizeWithGoogle()).thenAnswer(
      (_) async => left(const Failure('message')),
    );

    final r = await repository.authorizeWithGoogle();

    expect(r, equals(left(const Failure('message'))));
  });

  test('check user status returns response from data source', () async {
    when(() => dataSource.checkUserStatus()).thenAnswer(
      (_) async => left(const Failure('message')),
    );

    final r = await repository.checkUserStatus();

    expect(r, equals(left(const Failure('message'))));
  });
}
