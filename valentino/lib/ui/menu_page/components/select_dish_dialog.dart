import 'package:cached_network_image/cached_network_image.dart';
import 'package:data_layer/models/dish_http_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:valentino/buisiness/basket_bloc/basket_bloc_bloc.dart';

// TODO можно в будущем сделать категории подгружаемыми с интернета

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
    DishHttpModel dishHttpModel = this.widget.dishHttpModel;
    for (int i = 0; i < dishHttpModel.modifiers!.length; i++) {
      if (dishHttpModel.modifiers![i].name == 'на вынос' ||
          dishHttpModel.modifiers![i].name == '-одновременно' ||
          dishHttpModel.modifiers![i].name == 'коробка' ||
          dishHttpModel.modifiers![i].name == 'лист') continue;
      propertiesWidget.add(Row(children: [
        Expanded(
          child: Text(dishHttpModel.modifiers![i].name!),
          flex: 3,
        ),
        Checkbox(
          activeColor: Color.fromARGB(255, 89, 89, 89),
          value: dishHttpModel.modifiers![i].isSelected,
          onChanged: (value) {
            setState(() {
              print('used ${value}');
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
        insetPadding: EdgeInsets.all(20),
        title: Text(
          dishHttpModel.name ?? '',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 22),
        ),
        actionsAlignment: MainAxisAlignment.center,
        content: Container(
          height: height * 0.9,
          width: width * 0.96,
          child: ListView(shrinkWrap: true, children: [
            Container(
                //width: width * 0.8,
                child: Column(mainAxisSize: MainAxisSize.max, children: [
              // 666666666666665Divider(color: Colors.black),
              Container(
                height: height / 3.5,
                decoration: BoxDecoration(
                    color: Colors.black54,
                    borderRadius: BorderRadius.circular(20.0)),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20.0),
                  child: CachedNetworkImage(
                      imageUrl: (dishHttpModel.imageLinks.isEmpty)
                          ? ''
                          : dishHttpModel.imageLinks.first,
                      placeholder: (context, url) =>
                          CircularProgressIndicator(),
                      errorWidget: (context, url, error) => Icon(Icons.error),
                      fit: BoxFit.cover),
                ),
              ),
              Divider(color: Colors.black),

              Column(mainAxisAlignment: MainAxisAlignment.center, children: [
                Text(
                  'Состав: ',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Container(
                    height: height / 6,
                    child: Text(dishHttpModel.description ?? '')),
                Divider(color: Colors.black),
                Text(
                  'Пищевая ценность (100 грамм) ',
                  textDirection: TextDirection.ltr,
                  textAlign: TextAlign.right,
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.normal,
                  ),
                ),
                SizedBox(
                  height: height / 50,
                ),
                Row(children: [
                  SizedBox(
                    width: width / 35,
                  ),
                  // Пищевая ценность
                  Column(
                    children: [
                      Text(
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
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.normal,
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    width: width / 40,
                  ),
                  Column(
                    children: [
                      Text(
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
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.normal,
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    width: width / 40,
                  ),
                  Column(
                    children: [
                      Text(
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
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.normal,
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    width: width / 40,
                  ),
                  Column(
                    children: [
                      Text(
                        'Энерг. ценность ',
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
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.normal,
                        ),
                      )
                    ],
                  ),

                  // Энергетическая ценность
                ]),
              ]),

              Padding(padding: EdgeInsets.only(top: height * 0.02)),

              Column(children: volumesWidget),
              propertiesWidget.isNotEmpty
                  ? Divider(color: Colors.black)
                  : Row(),

              propertiesWidget.isNotEmpty
                  ? Text(
                      'Выберите добавки',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    )
                  : const Column(),
              Padding(padding: EdgeInsets.only(top: height * 0.02)),
              // dish.options.isEmpty

              propertiesWidget.isNotEmpty
                  ? Row(children: [
                      Expanded(
                        child: Text('Название добавки',
                            style: TextStyle(
                                color: Color.fromARGB(255, 236, 43, 43),
                                fontSize: fontSize)),
                        flex: 6,
                      ),
                      Expanded(
                        child: Text(
                          'Цена,руб',
                          style: TextStyle(
                              color: Color.fromARGB(255, 246, 35, 35),
                              fontSize: fontSize),
                        ),
                        flex: 2,
                      ),
                    ])
                  : Row(),
              Column(children: propertiesWidget),

              // CounterWidget(
              //   onChange: ((counter) {
              //     dish.count = counter;
              //   }),
              // ),
              propertiesWidget.isNotEmpty
                  ? Divider(color: Colors.black)
                  : Row(),
              propertiesWidget.isNotEmpty
                  ? Row(children: [
                      Expanded(
                        child: Text(
                          'Цена,руб',
                          style: TextStyle(
                              color: Color.fromARGB(255, 226, 226, 226),
                              fontSize: fontSize),
                        ),
                        flex: 2,
                      ),
                    ])
                  : Row(),
              Padding(padding: EdgeInsets.only(top: height * 0.02)),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12), // <-- Radius
                    ),
                    elevation: 5,
                    minimumSize: Size(height * 0.55, width * 0.12),
                  ),
                  onPressed: () {
                    BlocProvider.of<BasketBloc>(context)
                        .add(AddDishEvent(dishHttpModel: dishHttpModel));
                    Navigator.pop(context);
                  },
                  child: Text(
                    'Добавить в корзину',
                    style: TextStyle(color: Color.fromARGB(227, 238, 238, 238)),
                  )),
            ]))
          ]),
        ),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(30))));
    // TODO: implement build
  }
}
