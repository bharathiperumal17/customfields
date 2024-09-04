import 'package:customfields/core/usercase.dart';
import 'package:customfields/feature/dynamic_change_field/data/model/dynamic_change_model.dart';
import 'package:customfields/feature/dynamic_change_field/domain/reopository/repository_domain.dart';

class DynamicChangingFieldUsecase
    implements UseCaseNoParmas<List<DynamicChangeModel>> {
  final RepositoryDomain repositoryDomain;
  DynamicChangingFieldUsecase({required this.repositoryDomain});

  @override
  Future<List<DynamicChangeModel>> call() async {
    return await repositoryDomain.fetchData();
  }
}
