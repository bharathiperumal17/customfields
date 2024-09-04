import 'package:customfields/feature/dynamic_change_field/data/model/dynamic_change_model.dart';

abstract interface class ApiResponse {
  Future<List<DynamicChangeModel>> widgetChanges();
}

class ApiResponseImp implements ApiResponse {
  String apiJson = '''[ 
      { "field_name": "f1", "widget": "dropdown", "valid_values": ["A", "B"] }, 
      { "field_name": "f2", "widget": "textfield", "visible": "A"},
      { "field_name": "f3", "widget": "textfield", "visible": "A" },
      { "field_name": "f4", "widget": "textfield", "visible": "A"}, 
      { "field_name": "f5", "widget": "textfield", "visible": "B" }, 
      { "field_name": "f6", "widget": "textfield", "visible": "B" }
    ]''';

  @override
  Future<List<DynamicChangeModel>> widgetChanges() async {
    try {
      await Future.delayed(const Duration(seconds: 2));

      return dynamicChangeModelFromJson(apiJson);
    } catch (e) {
      print('Error: $e');
      rethrow;
    }
  }
}
