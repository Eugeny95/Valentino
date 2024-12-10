import 'dart:convert';

import 'package:data_layer/models/http_models/available_sales_http_model.dart';
import 'package:dio/dio.dart';
import 'package:hive_flutter/hive_flutter.dart';

class AvailableSalesRepository {
  Future<AvailableSalesHttpModel> syncAvailableSales(
      {required String accessToken}) async {
    await Hive.initFlutter();
    Response responce = await Dio().get(
        'http://147.45.109.158:8880/sale/available_sale/',
        options: Options(headers: <String, String>{
          'authorization': 'Bearer ${accessToken}'
        }));
    var box = await Hive.openBox('saleBox1');

    await box.put('available_sales', json.encode(responce.data));
    return AvailableSalesHttpModel.fromJson(responce.data);
  }

  Future<AvailableSalesHttpModel> getCachedAvailableSales() async {
    await Hive.initFlutter();
    var box = await Hive.openBox('saleBox1');
    Map<String, dynamic> temp = {};
    var data = json.decode(box.get('available_sales'));
    return AvailableSalesHttpModel.fromJson(data);
  }
}

class requred {}
