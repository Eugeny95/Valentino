import 'package:json_annotation/json_annotation.dart';

part 'position_http_model.g.dart';

// enum OrderServiceType {DeliveryPickUp, Common, DeliveryByCourier}

// enum PaymentType {Cash, OnlineCard, CardByCourier}

@JsonSerializable()
class PositionHttpModel {
  List<String>? modifiers;
  String? productId;
  int? amount;

  PositionHttpModel(
      {required this.amount, required this.modifiers, required this.productId});

  factory PositionHttpModel.fromJson(Map<String, dynamic> json) =>
      _$PositionHttpModelFromJson(json);

  Map<String, dynamic> toJson() => _$PositionHttpModelToJson(this);
}
