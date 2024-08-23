// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'position_http_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PositionHttpModel _$PositionHttpModelFromJson(Map<String, dynamic> json) =>
    PositionHttpModel(
      amount: (json['amount'] as num?)?.toInt(),
      modifiers: (json['modifiers'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      productId: json['productId'] as String?,
    );

Map<String, dynamic> _$PositionHttpModelToJson(PositionHttpModel instance) =>
    <String, dynamic>{
      'modifiers': instance.modifiers,
      'productId': instance.productId,
      'amount': instance.amount,
    };
