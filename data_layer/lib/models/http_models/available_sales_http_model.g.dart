// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'available_sales_http_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AvailableSalesHttpModel _$AvailableSalesHttpModelFromJson(
        Map<String, dynamic> json) =>
    AvailableSalesHttpModel(
      available_actions: (json['available_actions'] as List<dynamic>?)
          ?.map((e) => SaleHttpModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$AvailableSalesHttpModelToJson(
        AvailableSalesHttpModel instance) =>
    <String, dynamic>{
      'available_actions': instance.available_actions,
    };
