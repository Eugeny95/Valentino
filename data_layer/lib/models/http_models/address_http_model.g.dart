// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'address_http_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddressHttpModel _$AddressHttpModelFromJson(Map<String, dynamic> json) =>
    AddressHttpModel(
      doorphone: json['doorphone'] as String?,
      entrance: (json['entrance'] as num?)?.toInt(),
      flat: (json['flat'] as num?)?.toInt(),
      floor: (json['floor'] as num?)?.toInt(),
      house: json['house'] as String?,
      street: json['street'] as String?,
    );

Map<String, dynamic> _$AddressHttpModelToJson(AddressHttpModel instance) =>
    <String, dynamic>{
      'street': instance.street,
      'house': instance.house,
      'flat': instance.flat,
      'entrance': instance.entrance,
      'floor': instance.floor,
      'doorphone': instance.doorphone,
    };
