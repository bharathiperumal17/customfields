import 'package:customfields/core/failure.dart';
import 'package:customfields/feature/dynamic_change_field/data/datasource/api_res_data.dart';
import 'package:customfields/feature/dynamic_change_field/data/model/dynamic_change_model.dart';
import 'package:customfields/feature/dynamic_change_field/domain/reopository/repository_domain.dart';

class RespositoryData implements RepositoryDomain {
  final ApiResponse apiResponse;
  RespositoryData({required this.apiResponse});
  @override
  Future<List<DynamicChangeModel>> fetchData() async {
    try {
      var value = await apiResponse.widgetChanges();
      return (value);
    } catch (e) {
      throw Failure();
    }
  }
}
