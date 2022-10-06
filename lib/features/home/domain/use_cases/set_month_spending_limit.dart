// Package imports:
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

// Project imports:
import '../../../../utils/failure.dart';
import '../repositories/home_repository.dart';

@injectable
class SetMonthSpendingLimit {
  final HomeRepository repository;

  SetMonthSpendingLimit(this.repository);

  Future<Either<Failure, bool>> call(double limit) =>
      repository.setMonthSpendingLimit(limit);
}
