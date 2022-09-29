// Package imports:
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';

// Project imports:
import '../../../../utils/failure.dart';
import '../repositories/account_repository.dart';

@injectable
class CheckUserStatus {
  final AccountRepository groupRepository;

  CheckUserStatus(this.groupRepository);

  Future<Either<Failure, User?>> call() => groupRepository.checkUserStatus();
}
