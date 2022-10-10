// Package imports:
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

// Project imports:
import '../../../../utils/failure.dart';
import '../../domain/data_sources/home_data_source.dart';
import '../../domain/entities/spending.dart';
import '../../domain/repositories/home_repository.dart';

@Injectable(as: HomeRepository)
class DefaultHomeRepository implements HomeRepository {
  final HomeDataSource _dataSource;

  const DefaultHomeRepository(this._dataSource);

  @override
  Future<Either<Failure, String>> getHome(int page) =>
      _dataSource.getHome(page);

  @override
  Future<Either<Failure, List<Spending>>> getCurrentWeekSpendings() =>
      _dataSource.getCurrentWeekSpendings();

  @override
  Future<Either<Failure, List<Spending>>> getCurrentMonthSpendings() =>
      _dataSource.getCurrentMonthSpendings();

  @override
  Future<Either<Failure, double>> getCurrentMonthSpendingLimit() =>
      _dataSource.getCurrentMonthSpendingLimit();

  @override
  Future<Either<Failure, bool>> setMonthSpendingLimit(double limit) =>
      _dataSource.setMonthSpendingLimit(limit);

  @override
  Future<Either<Failure, bool>> addSpending(Spending spending) =>
      _dataSource.addSpending(spending);
}
