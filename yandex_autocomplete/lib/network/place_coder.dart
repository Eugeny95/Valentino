import 'package:dio/dio.dart';
import 'package:yandex_autocomplete/models/result_object.dart';

class PlaceCoder {
  static Future<GeoPlace> getPlace({required String text}) async {
    Response response = await Dio().get(
        'https://suggest-maps.yandex.ru/v1/suggest?apikey=a09063ab-76ad-4056-9e17-2b61737cb87f&text=Воронеж,$text');

    return GeoPlace.fromJson(response.data);
  }
}
