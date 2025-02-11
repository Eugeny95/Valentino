import 'package:data_layer/models/http_models/address_http_model.dart';
import 'package:data_layer/models/http_models/order_http_model.dart';
import 'package:data_layer/models/http_models/point_http_model.dart';
import 'package:data_layer/models/http_models/position_http_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'pre_order_http_model.g.dart';

@JsonSerializable()
class PreOrderHttpModel {
  OrderServiceType? type_order;
  String? phone;
  List<PositionHttpModel>? items;
  AddressHttpModel? adress;
  PointHttpModel? point;
  double? summa;
  PaymentType? type_payment;
  int? sale;
  String? promo;
  PreOrderHttpModel(
      {required this.type_order,
      required this.phone,
      required this.items,
      required this.adress,
      required this.point,
      required this.summa,
      required this.type_payment,
      required this.sale,
      required this.promo});

  factory PreOrderHttpModel.fromJson(Map<String, dynamic> json) =>
      _$PreOrderHttpModelFromJson(json);

  Map<String, dynamic> toJson() => _$PreOrderHttpModelToJson(this);
}
