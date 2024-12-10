// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pre_order_http_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PreOrderHttpModel _$PreOrderHttpModelFromJson(Map<String, dynamic> json) =>
    PreOrderHttpModel(
      type_order:
          $enumDecodeNullable(_$OrderServiceTypeEnumMap, json['type_order']),
      phone: json['phone'] as String?,
      items: (json['items'] as List<dynamic>?)
          ?.map((e) => PositionHttpModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      adress: json['adress'] == null
          ? null
          : AddressHttpModel.fromJson(json['adress'] as Map<String, dynamic>),
      summa: (json['summa'] as num?)?.toDouble(),
      type_payment:
          $enumDecodeNullable(_$PaymentTypeEnumMap, json['type_payment']),
      sale: (json['sale'] as num?)?.toInt(),
      promo: json['promo'] as String?,
    );

Map<String, dynamic> _$PreOrderHttpModelToJson(PreOrderHttpModel instance) =>
    <String, dynamic>{
      'type_order': _$OrderServiceTypeEnumMap[instance.type_order],
      'phone': instance.phone,
      'items': instance.items,
      'adress': instance.adress,
      'summa': instance.summa,
      'type_payment': _$PaymentTypeEnumMap[instance.type_payment],
      'sale': instance.sale,
      'promo': instance.promo,
    };

const _$OrderServiceTypeEnumMap = {
  OrderServiceType.DeliveryPickUp: 'DeliveryPickUp',
  OrderServiceType.Common: 'Common',
  OrderServiceType.DeliveryByCourier: 'DeliveryByCourier',
};

const _$PaymentTypeEnumMap = {
  PaymentType.Cash: 'Cash',
  PaymentType.CardOnline: 'CardOnline',
  PaymentType.CardUponReceipt: 'CardUponReceipt',
};
