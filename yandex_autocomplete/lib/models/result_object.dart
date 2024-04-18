// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:yandex_autocomplete/models/place_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'result_object.g.dart';

@JsonSerializable()
class GeoPlace {
  List<PlaceModel>? results;
  GeoPlace({
    this.results,
  });

  factory GeoPlace.fromJson(Map<String, dynamic> json) {
    return _$GeoPlaceFromJson(json);
  }

  /// Connect the generated [_$PersonToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$GeoPlaceToJson(this);
}
