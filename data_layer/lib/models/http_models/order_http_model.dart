import 'package:data_layer/models/http_models/address_http_model.dart';
import 'package:data_layer/models/http_models/position_http_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'order_http_model.g.dart';

enum OrderServiceType { DeliveryPickUp, Common, DeliveryByCourier }

enum PaymentType { Cash, CardOnline, CardUponReceipt }

@JsonSerializable()
class OrderHttpModel {
  OrderServiceType? type_order;
  String? phone;
  List<PositionHttpModel>? items;
  AddressHttpModel? adress;
  DateTime? completeBefore;
  String? comment;
  double? summa;
  int? sale;
  PaymentType? type_payment;
  OrderHttpModel({
    required this.type_order,
    required this.phone,
    required this.items,
    required this.adress,
    required this.completeBefore,
    required this.comment,
    required this.summa,
    required this.type_payment,
    required this.sale,
  });

  factory OrderHttpModel.fromJson(Map<String, dynamic> json) =>
      _$OrderHttpModelFromJson(json);

  Map<String, dynamic> toJson() => _$OrderHttpModelToJson(this);
}
