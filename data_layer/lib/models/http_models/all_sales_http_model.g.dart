// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'all_sales_http_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AllSalesHttpModel _$AllSalesHttpModelFromJson(Map<String, dynamic> json) =>
    AllSalesHttpModel(
      all_actions: (json['all_actions'] as List<dynamic>?)
          ?.map((e) => SaleHttpModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$AllSalesHttpModelToJson(AllSalesHttpModel instance) =>
    <String, dynamic>{
      'all_actions': instance.all_actions,
    };
