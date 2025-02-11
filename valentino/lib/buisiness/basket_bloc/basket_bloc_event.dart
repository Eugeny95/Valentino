part of 'basket_bloc_bloc.dart';

@immutable
sealed class BasketEvent {}

class ClearBasketEvent extends BasketEvent {}

class AddDishEvent extends BasketEvent {
  DishHttpModel? dishHttpModel;
  AddressData? addressData;
  PointData? pointData;
  UserData? user;
  OrderServiceType? orderServiceType;
  PaymentType? paymentType;
  int? saleId;
  String? promo;

  AddDishEvent(
      {required this.dishHttpModel,
      required this.addressData,
      required this.pointData,
      required this.user,
      required this.orderServiceType,
      required this.paymentType,
      required this.saleId,
      required this.promo});
}

class RemoveDishEvent extends BasketEvent {
  String dishId;
  AddressData? addressData;
  PointData? pointData;
  UserData? user;
  OrderServiceType? orderServiceType;
  PaymentType? paymentType;
  int? saleId;
  String? promo;
  DishHttpModel? dishHttpModel;

  RemoveDishEvent(
      {required this.dishId,
      required this.addressData,
      required this.pointData,
      required this.user,
      required this.orderServiceType,
      required this.paymentType,
      required this.saleId,
      required this.promo});
}

class RemovePositionEvent extends BasketEvent {
  String dishId;
  AddressData? addressData;
  PointData? pointData;
  UserData? user;
  OrderServiceType? orderServiceType;
  PaymentType? paymentType;
  int? saleId;
  String? promo;

  RemovePositionEvent(
      {required this.dishId,
      required this.addressData,
      required this.pointData,
      required this.user,
      required this.orderServiceType,
      required this.paymentType,
      required this.saleId,
      required this.promo});
}

class SetDeliveryCost extends BasketEvent {
  double deliveryCost = 0.0;
  AddressData? addressData;
  PointData? pointData;
  UserData? user;
  OrderServiceType? orderServiceType;
  PaymentType? paymentType;
  int? saleId;
  String? promo;
  SetDeliveryCost(
      {required this.deliveryCost,
      required this.addressData,
      required this.pointData,
      required this.user,
      required this.orderServiceType,
      required this.paymentType,
      required this.saleId,
      required this.promo});
}

class GetBasketPositions extends BasketEvent {}

class SlectSaleEvent extends BasketEvent {
  AddressData? addressData;
  PointData? pointData;
  UserData? user;
  OrderServiceType? orderServiceType;
  PaymentType? paymentType;
  int? saleId;
  String? promo;
  SlectSaleEvent(
      {required this.addressData,
      required this.pointData,
      required this.user,
      required this.orderServiceType,
      required this.paymentType,
      required this.saleId,
      required this.promo,
      required dishHttpModel});
}

class SelectDeliveryTypeEvent extends BasketEvent {
  AddressData? addressData;
  PointData? pointData;
  UserData? user;
  OrderServiceType? orderServiceType;
  PaymentType? paymentType;
  int? saleId;
  String? promo;

  SelectDeliveryTypeEvent(
      {required this.addressData,
      required this.pointData,
      required this.user,
      required this.orderServiceType,
      required this.paymentType,
      required this.saleId,
      required this.promo});
}

class PromoEvent extends BasketEvent {
  AddressData? addressData;
  PointData? pointData;
  UserData? user;
  OrderServiceType? orderServiceType;
  PaymentType? paymentType;
  int? saleId;
  String? promo;

  PromoEvent(
      {required this.addressData,
      required this.pointData,
      required this.user,
      required this.orderServiceType,
      required this.paymentType,
      required this.saleId,
      required this.promo});
}

class SelectPaymentEvent extends BasketEvent {
  AddressData? addressData;
  PointData? pointData;
  UserData? user;
  OrderServiceType? orderServiceType;
  PaymentType? paymentType;
  int? saleId;
  String? promo;

  SelectPaymentEvent(
      {required this.addressData,
      required this.pointData,
      required this.user,
      required this.orderServiceType,
      required this.paymentType,
      required this.saleId,
      required this.promo});
}
