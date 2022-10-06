// Package imports:
import 'package:dartz/dartz.dart';
import 'package:finner/features/home/domain/entities/spending.dart';
import 'package:injectable/injectable.dart';

// Project imports:
import '../../../../utils/failure.dart';
import '../repositories/home_repository.dart';

@injectable
class AddSpending {
  final HomeRepository repository;

  AddSpending(this.repository);

  Future<Either<Failure, bool>> call(Spending spending) =>
      repository.addSpending(spending);
}
