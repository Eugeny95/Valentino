import 'package:easy_autocomplete/easy_autocomplete.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:google_places_flutter/google_places_flutter.dart';
import 'package:google_places_flutter/model/prediction.dart';
import 'package:valentino/ui/basket_page/data/models.dart';
import 'package:yandex_autocomplete/models/result_object.dart';
import 'package:yandex_autocomplete/network/place_coder.dart';

class AddressWidget extends StatefulWidget {
  void Function(AddressData addressData) onChange;
  AddressWidget({required this.onChange}) {}
  @override
  _AddressWidgetState createState() => _AddressWidgetState();
}

class _AddressWidgetState extends State<AddressWidget> {
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _latitudeController = TextEditingController();
  final TextEditingController _longitudeController = TextEditingController();
  String _output = '';
  final _textController = TextEditingController();
  List<String> suggestions = [];

  AddressData addressData = AddressData(
      house: '', street: '', flat: 0, floor: 0, entrance: 0, doorphone: '');

  @override
  void initState() {
    _addressController.text = '';

    _latitudeController.text = '52.2165157';
    _longitudeController.text = '6.9437819';

    super.initState();
  }

  Future<void> getData(String value) async {
    geoPlace = await PlaceCoder.getPlace(text: value);
    suggestions.clear();
    //  if (geoPlace.results == null) geoPlace.results = [];
    for (int i = 0; i < geoPlace.results!.length; i++) {
      String address = '';

      if (geoPlace.results![i].title != null) {
        address = geoPlace.results![i].title!.text.toString();
      }
      // if (geoPlace.results![i].subtitle != null) {
      //   address =
      //       address + ' ' + geoPlace.results![i].subtitle!.text.toString();
      // }
      if (address.isNotEmpty) suggestions.add(address);
    }
    setState(() {});
  }

  GeoPlace geoPlace = GeoPlace()..results = [];
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    double fontSize = height / 60;

    // TODO: implement build
    return Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        semanticContainer: true,
        // clipBehavior: Clip.antiAliasWithSaveLayer,
        elevation: 10,
        child: Container(
          height: height * 0.32,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              gradient: LinearGradient(colors: [
                Color.fromARGB(255, 70, 69, 69),
                Color.fromARGB(146, 58, 58, 58),
                Color.fromARGB(196, 47, 47, 47),
                Color.fromARGB(255, 94, 94, 94),
              ])),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              const Padding(
                padding: EdgeInsets.only(top: 10),
              ),
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      SizedBox(
                          width: width * 0.6,
                          child: InputDecorator(
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 0, horizontal: 0),
                              // border: OutlineInputBorder(gapPadding: 1),
                              helperText: 'Улица, дом*',

                              helperStyle: TextStyle(
                                  color: Color.fromARGB(209, 255, 255, 255),
                                  fontSize: 10),
                            ),
                            child: Autocomplete<String>(
                              optionsBuilder:
                                  (TextEditingValue textEditingValue) async {
                                await getData(textEditingValue.text);
                                if (textEditingValue.text == '') {
                                  return const Iterable<String>.empty();
                                }
                                for (String i in suggestions) {
                                  print(i);
                                }
                                print(suggestions.length);
                                print(suggestions.where((String option) {
                                  return option
                                      .toLowerCase()
                                      .contains(textEditingValue.text);
                                }));
                                return suggestions.where((String option) {
                                  return option.toLowerCase().contains(
                                      textEditingValue.text.toLowerCase());
                                });
                              },
                              onSelected: (String selection) {
                                addressData.street = selection;
                                widget.onChange(addressData);
                                addressData.street = selection.split(',').first;
                                try {
                                  addressData.house = selection.split(',')[1];
                                } catch (_) {
                                  addressData.house = '';
                                  print(_);
                                }
                              },
                            ),
                          )),
                      SizedBox(
                        width: width * 0.2,
                        child: TextField(
                            onChanged: (value) {
                              addressData.flat = int.parse(value);
                              widget.onChange(addressData);
                            },
                            autocorrect: true,
                            // controller: _addressController,
                            style: Theme.of(context).textTheme.bodyMedium,
                            decoration: InputDecoration(
                              helperText: 'Квартира',
                              helperStyle: TextStyle(
                                  color: Color.fromARGB(209, 255, 255, 255),
                                  fontSize: 10),
                            )),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      SizedBox(
                        width: width * 0.3,
                        child: TextField(
                            onChanged: (value) {
                              addressData.entrance = int.parse(value);
                              widget.onChange(addressData);
                            },
                            autocorrect: true,
                            // controller: _addressController,
                            style: Theme.of(context).textTheme.bodyMedium,
                            decoration: InputDecoration(
                              helperText: 'Подъезд',
                              helperStyle: TextStyle(
                                  color: Color.fromARGB(209, 255, 255, 255),
                                  fontSize: 10),
                            )),
                      ),
                      SizedBox(
                        width: width * 0.2,
                        child: TextField(
                            onChanged: (value) {
                              addressData.floor = int.parse(value);
                              widget.onChange(addressData);
                            },
                            autocorrect: true,
                            // controller: _addressController,
                            style: Theme.of(context).textTheme.bodyMedium,
                            decoration: InputDecoration(
                              helperText: 'Этаж',
                              helperStyle: TextStyle(
                                  color: Color.fromARGB(209, 255, 255, 255),
                                  fontSize: 10),
                            )),
                      ),
                      SizedBox(
                        width: width * 0.2,
                        child: TextField(
                            onChanged: (value) {
                              addressData.doorphone = value;
                              widget.onChange(addressData);
                            },
                            autocorrect: true,
                            // controller: _addressController,
                            style: Theme.of(context).textTheme.bodyMedium,
                            decoration: InputDecoration(
                              helperText: 'Домофон',
                              helperStyle: TextStyle(
                                  color: Color.fromARGB(209, 255, 255, 255),
                                  fontSize: 10),
                            )),
                      ),
                    ],
                  ),
                ],
              ),
              Padding(padding: EdgeInsets.only(top: 15)),
              Center(
                child: ElevatedButton(
                    child: Text(
                      'Узнать координаты',
                      style: TextStyle(color: Colors.red),
                    ),
                    onPressed: () {
                      locationFromAddress(
                              addressData.street + ',' + addressData.house)
                          .then((locations) {
                        var output = 'Нет результата';
                        if (locations.isNotEmpty) {
                          output = locations[0].toString();
                        }

                        setState(() {
                          _output = output;
                        });
                      });
                    }),
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    child: Text(
                      _output,
                      style: TextStyle(color: Colors.red),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
