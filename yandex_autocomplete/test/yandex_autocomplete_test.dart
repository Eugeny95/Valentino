import 'package:flutter_test/flutter_test.dart';
import 'package:yandex_autocomplete/models/result_object.dart';
import 'package:yandex_autocomplete/network/place_coder.dart';

import 'package:yandex_autocomplete/yandex_autocomplete.dart';

void main() {
  test('adds one to input values', () async {
    GeoPlace geoPlace = await PlaceCoder.getPlace(text: 'Воронеж, Старых');
    for (int i = 0; i < geoPlace.results!.length; i++)
      print(geoPlace.results![i].title!.text);
  });
}
