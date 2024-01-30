import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';

class AddressWidget extends StatefulWidget {
  @override
  _AddressWidgetState createState() => _AddressWidgetState();
}

class _AddressWidgetState extends State<AddressWidget> {
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _latitudeController = TextEditingController();
  final TextEditingController _longitudeController = TextEditingController();
  String _output = '';

  @override
  void initState() {
    _addressController.text = 'Воронеж, Лизюкова 25';

    _latitudeController.text = '52.2165157';
    _longitudeController.text = '6.9437819';

    super.initState();
  }

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
          height: height * 0.40,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              gradient: LinearGradient(colors: [
                Color.fromARGB(255, 88, 88, 88),
                Color.fromARGB(146, 58, 58, 58),
                Color.fromARGB(196, 47, 47, 47),
                Color.fromARGB(255, 131, 131, 131),
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
                        width: width * 0.7,
                        child: TextField(
                            autocorrect: true,
                            // controller: _addressController,
                            style: Theme.of(context).textTheme.bodyMedium,
                            decoration: InputDecoration(
                              hintText: 'Улица',
                            )),
                      ),
                      SizedBox(
                        width: width * 0.1,
                        child: TextField(
                            autocorrect: true,
                            // controller: _addressController,
                            style: Theme.of(context).textTheme.bodyMedium,
                            decoration: InputDecoration(
                              hintText: 'Дом',
                            )),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      SizedBox(
                        width: width * 0.2,
                        child: TextField(
                            autocorrect: true,
                            // controller: _addressController,
                            style: Theme.of(context).textTheme.bodyMedium,
                            decoration: InputDecoration(
                              hintText: 'Квартира',
                            )),
                      ),
                      SizedBox(
                        width: width * 0.2,
                        child: TextField(
                            autocorrect: true,
                            // controller: _addressController,
                            style: Theme.of(context).textTheme.bodyMedium,
                            decoration: InputDecoration(
                              hintText: 'Подъезд',
                            )),
                      ),
                      SizedBox(
                        width: width * 0.15,
                        child: TextField(
                            autocorrect: true,
                            // controller: _addressController,
                            style: Theme.of(context).textTheme.bodyMedium,
                            decoration: InputDecoration(
                              hintText: 'Этаж',
                            )),
                      ),
                      SizedBox(
                        width: width * 0.2,
                        child: TextField(
                            autocorrect: true,
                            // controller: _addressController,
                            style: Theme.of(context).textTheme.bodyMedium,
                            decoration: InputDecoration(
                              hintText: 'Домофон',
                            )),
                      ),
                    ],
                  ),
                ],
              ),
              Padding(padding: EdgeInsets.only(top: 10)),
              TextField(
                autocorrect: true,
                controller: _addressController,
                style: Theme.of(context).textTheme.bodyMedium,
                decoration: InputDecoration(
                  hintText: 'Адрес',
                ),
                keyboardType: TextInputType.text,
              ),
              const Padding(
                padding: EdgeInsets.only(top: 8),
              ),
              Center(
                child: ElevatedButton(
                    child: Text(
                      'Узнать координаты',
                      style: TextStyle(color: Colors.red),
                    ),
                    onPressed: () {
                      locationFromAddress(_addressController.text)
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
              Text('Стоимость доставки:')
            ],
          ),
        ));
  }
}
