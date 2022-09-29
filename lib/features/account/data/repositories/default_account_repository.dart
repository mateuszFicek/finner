// Package imports:
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';

// Project imports:
import '../../../../utils/failure.dart';
import '../../domain/data_sources/account_data_source.dart';
import '../../domain/repositories/account_repository.dart';

@Injectable(as: AccountRepository)
class DefaultAccountRepository implements AccountRepository {
  final AccountDataSource _dataSource;

  const DefaultAccountRepository(this._dataSource);

  @override
  Future<Either<Failure, User?>> loginUser(String email, String password) =>
      _dataSource.loginUser(email, password);

  @override
  Future<Either<Failure, User?>> createUser(String email, String password) =>
      _dataSource.createUser(email, password);

  @override
  Future<Either<Failure, User?>> authorizeWithGoogle() =>
      _dataSource.authorizeWithGoogle();

  @override
  Future<Either<Failure, User?>> checkUserStatus() =>
      _dataSource.checkUserStatus();
}
