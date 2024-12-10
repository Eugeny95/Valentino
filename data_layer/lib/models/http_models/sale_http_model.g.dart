// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sale_http_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SaleHttpModel _$SaleHttpModelFromJson(Map<String, dynamic> json) =>
    SaleHttpModel(
      id: (json['id'] as num?)?.toInt(),
      title: json['title'] as String?,
      descryption: json['descryption'] as String?,
      image: json['image'] as String?,
    );

Map<String, dynamic> _$SaleHttpModelToJson(SaleHttpModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'descryption': instance.descryption,
      'image': instance.image,
    };
