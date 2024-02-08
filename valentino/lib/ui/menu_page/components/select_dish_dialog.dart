import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:data_layer/models/dish_http_model.dart';
import 'package:easy_image_viewer/easy_image_viewer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:valentino/buisiness/basket_bloc/basket_bloc_bloc.dart';
import 'package:valentino/ui/constants.dart';

// TODO можно в будущем сделать категории подгружаемыми с интернета

// ignore: must_be_immutable
class SelectDishDialog extends StatefulWidget {
  DishHttpModel dishHttpModel;

  SelectDishDialog({super.key, required this.dishHttpModel});

  // SelectDishDialog(this.dish);
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return SelectDishDialogState();
  }
}

class SelectDishDialogState extends State<SelectDishDialog> {
  // SelectDishDialogState(this.dish) {
  //   dish.fieldSelection.selectedField = dish.fieldSelection.fields.first;
  // }
  @override
  Widget build(BuildContext context) {
    BlocProvider.of<BasketBloc>(context).add(EmptyBasketEvent());
    List<Widget> propertiesWidget = [];
    List<Widget> volumesWidget = [];
    DishHttpModel dishHttpModel = widget.dishHttpModel;
    for (int i = 0; i < dishHttpModel.modifiers!.length; i++) {
      if (dishHttpModel.modifiers![i].name == 'на вынос' ||
          dishHttpModel.modifiers![i].name == '-одновременно' ||
          dishHttpModel.modifiers![i].name == 'коробка' ||
          dishHttpModel.modifiers![i].name == 'лист') continue;
      propertiesWidget.add(Row(children: [
        Expanded(
          flex: 3,
          child: Text(dishHttpModel.modifiers![i].name!),
        ),
        Checkbox(
          activeColor: const Color.fromARGB(255, 89, 89, 89),
          value: dishHttpModel.modifiers![i].isSelected,
          onChanged: (value) {
            setState(() {
              dishHttpModel.modifiers![i].isSelected = value!;
            });
          },
        ),
      ]));
    }
    // for (Option volume in dish.fieldSelection.fields) {
    //   volumesWidget.add(Row(children: [
    //     Expanded(
    //       child: Text(volume.name.toString()),
    //       flex: 3,
    //     ),
    //     Text(volume.price.toInt().toString()),
    //     Radio(
    //         fillColor: MaterialStateColor.resolveWith((states) => Color.fromARGB(255, 69, 69, 69)),
    //         focusColor:
    //             MaterialStateColor.resolveWith((states) => Color.fromARGB(255, 69, 69, 69)),
    //         value: volume,
    //         groupValue: dish.fieldSelection.selectedField,
    //         onChanged: (Option? value) {
    //           setState(() {
    //             dish.fieldSelection.selectedField = value!;
    //           });
    //         }),
    //   ]));
    // }
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    double fontSize = width / 25;
    //
    return AlertDialog(
        insetPadding: const EdgeInsets.all(20),
        backgroundColor: const Color.fromARGB(247, 79, 102, 59),
        title: Text(
          dishHttpModel.name ?? '',
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 22),
        ),
        actionsAlignment: MainAxisAlignment.center,
        content: SizedBox(
          //  height: height * 0.9,
          width: width * 0.96,
          child: ListView(shrinkWrap: true, children: [
            Column(mainAxisSize: MainAxisSize.max, children: [
              // 666666666666665Divider(color: Colors.black),
              InkWell(
                onTap: () {
                  final imageProvider =
                      Image.network(dishHttpModel.imageLinks.first).image;
                  showImageViewer(context, imageProvider,
                      swipeDismissible: true, doubleTapZoomable: true);
                },
                child: Container(
                  height: height / 3.5,
                  decoration: BoxDecoration(
                      color: Colors.black54,
                      border: Border.all(
                          width: 2,
                          color: const Color.fromARGB(211, 45, 45, 45)),
                      borderRadius: BorderRadius.circular(20.0)),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20.0),
                    child: CachedNetworkImage(
                        imageUrl: (dishHttpModel.imageLinks.isEmpty)
                            ? ''
                            : dishHttpModel.imageLinks.first,
                        placeholder: (context, url) =>
                            const CircularProgressIndicator(),
                        errorWidget: (context, url, error) =>
                            const Icon(Icons.error),
                        fit: BoxFit.cover),
                  ),
                ),
              ),
              SizedBox(
                height: height / 90,
              ),
              (dishHttpModel.description != '')
                  ? const Divider(color: Color.fromARGB(255, 255, 255, 255))
                  : Container(),

              Column(mainAxisAlignment: MainAxisAlignment.center, children: [
                (dishHttpModel.description != '')
                    ? const Text(
                        'Состав: ',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      )
                    : Container(),
                (dishHttpModel.description != '')
                    ? SizedBox(
                        height: height / 6.5,
                        child: Text(dishHttpModel.description ?? ''))
                    : Container(),

                SizedBox(
                  width: width * 0.9,
                  height: height * 0.002,
                  child: Container(
                    decoration: const BoxDecoration(
                        gradient: LinearGradient(colors: [
                      Color.fromARGB(0, 255, 255, 255),
                      Color.fromARGB(220, 255, 255, 255),
                      Color.fromARGB(0, 255, 255, 255),
                    ])),
                  ),
                ),
                // Divider(color: const Color.fromARGB(255, 255, 255, 255)),
                (dishHttpModel.proteinsAmount != 0) &
                        (dishHttpModel.fatAmount != 0) &
                        (dishHttpModel.carbohydratesAmount != 0) &
                        (dishHttpModel.energyAmount != 0)
                    ? const Text(
                        'Пищевая ценность (100 грамм) ',
                        textDirection: TextDirection.ltr,
                        textAlign: TextAlign.right,
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.normal,
                        ),
                      )
                    : Container(),
                (dishHttpModel.proteinsAmount != 0) &
                        (dishHttpModel.fatAmount != 0) &
                        (dishHttpModel.carbohydratesAmount != 0) &
                        (dishHttpModel.energyAmount != 0)
                    ? SizedBox(
                        height: height / 50,
                      )
                    : Container(),
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  // SizedBox(
                  //   width: width / 70,
                  // ),
                  // Пищевая ценность
                  (dishHttpModel.proteinsAmount != 0)
                      ? Column(
                          children: [
                            const Text(
                              'Белки ',
                              textDirection: TextDirection.ltr,
                              textAlign: TextAlign.right,
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                            Text(
                              ' ${dishHttpModel.proteinsAmount!.toInt()} г.',
                              textDirection: TextDirection.ltr,
                              textAlign: TextAlign.right,
                              style: const TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.normal,
                              ),
                            )
                          ],
                        )
                      : Container(),
                  SizedBox(
                    width: width / 40,
                  ),
                  (dishHttpModel.fatAmount != 0)
                      ? Column(
                          children: [
                            const Text(
                              'Жиры ',
                              textDirection: TextDirection.ltr,
                              textAlign: TextAlign.right,
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                            Text(
                              ' ${dishHttpModel.fatAmount!.toInt()} г.',
                              textDirection: TextDirection.ltr,
                              textAlign: TextAlign.right,
                              style: const TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.normal,
                              ),
                            )
                          ],
                        )
                      : Container(),
                  SizedBox(
                    width: width / 40,
                  ),
                  (dishHttpModel.carbohydratesAmount != 0)
                      ? Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              'Углеводы ',
                              textDirection: TextDirection.ltr,
                              textAlign: TextAlign.right,
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                            Text(
                              ' ${dishHttpModel.carbohydratesAmount!.toInt()} г.',
                              textDirection: TextDirection.ltr,
                              textAlign: TextAlign.right,
                              style: const TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.normal,
                              ),
                            )
                          ],
                        )
                      : Container(),
                  SizedBox(
                    width: width / 40,
                  ),
                  (dishHttpModel.energyAmount != 0)
                      ? Column(
                          children: [
                            const Text(
                              'Энерг. цен. ',
                              textDirection: TextDirection.ltr,
                              textAlign: TextAlign.right,
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                            Text(
                              ' ${dishHttpModel.energyAmount!.toInt()} ккал.',
                              textDirection: TextDirection.ltr,
                              textAlign: TextAlign.right,
                              style: const TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.normal,
                              ),
                            )
                          ],
                        )
                      : Container(),

                  // Энергетическая ценность
                ]),
              ]),

              propertiesWidget.isNotEmpty
                  ? Padding(padding: EdgeInsets.only(top: height * 0.02))
                  : const Column(),

              Column(children: volumesWidget),
              propertiesWidget.isNotEmpty
                  ? Divider(color: const Color.fromARGB(255, 255, 255, 255))
                  : Row(),

              propertiesWidget.isNotEmpty
                  ? const Text(
                      'Выберите добавки',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    )
                  : const Column(),
              Padding(padding: EdgeInsets.only(top: height * 0.02)),
              // dish.options.isEmpty

              propertiesWidget.isNotEmpty
                  ? Row(children: [
                      Expanded(
                        flex: 6,
                        child: Text('Название добавки',
                            style: TextStyle(
                                color: const Color.fromARGB(255, 236, 43, 43),
                                fontSize: fontSize)),
                      ),
                      Expanded(
                        flex: 2,
                        child: Text(
                          'Цена,₽',
                          style: TextStyle(
                              color: const Color.fromARGB(255, 246, 35, 35),
                              fontSize: fontSize),
                        ),
                      ),
                    ])
                  : const Row(),
              Column(children: propertiesWidget),

              // CounterWidget(
              //   onChange: ((counter) {
              //     dish.count = counter;
              //   }),
              // ),
              propertiesWidget.isNotEmpty
                  ? const Divider(color: Color.fromARGB(255, 255, 255, 255))
                  : const Row(),
              propertiesWidget.isNotEmpty
                  ? const Row(children: [
                      Expanded(
                        flex: 2,
                        child: Text(
                          'Цена,руб',
                          style: TextStyle(
                              color: Color.fromARGB(255, 226, 226, 226),
                              fontSize: 15),
                        ),
                      ),
                    ])
                  : const Row(),
              Padding(padding: EdgeInsets.only(top: height * 0.01)),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Цена:',
                    textDirection: TextDirection.ltr,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Color.fromARGB(250, 243, 243, 243),
                    ),
                  ),
                  SizedBox(
                    width: width * 0.03,
                  ),
                  Text(
                    '${dishHttpModel.currentPrice!.toInt()} руб.',
                    textDirection: TextDirection.ltr,
                    style: const TextStyle(
                      fontSize: 16,
                      color: Color.fromARGB(238, 243, 243, 243),
                    ),
                  ),
                ],
              ),
              Padding(padding: EdgeInsets.only(top: height * 0.02)),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                      // side: BorderSide(color: kFourthColor, width: 2)
                      // <-- Radius
                    ),
                    elevation: 5,
                    minimumSize: Size(height * 0.55, width * 0.12),
                  ),
                  onPressed: () {
                    BlocProvider.of<BasketBloc>(context)
                        .add(AddDishEvent(dishHttpModel: dishHttpModel));
                    Navigator.pop(context);
                  },
                  child: const Text(
                    'Добавить в корзину',
                    style: TextStyle(color: Color.fromARGB(225, 66, 66, 66)),
                  )),
            ])
          ]),
        ),
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(30))));
    // TODO: implement build
  }
}
