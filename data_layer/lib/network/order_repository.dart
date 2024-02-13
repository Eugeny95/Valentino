import 'dart:convert';

import 'package:data_layer/models/http_models/menu_http_model.dart';
import 'package:data_layer/models/http_models/order_http_model.dart';
import 'package:data_layer/network/mock.dart';
import 'package:dio/dio.dart';
import 'package:hive_flutter/hive_flutter.dart';

enum CreateOrderStatus { success, failure }

class OrderRepository {
  Future<CreateOrderStatus> createOrder(OrderHttpModel orderHttpModel) async {
    print(jsonEncode(orderHttpModel.toJson()));
    String username = 'admin_valentino';
    String password = 'root';
    String basicAuth =
        'Basic ' + base64.encode(utf8.encode('$username:$password'));
    print(basicAuth);
    try {
      Response responce = await Dio().post(
          'http://91.222.236.176:8880/orders/order/',
          data: orderHttpModel.toJson(),
          options: Options(
              //receiveDataWhenStatusError: true,
              headers: <String, String>{'authorization': basicAuth}));
      if (responce.statusCode == 200) return CreateOrderStatus.success;
    } catch (_) {
      return CreateOrderStatus.failure;
    }
    return CreateOrderStatus.failure;
  }
}
