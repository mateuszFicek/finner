// Package imports:
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';

// Project imports:
import '../../../../utils/failure.dart';
import '../repositories/account_repository.dart';

@injectable
class LoginUser {
  final AccountRepository accountRepository;

  LoginUser(this.accountRepository);

  Future<Either<Failure, User?>> call(String email, String password) =>
      accountRepository.loginUser(email, password);
}
