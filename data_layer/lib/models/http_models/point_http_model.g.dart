// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'point_http_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PointHttpModel _$PointHttpModelFromJson(Map<String, dynamic> json) =>
    PointHttpModel(
      x: (json['x'] as num?)?.toDouble(),
      y: (json['y'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$PointHttpModelToJson(PointHttpModel instance) =>
    <String, dynamic>{
      'x': instance.x,
      'y': instance.y,
    };
