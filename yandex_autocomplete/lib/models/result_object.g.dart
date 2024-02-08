// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'result_object.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GeoPlace _$GeoPlaceFromJson(Map<String, dynamic> json) => GeoPlace(
      results: (json['results'] as List<dynamic>?)
          ?.map((e) => PlaceModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GeoPlaceToJson(GeoPlace instance) => <String, dynamic>{
      'results': instance.results,
    };
