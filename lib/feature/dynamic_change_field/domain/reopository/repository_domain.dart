import 'package:customfields/feature/dynamic_change_field/data/model/dynamic_change_model.dart';

abstract interface class RepositoryDomain {
  Future<List<DynamicChangeModel>> fetchData();
}
