import 'dart:convert';
import 'package:json_annotation/json_annotation.dart';

part 'text.g.dart';

@JsonSerializable()
class TextMap {
  String text;

  TextMap({
    required this.text,
  });

  factory TextMap.fromJson(Map<String, dynamic> json) {
    return _$TextMapFromJson(json);
  }

  /// Connect the generated [_$PersonToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$TextMapToJson(this);
}
