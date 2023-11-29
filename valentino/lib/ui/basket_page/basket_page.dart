import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker_plus/flutter_datetime_picker_plus.dart';

import 'package:sbp/data/c2bmembers_data.dart';
import 'package:sbp/models/c2bmembers_model.dart';
import 'package:sbp/sbp.dart';
import 'package:valentino/ui/basket_page/sbp_modal_widget.dart';




import 'package:valentino/ui/constants.dart';


class BasketPage extends StatefulWidget {
  
   final url =
      'https://qr.nspk.ru/AS10003P3RH0LJ2A9ROO038L6NT5RU1M?type=01&bank=000000000001&sum=10000&cur=RUB&crc=F3D0';


  // OrderObject? _orderObject;
  // OrderPage(this._orderObject);
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return BasketPageState();
  }
}

Set onPlace = {true, false};
bool valueRadio = true;
String mytime = '30 минут';

class BasketPageState extends State<BasketPage> {
  @override
  void initState() {
    super.initState();
    getInstalledBanks();
  }
   List<C2bmemberModel> informations = [];

  /// Получаем установленные банки
  Future<void> getInstalledBanks() async {
    try {
      informations.addAll(await Sbp.getInstalledBanks(
        C2bmembersModel.fromJson(c2bmembersData),
        useAndroidLocalIcons: false,
        useAndroidLocalNames: false,
      ));
    } on Exception catch (e) {
      throw Exception(e);
    }
    setState(() {});
  }
  

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    List<Widget> coffeLines = [];
    // for (DishObject line in _orderObject!.basketObject.coffePositions) 
    {
      coffeLines.add(
         Container(
          width: width * 0.85,
          child: Column(children: [
            Row(children: [
              Expanded(
                child: Text('Название блюда',
                    style: TextStyle(fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 229, 229, 229),
                        fontSize: 22)),
                flex: 2,
              ),
              Expanded(
                child: Text(
                  '300 грамм',
                  textAlign: TextAlign.right,
                  style: TextStyle(color: Color.fromARGB(255, 229, 229, 229), fontSize: 20),
                ),
                flex: 1,
              ),
            ]),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Expanded(
                    flex: 1,
                    child: Text('Добавки:',
                        style: TextStyle(
                            color: Color.fromARGB(255, 229, 229, 229),
                            //  fontWeight: FontWeight.bold,
                            fontSize: 15))),
                // Expanded(
                //     flex: 1,
                //     child: ListView.builder(
                //         shrinkWrap: true,
                //         itemCount: line.options.length,
                //         itemBuilder: (BuildContext context, int index) {
                //           return line.options[index].isSelected
                //               ? Text(line.options[index].name,
                //                   textAlign: TextAlign.right,
                //                   style: TextStyle(
                //                       color: Color.fromARGB(255, 97, 97, 97), fontSize: 15))
                //               : Column();
                //         })),
              ],
            ),
            Row(children: [
              Expanded(
                child: Text('Количество:',
                    style: TextStyle(
                        color: Color.fromARGB(255, 229, 229, 229),
                        fontSize: 15)),
                flex: 2,
              ),
              Expanded(
                child: Text(
                  // line.count.toString(),
                  '2',
                  textAlign: TextAlign.right,
                  style: TextStyle(color: Color.fromARGB(255, 229, 229, 229), fontSize: 15),
                ),
                flex: 1,
              ),
            ]),
            Row(children: [
              Expanded(
                child: Text('Стоимость:',
                    style: TextStyle(
                        color: Color.fromARGB(255, 229, 229, 229),
                        fontSize: 15)),
                flex: 2,
              ),
              Expanded(
                child: Text(
                  // line.totalCost.toInt().toString(),
                  '300 p.',
                  textAlign: TextAlign.right,
                  style: TextStyle(color: Color.fromARGB(255, 229, 229, 229), fontSize: 15),
                ),
                flex: 1,
              ),
            ]),
            Divider(color: Color.fromARGB(255, 229, 229, 229)),
            SizedBox(
              height: 10,
            ),
          ])));
    }
    return Scaffold(
      appBar: AppBar(
          iconTheme: IconThemeData(color: Color.fromARGB(180, 253, 253, 253)),
          backgroundColor: kPrimaryColor,
          title: Text('Оформление заказа',
              style: TextStyle(color: Color.fromARGB(202, 255, 255, 255)))),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
              child: Container(
                  width: width * 0.97,
                  child: Card(
                      elevation: 15,
                      child: Column(
                        children: [
                          ListTile(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(10),
                                    topRight: Radius.circular(10),
                                    bottomRight: Radius.circular(10),
                                    bottomLeft: Radius.circular(10))),
                            title: Text('Детали заказа'),
                            tileColor: kPrimaryColor,
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Column(
                            children: coffeLines,
                          ),
                          Divider(
                            color: Color(0xFF070707),
                            height: 25,
                          ),
                          Text(
                            'Итого: 1450 руб.',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Color.fromARGB(255, 229, 229, 229),
                                fontSize: 23),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Divider(
                            color: Color(0xFF070707),
                            height: 25,
                          ),
                          Container(
                              width: width * 0.9,
                              child: Column(children: [
                                Row(children: [
                                  Text('Время готовности:',
                                      style: TextStyle(
                                          color:
                                              Color.fromARGB(255, 229, 229, 229),
                                          fontSize: 18)),
                                  Text(
                                    ' ' + mytime + ' ',
                                    style: TextStyle(
                                        color: Color.fromARGB(255, 229, 229, 229),
                                        fontSize: 18),
                                  )
                                ]),
                                Padding(
                                    padding:
                                        EdgeInsets.only(top: height * 0.01)),
                                Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(
                                                      12), // <-- Radius
                                            ),
                                            elevation: 5,
                                            minimumSize: Size(
                                                height * 0.35, width * 0.12),
                                          ),
                                          onPressed: () async {
                                            // DatePicker.showPicker(
                                            //   context,
                                            //   pickerModel: CustomPicker(
                                            //     currentTime: DateTime.now(),
                                            //     locale: LocaleType.ru,
                                            //   ),
                                            //   onConfirm: (time) {
                                            //     print('change $time');
                                            //     mytime = time
                                            //         .toString()
                                            //         .substring(0, 16);
                                            //     // _orderObject!.requiredDateTime =
                                            //     //     mytime;
                                            //     setState(() {});
                                            //   },
                                            // );
                                          DatePicker.showDateTimePicker(context,
                              showTitleActions: true,
                              // minDate:DateTime.now(),
                              // maxDate: DateTime.now(),
                              minTime: DateTime.now(),
                              maxTime:DateTime.now().add(const Duration(days: 10)), onChanged: (date) {
                            print('change $date');
                          }, onConfirm: (date) {
                            print('confirm $date');
                          }, currentTime: DateTime.now(), locale: LocaleType.ru);
    },
                                          
                                          child: Text('Выбрать время',
                                              style: TextStyle(
                                                  color: Colors.white)))
                                    ])
                              ])),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Radio(
                                    fillColor: MaterialStateColor.resolveWith(
                                        (states) =>
                                            Color.fromARGB(255, 229, 229, 229)),
                                    focusColor: MaterialStateColor.resolveWith(
                                        (states) =>
                                            Color.fromARGB(255, 229, 229, 229)),
                                    value: false,
                                    groupValue: valueRadio,
                                    onChanged: (bool? value) {
                                      setState(() {
                                        valueRadio = value!;
                                        // _orderObject!.onPlace = valueRadio;
                                      });
                                    }),
                                Text('На вынос'),
                                Radio(
                                    fillColor: MaterialStateColor.resolveWith(
                                        (states) =>
                                            Color.fromARGB(255, 229, 229, 229)),
                                    focusColor: MaterialStateColor.resolveWith(
                                        (states) =>
                                            Color.fromARGB(255, 229, 229, 229)),
                                    value: true,
                                    groupValue: valueRadio,
                                    onChanged: (bool? value) {
                                      setState(() {
                                        valueRadio = value!;
                                        // _orderObject!.onPlace = valueRadio;
                                      });
                                    }),
                                Text('Доставка'),
                              ]),
                        ],
                      )))),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12), // <-- Radius
              ),
              elevation: 5,
              minimumSize: Size(height * 0.43, width * 0.13),
              backgroundColor: kPrimaryColor,
            ),
            // ignore: prefer_const_constructors
            child: Text('Оплатить',
                style: (TextStyle(fontSize: 18, color: Color.fromARGB(235, 227, 227, 227)))),
            onPressed: () {
            showModalBottomSheet(
                  context: context,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(20),
                    ),
                  ),
                  builder: (ctx) => SbpModalBottomSheetWidget(informations, widget.url),
                );
            },
          )
        ],
      ),
    );
  }
}
