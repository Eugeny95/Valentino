import 'package:data_layer/models/http_models/category_http_model.dart';
import 'package:data_layer/models/http_models/sale_http_model.dart';

import 'package:json_annotation/json_annotation.dart';

part 'information_message_http_model.g.dart';

@JsonSerializable()
class InformationMessageHttpModel {
  /// The generated code assumes these values exist in JSON.
  String? information_message;

  InformationMessageHttpModel({required this.information_message});

  factory InformationMessageHttpModel.fromJson(Map<String, dynamic> json) =>
      _$InformationMessageHttpModelFromJson(json);

  Map<String, dynamic> toJson() => _$InformationMessageHttpModelToJson(this);
}
