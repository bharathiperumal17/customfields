import 'package:customfields/feature/dynamic_change_field/data/datasource/api_res_data.dart';
import 'package:customfields/feature/dynamic_change_field/data/repository/respository_data.dart';
import 'package:customfields/feature/dynamic_change_field/domain/usecase/dynamic_change_field.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final apiCall = FutureProvider((ref) async {
  var apiValue = await DynamicChangingFieldUsecase(
          repositoryDomain: RespositoryData(apiResponse: ApiResponseImp()))
      .call();

  return apiValue;
});
final selectedValueProvider = StateProvider<String?>((ref) => null);
