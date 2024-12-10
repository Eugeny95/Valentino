import 'dart:convert';

import 'package:data_layer/models/http_models/all_sales_http_model.dart';
import 'package:dio/dio.dart';
import 'package:hive_flutter/hive_flutter.dart';

class AllSalesRepository {
  Future<AllSalesHttpModel> syncAllSales({required String accessToken}) async {
    await Hive.initFlutter();
    Response responce = await Dio().get(
        'http://147.45.109.158:8880/sale/all_sale/',
        options: Options(headers: <String, String>{
          'authorization': 'Bearer ${accessToken}'
        }));
    var box = await Hive.openBox('saleBox1');

    await box.put('all_sales', json.encode(responce.data));
    return AllSalesHttpModel.fromJson(responce.data);
  }

  Future<AllSalesHttpModel> getCachedAllSales() async {
    await Hive.initFlutter();
    var box = await Hive.openBox('saleBox1');
    Map<String, dynamic> temp = {};
    var data = json.decode(box.get('all_sales'));
    return AllSalesHttpModel.fromJson(data);
  }
}

class requred {}
