import 'package:dio/dio.dart';
import 'package:yandex_autocomplete/models/result_object.dart';

class PlaceCoder {
  static Future<GeoPlace> getPlace({required String text}) async {
    String req =
        'https://suggest-maps.yandex.ru/v1/suggest?apikey=a09063ab-76ad-4056-9e17-2b61737cb87f&types=locality,street,house&bbox=38.955340,51.528733~39.476501,51.904803&strict_bounds=1&print_address=1&text=$text';
    // req =
    //     'https://suggest-maps.yandex.ru/v1/suggest?apikey=a09063ab-76ad-4056-9e17-2b61737cb87f&types=locality,street,house&print_address=1&text=Воронежское городское посление, $text';

    Response response = await Dio().get(req);

    return GeoPlace.fromJson(response.data);
  }
}
