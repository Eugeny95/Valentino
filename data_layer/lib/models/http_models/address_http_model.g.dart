// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'address_http_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddressHttpModel _$AddressHttpModelFromJson(Map<String, dynamic> json) =>
    AddressHttpModel(
      doorphone: json['doorphone'] as String?,
      entrance: json['entrance'] as int?,
      flat: json['flat'] as int?,
      floor: json['floor'] as int?,
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
