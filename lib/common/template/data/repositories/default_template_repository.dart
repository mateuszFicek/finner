// Package imports:
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

// Project imports:
import '../../../../utils/failure.dart';
import '../../domain/data_sources/template_data_source.dart';
import '../../domain/repositories/template_repository.dart';

@Injectable(as: TemplateRepository)
class DefaultTemplateRepository implements TemplateRepository {
  final TemplateDataSource _dataSource;

  const DefaultTemplateRepository(this._dataSource);

  @override
  Future<Either<Failure, String>> getTemplate(int page) =>
      _dataSource.getTemplate(page);
}
