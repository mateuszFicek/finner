// Package imports:
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

// Project imports:
import '../../../../utils/failure.dart';

abstract class AccountDataSource {
  Future<Either<Failure, User?>> loginUser(
    String email,
    String password,
  );

  Future<Either<Failure, User?>> createUser(
    String email,
    String password,
  );

  Future<Either<Failure, User?>> authorizeWithGoogle();
  Future<Either<Failure, User?>> checkUserStatus();
}
