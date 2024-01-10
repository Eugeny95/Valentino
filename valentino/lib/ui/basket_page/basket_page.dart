import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_datetime_picker_plus/flutter_datetime_picker_plus.dart';

import 'package:sbp/data/c2bmembers_data.dart';
import 'package:sbp/models/c2bmembers_model.dart';
import 'package:sbp/sbp.dart';
import 'package:valentino/buisiness/basket_bloc/basket_bloc_bloc.dart';
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
  int counter = 1;
  @override
  void initState() {
    // super.initState();
    // getInstalledBanks();
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

    return Scaffold(
      appBar: AppBar(
          iconTheme: IconThemeData(color: Color.fromARGB(180, 253, 253, 253)),
          backgroundColor: kPrimaryColor,
          title: Text('Оформление заказа',
              style: TextStyle(color: Color.fromARGB(202, 255, 255, 255)))),
      body: BlocBuilder<BasketBloc, BasketState>(
        builder: (context, state) {
          if (state.positions!.isNotEmpty)
            return Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Center(
                    child: Container(
                        width: width * 0.99,
                        child: Card(
                            elevation: 15,
                            color: kSecondaryColor,
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
                                BlocBuilder<BasketBloc, BasketState>(
                                  builder: (context, state) {
                                    return ListView.builder(
                                        shrinkWrap: true,
                                        itemCount: state.positions!.length,
                                        itemBuilder:
                                            (BuildContext context, int index) {
                                          return Container(
                                            width: width * 0.95,
                                            height: height * 0.2,
                                            child: Column(
                                              children: [
                                                Row(
                                                  children: [
                                                    Container(
                                                      height: height * 0.1,
                                                      width: width * 0.25,
                                                      child: CachedNetworkImage(
                                                          filterQuality:
                                                              FilterQuality.low,
                                                          imageUrl: state
                                                              .positions![index]
                                                              .dish!
                                                              .imageLinks
                                                              .first,
                                                          //  (dishHttpModel.imageLinks.isEmpty)?'': dishHttpModel.imageLinks.first,
                                                          placeholder: (context,
                                                                  url) =>
                                                              CircularProgressIndicator(),
                                                          errorWidget: (context,
                                                                  url, error) =>
                                                              Icon(Icons.error),
                                                          fit: BoxFit.cover),
                                                    ),
                                                    SizedBox(
                                                      width: width * 0.02,
                                                    ),
                                                    Container(
                                                      width: width * 0.65,
                                                      child: Column(children: [
                                                        Row(
                                                          children: [
                                                            Text(state.positions![index].dish!.name!,
                                                                style: TextStyle(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                    color: Color
                                                                        .fromARGB(
                                                                            255,
                                                                            229,
                                                                            229,
                                                                            229),
                                                                    fontSize:
                                                                        16)),
                                                            IconButton(
                                                                onPressed: () {
                                                                  BlocProvider.of<BasketBloc>(context).add(RemovePositionEvent(
                                                                      dishId: state
                                                                          .positions![
                                                                              index]
                                                                          .dish!
                                                                          .id!));
                                                                },
                                                                icon: Icon(Icons
                                                                    .delete))
                                                          ],
                                                        ),
                                                        Row(children: [
                                                          Expanded(
                                                            child: Row(
                                                                children: [
                                                                  IconButton(
                                                                      onPressed:
                                                                          () {
                                                                        BlocProvider.of<BasketBloc>(context).add(RemoveDishEvent(
                                                                            dishId:
                                                                                state.positions![index].dish!.id!));
                                                                      },
                                                                      icon: Icon(
                                                                          Icons
                                                                              .remove)),
                                                                  Text(
                                                                    state
                                                                        .positions![
                                                                            index]
                                                                        .count
                                                                        .toString(),
                                                                    style: TextStyle(
                                                                        color: Color.fromARGB(
                                                                            255,
                                                                            229,
                                                                            229,
                                                                            229),
                                                                        fontSize:
                                                                            18),
                                                                  ),
                                                                  IconButton(
                                                                      onPressed:
                                                                          () {
                                                                        setState(
                                                                            () {
                                                                          BlocProvider.of<BasketBloc>(context)
                                                                              .add(AddDishEvent(dishHttpModel: state.positions![index].dish));
                                                                          if (counter <
                                                                              0)
                                                                            counter =
                                                                                0;
                                                                          // onChange(counter);
                                                                        });
                                                                      },
                                                                      icon: Icon(
                                                                          Icons
                                                                              .add)),
                                                                ]),
                                                            flex: 2,
                                                          ),
                                                          Expanded(
                                                            child: Text(
                                                              // line.totalCost.toInt().toString(),
                                                              state
                                                                  .positions![
                                                                      index]
                                                                  .allCost
                                                                  .toString(),
                                                              textAlign:
                                                                  TextAlign
                                                                      .right,
                                                              style: TextStyle(
                                                                  color: Color
                                                                      .fromARGB(
                                                                          255,
                                                                          229,
                                                                          229,
                                                                          229),
                                                                  fontSize: 18),
                                                            ),
                                                            flex: 1,
                                                          ),
                                                        ]),
                                                        SizedBox(
                                                          height: 10,
                                                        ),
                                                      ]),
                                                    ),
                                                  ],
                                                ),
                                                Divider(
                                                    color: Color.fromARGB(
                                                        255, 229, 229, 229)),
                                              ],
                                            ),
                                          );
                                        });
                                  },
                                ),
                                Container(
                                    width: width * 0.9,
                                    child: Column(children: [
                                      Row(children: [
                                        Text('Ближайшее время:',
                                            style: TextStyle(
                                                color: Color.fromARGB(
                                                    255, 229, 229, 229),
                                                fontSize: 18)),
                                        Text(
                                          ' ' + mytime + ' ',
                                          style: TextStyle(
                                              color: Color.fromARGB(
                                                  255, 229, 229, 229),
                                              fontSize: 18),
                                        )
                                      ]),
                                      Padding(
                                          padding: EdgeInsets.only(
                                              top: height * 0.01)),
                                      Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
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
                                                      height * 0.35,
                                                      width * 0.12),
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
                                                  DatePicker.showDateTimePicker(
                                                      context,
                                                      showTitleActions: true,
                                                      // minDate:DateTime.now(),
                                                      // maxDate: DateTime.now(),
                                                      minTime: DateTime.now(),
                                                      maxTime: DateTime.now()
                                                          .add(const Duration(
                                                              days: 10)),
                                                      onChanged: (date) {
                                                    print('change $date');
                                                  }, onConfirm: (date) {
                                                    print('confirm $date');
                                                  },
                                                      currentTime:
                                                          DateTime.now(),
                                                      locale: LocaleType.ru);
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
                                          fillColor:
                                              MaterialStateColor.resolveWith(
                                                  (states) => Color.fromARGB(
                                                      255, 229, 229, 229)),
                                          focusColor:
                                              MaterialStateColor.resolveWith(
                                                  (states) => Color.fromARGB(
                                                      255, 229, 229, 229)),
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
                                          fillColor:
                                              MaterialStateColor.resolveWith(
                                                  (states) => Color.fromARGB(
                                                      255, 229, 229, 229)),
                                          focusColor:
                                              MaterialStateColor.resolveWith(
                                                  (states) => Color.fromARGB(
                                                      255, 229, 229, 229)),
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
                                Divider(color: Color.fromARGB(255, 67, 67, 67)),
                                Row(
                                  children: [
                                    Expanded(
                                      child: Column(
                                        children: [
                                          Text(
                                            'Итого: ',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: Color.fromARGB(
                                                    255, 229, 229, 229),
                                                fontSize: 15),
                                          ),
                                          Text(
                                            state.totalCost.toString(),
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: Color.fromARGB(
                                                    255, 229, 229, 229),
                                                fontSize: 23),
                                          ),
                                        ],
                                      ),
                                      flex: 1,
                                    ),
                                    Expanded(
                                      child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(
                                                12), // <-- Radius
                                          ),
                                          elevation: 5,
                                          minimumSize:
                                              Size(height * 0.23, width * 0.13),
                                          backgroundColor: kPrimaryColor,
                                        ),
                                        // ignore: prefer_const_constructors
                                        child: Text('Оплатить',
                                            style: (TextStyle(
                                                fontSize: 18,
                                                color: Color.fromARGB(
                                                    235, 227, 227, 227)))),
                                        onPressed: () {
                                          showModalBottomSheet(
                                            context: context,
                                            shape: const RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.vertical(
                                                top: Radius.circular(20),
                                              ),
                                            ),
                                            builder: (ctx) =>
                                                SbpModalBottomSheetWidget(
                                                    informations, widget.url),
                                          );
                                        },
                                      ),
                                      flex: 2,
                                    ),
                                  ],
                                )
                              ],
                            )))),
              ],
            );
          else
            return Center(
              child: Text('Корзина пуста'),
            );
        },
      ),
    );
  }
}
