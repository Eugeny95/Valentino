import 'dart:convert';
import 'package:json_annotation/json_annotation.dart';
import 'package:yandex_autocomplete/models/text.dart';

part 'subtitle.g.dart';

@JsonSerializable()
class Subtitle {
  String? text;

  Subtitle({
    this.text,
  });

  factory Subtitle.fromJson(Map<String, dynamic> json) {
    return _$SubtitleFromJson(json);
  }

  /// Connect the generated [_$PersonToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$SubtitleToJson(this);
}
