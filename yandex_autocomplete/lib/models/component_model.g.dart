// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'component_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ComponentModel _$ComponentModelFromJson(Map<String, dynamic> json) =>
    ComponentModel(
      name: json['name'] as String?,
      kind: (json['kind'] as List<dynamic>?)?.map((e) => e as String).toList(),
    );

Map<String, dynamic> _$ComponentModelToJson(ComponentModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'kind': instance.kind,
    };
