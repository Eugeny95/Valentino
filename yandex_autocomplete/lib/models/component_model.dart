import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';
import 'package:yandex_autocomplete/models/subtitle.dart';
import 'package:yandex_autocomplete/models/title.dart';

part 'component_model.g.dart';

@JsonSerializable()
class ComponentModel {
  String? name;
  List<String>? kind;
  ComponentModel({this.name, this.kind});

  factory ComponentModel.fromJson(Map<String, dynamic> json) {
    return _$ComponentModelFromJson(json);
  }

  /// Connect the generated [_$PersonToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$ComponentModelToJson(this);
}
