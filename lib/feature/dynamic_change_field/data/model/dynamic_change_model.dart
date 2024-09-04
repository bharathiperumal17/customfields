// To parse this JSON data, do
//
//     final dynamicChangeModel = dynamicChangeModelFromJson(jsonString);

import 'dart:convert';

List<DynamicChangeModel> dynamicChangeModelFromJson(String str) =>
    List<DynamicChangeModel>.from(
        json.decode(str).map((x) => DynamicChangeModel.fromJson(x)));

String dynamicChangeModelToJson(List<DynamicChangeModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class DynamicChangeModel {
  String fieldName;
  String widget;
  List<String>? validValues;
  String? visible;

  DynamicChangeModel({
    required this.fieldName,
    required this.widget,
    this.validValues,
    this.visible,
  });

  factory DynamicChangeModel.fromJson(Map<String, dynamic> json) =>
      DynamicChangeModel(
        fieldName: json["field_name"],
        widget: json["widget"],
        validValues: json["valid_values"] == null
            ? []
            : List<String>.from(json["valid_values"]!.map((x) => x)),
        visible: json["visible"],
      );

  Map<String, dynamic> toJson() => {
        "field_name": fieldName,
        "widget": widget,
        "valid_values": validValues == null
            ? []
            : List<dynamic>.from(validValues!.map((x) => x)),
        "visible": visible,
      };
}
