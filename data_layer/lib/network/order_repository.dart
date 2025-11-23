import 'dart:convert';

import 'package:data_layer/models/http_models/menu_http_model.dart';
import 'package:data_layer/models/http_models/order_http_model.dart';
import 'package:data_layer/models/http_models/pre_order_http_model.dart';
import 'package:data_layer/network/mock.dart';
import 'package:dio/dio.dart';
import 'package:hive_flutter/hive_flutter.dart';

enum CreateOrderStatus { success, failure }

class OrderRepository {
  Future<CreateOrderStatus> createOrder(
      OrderHttpModel orderHttpModel, String accessToken) async {
    try {
      print(orderHttpModel.toJson());
      Response responce = await Dio().post(
          'http://147.45.109.158:8880/orders/order/',
          data: orderHttpModel.toJson(),
          options: Options(headers: <String, String>{
            'authorization': 'Bearer ${accessToken}'
          }));
      print(responce.statusCode);

      if (responce.statusCode == 201) return CreateOrderStatus.success;
    } catch (_) {
      print(_);
      return CreateOrderStatus.failure;
    }
    return CreateOrderStatus.failure;
  }

  Future<Map<String, dynamic>> calculateSumInServer(
      PreOrderHttpModel preOrderHttpModel, String accessToken) async {
    try {
      print('DO_OTPRAVKI_NA_SERVER${preOrderHttpModel.toJson()}');
      Response responce = await Dio().post(
          'http://147.45.109.158:8880/orders_info/discounted_price/',
          data: preOrderHttpModel.toJson(),
          options: Options(headers: <String, String>{
            'authorization': 'Bearer ${accessToken}'
          }));
      print('OTPRAVKA_NA_SERVER${preOrderHttpModel.toJson()}');
      print('totalcostFromServer = ${responce.data['summa']}');
      print('deliveryFromServer = ${responce.data['delivery']}');
      print('saleFromServer = ${responce.data['sale']}');
      // return responce.data['summa'].toDouble();
      return {
        'summa': responce.data['summa'].toDouble(),
        'delivery': responce.data['delivery'],
        'sale': responce.data['sale'].toString(),
      };
    } catch (_) {
      print('totalcost = ${preOrderHttpModel.summa}');

      // return preOrderHttpModel.summa!;
      return {
        'summa': preOrderHttpModel.summa!,
        'delivery': null, // or some default value
        'sale': null, // or some default value
      };
    }
  }
}
