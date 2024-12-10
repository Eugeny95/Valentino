import 'package:data_layer/models/http_models/category_http_model.dart';
import 'package:data_layer/models/http_models/sale_http_model.dart';

import 'package:json_annotation/json_annotation.dart';

part 'all_sales_http_model.g.dart';

@JsonSerializable()
class AllSalesHttpModel {
  /// The generated code assumes these values exist in JSON.
  List<SaleHttpModel>? all_actions;

  AllSalesHttpModel({required this.all_actions});

  factory AllSalesHttpModel.fromJson(Map<String, dynamic> json) =>
      _$AllSalesHttpModelFromJson(json);

  Map<String, dynamic> toJson() => _$AllSalesHttpModelToJson(this);
}
