// Package imports:
import 'package:dartz/dartz.dart';
import 'package:finner/features/home/domain/entities/spending.dart';
import 'package:injectable/injectable.dart';

// Project imports:
import '../../../../utils/failure.dart';
import '../repositories/home_repository.dart';

@injectable
class GetCurrentMonthSpendings {
  final HomeRepository repository;

  GetCurrentMonthSpendings(this.repository);

  Future<Either<Failure, List<Spending>>> call() =>
      repository.getCurrentMonthSpendings();
}
