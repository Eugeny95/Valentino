import 'package:json_annotation/json_annotation.dart';

part 'sale_http_model.g.dart';

@JsonSerializable()
class SaleHttpModel {
  /// The generated code assumes these values exist in JSON.
  int? id;
  String? title;
  String? descryption;
  String? image;

  SaleHttpModel(
      {required this.id,
      required this.title,
      required this.descryption,
      required this.image});

  /// Connect the generated [_$PersonFromJson] function to the `fromJson`
  /// factory.
  factory SaleHttpModel.fromJson(Map<String, dynamic> json) =>
      _$SaleHttpModelFromJson(json);

  /// Connect the generated [_$PersonToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$SaleHttpModelToJson(this);

  @override
  String toString() {
    return 'id = $id, title = $title, descryption = $descryption, image = $image';
  }
}
