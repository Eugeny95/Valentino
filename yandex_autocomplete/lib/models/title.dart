import 'dart:convert';
import 'package:json_annotation/json_annotation.dart';
import 'package:yandex_autocomplete/models/text.dart';

part 'title.g.dart';

@JsonSerializable()
class Title {
  String? text;

  Title({
    this.text,
  });

  factory Title.fromJson(Map<String, dynamic> json) {
    return _$TitleFromJson(json);
  }

  /// Connect the generated [_$PersonToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$TitleToJson(this);
}
