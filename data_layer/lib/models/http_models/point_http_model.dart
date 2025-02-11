import 'dart:ffi';

import 'package:json_annotation/json_annotation.dart';

part 'point_http_model.g.dart';

@JsonSerializable()
class PointHttpModel {
  double? x;
  double? y;

  PointHttpModel({required this.x, required this.y});

  factory PointHttpModel.fromJson(Map<String, dynamic> json) =>
      _$PointHttpModelFromJson(json);

  Map<String, dynamic> toJson() => _$PointHttpModelToJson(this);
}
