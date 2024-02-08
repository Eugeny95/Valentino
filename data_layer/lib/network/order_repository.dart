import 'dart:convert';

import 'package:data_layer/models/menu_http_model.dart';
import 'package:data_layer/models/order_http_model.dart';
import 'package:data_layer/network/mock.dart';
import 'package:dio/dio.dart';
import 'package:hive_flutter/hive_flutter.dart';

class OrderRepository {
  Future<void> createOrder(OrderHttpModel orderHttpModel) async {
    print(jsonEncode(orderHttpModel.toJson()));
    String username = 'admin_valentino';
    String password = 'root';
    String basicAuth =
        'Basic ' + base64.encode(utf8.encode('$username:$password'));
    print(basicAuth);
    Response responce = await Dio().post(
        'http://91.222.236.176:8880/orders/order/',
        data: orderHttpModel.toJson(),
        options: Options(
            //receiveDataWhenStatusError: true,
            headers: <String, String>{'authorization': basicAuth}));
  }
}
