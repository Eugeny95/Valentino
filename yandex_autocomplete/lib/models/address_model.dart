import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';
import 'package:yandex_autocomplete/models/component_model.dart';
import 'package:yandex_autocomplete/models/subtitle.dart';
import 'package:yandex_autocomplete/models/title.dart';

part 'address_model.g.dart';

@JsonSerializable()
class AddressModel {
  List<ComponentModel>? component;

  AddressModel({this.component});

  factory AddressModel.fromJson(Map<String, dynamic> json) {
    return _$AddressModelFromJson(json);
  }

  /// Connect the generated [_$PersonToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$AddressModelToJson(this);
}
