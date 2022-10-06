// Package imports:
import 'package:dartz/dartz.dart';

// Project imports:
import '../../../../utils/failure.dart';
import '../entities/spending.dart';

abstract class HomeRepository {
  Future<Either<Failure, String>> getHome(int page);

  Future<Either<Failure, List<Spending>>> getCurrentWeekSpendings();
  Future<Either<Failure, double>> getCurrentMonthSpendingLimit();
  Future<Either<Failure, bool>> setMonthSpendingLimit(double limit);
  Future<Either<Failure, bool>> addSpending(Spending spending);
}
