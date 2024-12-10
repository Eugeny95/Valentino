import 'dart:convert';

import 'package:data_layer/models/http_models/all_sales_http_model.dart';
import 'package:data_layer/models/http_models/information_message_http_model.dart';
import 'package:dio/dio.dart';
import 'package:hive_flutter/hive_flutter.dart';

class InformationMessageRepository {
  Future<InformationMessageHttpModel> syncInformationMessage() async {
    await Hive.initFlutter();
    Response responce =
        await Dio().get('http://147.45.109.158:8880/api/information/');
    var box = await Hive.openBox('InformationMessageBox1');

    await box.put('InformationMessage', json.encode(responce.data));
    return InformationMessageHttpModel.fromJson(responce.data);
  }

  Future<InformationMessageHttpModel> getCachedInformationMessage() async {
    await Hive.initFlutter();
    var box = await Hive.openBox('InformationMessageBox1');
    Map<String, dynamic> temp = {};
    var data = json.decode(box.get('InformationMessage'));
    return InformationMessageHttpModel.fromJson(data);
  }
}
