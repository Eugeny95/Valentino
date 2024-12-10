import 'package:data_layer/models/http_models/category_http_model.dart';
import 'package:data_layer/models/http_models/sale_http_model.dart';

import 'package:json_annotation/json_annotation.dart';

part 'available_sales_http_model.g.dart';

@JsonSerializable()
class AvailableSalesHttpModel {
  /// The generated code assumes these values exist in JSON.
  List<SaleHttpModel>? available_actions;

  AvailableSalesHttpModel({required this.available_actions});

  factory AvailableSalesHttpModel.fromJson(Map<String, dynamic> json) =>
      _$AvailableSalesHttpModelFromJson(json);

  Map<String, dynamic> toJson() => _$AvailableSalesHttpModelToJson(this);
}
