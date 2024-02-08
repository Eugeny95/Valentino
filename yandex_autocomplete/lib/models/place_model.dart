import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';
import 'package:yandex_autocomplete/models/subtitle.dart';
import 'package:yandex_autocomplete/models/title.dart';

part 'place_model.g.dart';

@JsonSerializable()
class PlaceModel {
  Title? title;
  Subtitle? subtitle;
  PlaceModel({
    this.title,
    this.subtitle,
  });

  factory PlaceModel.fromJson(Map<String, dynamic> json) {
    return _$PlaceModelFromJson(json);
  }

  /// Connect the generated [_$PersonToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$PlaceModelToJson(this);
}
