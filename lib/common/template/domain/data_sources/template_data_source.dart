// Package imports:
import 'package:dartz/dartz.dart';

// Project imports:
import '../../../../utils/failure.dart';

abstract class TemplateDataSource {
  Future<Either<Failure, String>> getTemplate(
    int page,
  );
}
