// Package imports:
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

// Project imports:
import '../../../../utils/failure.dart';
import '../repositories/home_repository.dart';

@injectable
class GetCurrentMonthSpendingLimit {
  final HomeRepository repository;

  GetCurrentMonthSpendingLimit(this.repository);

  Future<Either<Failure, double>> call() =>
      repository.getCurrentMonthSpendingLimit();
}
