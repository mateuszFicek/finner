// Package imports:
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';

// Project imports:
import '../../../../utils/failure.dart';
import '../../../../utils/network.dart';
import '../../domain/data_sources/template_data_source.dart';

// Project imports:

@Injectable(as: TemplateDataSource)
class DefaultTemplateDataSource implements TemplateDataSource {
  final FirebaseAuth auth;

  DefaultTemplateDataSource(@Named('firebase_auth') this.auth);

  @override
  Future<Either<Failure, String>> getTemplate(
    int page,
  ) async {
    return ioSafe(() async {
      return "";
    });
  }
}
