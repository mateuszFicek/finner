// Package imports:
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

// Project imports:
import '../../../../utils/failure.dart';
import '../repositories/home_repository.dart';

@injectable
class GetTemplate {
  final HomeRepository groupRepository;

  GetTemplate(this.groupRepository);

  Future<Either<Failure, String>> call(int groupId) =>
      groupRepository.getHome(groupId);
}
