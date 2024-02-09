import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:valentino/ui/constants.dart';

class HistoryPreview extends StatefulWidget {
  @override
  State<HistoryPreview> createState() => _HistoryPreviewState();
}

class _HistoryPreviewState extends State<HistoryPreview> {
  String status = '';
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    // if (orderObject!.isAccepted) status = 'Заказ принят';
    // if (!orderObject!.isAccepted) status = 'Ожидает подтверждения';
    // if (orderObject!.isReady) status = 'Заказ готов';

    return Container(
        constraints: BoxConstraints(
          minHeight: height * 0.2,
          minWidth: width * 0.95,
        ),
        child: Card(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15),
                  topRight: Radius.circular(15),
                  bottomRight: Radius.circular(15),
                  bottomLeft: Radius.circular(15))),
          elevation: 20,
          color: Color.fromARGB(255, 79, 102, 59),
          child: Column(children: [
            SizedBox(
              height: height * 0.01,
            ),
            Container(
              width: width * 0.95,
              child: Column(children: [
                Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Color.fromARGB(148, 0, 0, 0),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  // color: Colors.red,
                  child: Row(
                    children: [
                      SizedBox(
                        width: width * 0.02,
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Icon(
                                  Icons.check_circle_outline,
                                  color: Color.fromARGB(255, 17, 99, 21),
                                  size: 26,
                                ),
                                SizedBox(
                                  width: width * 0.02,
                                ),
                                Text(
                                  'Заказ выполнен ',
                                  // ${orderObject!.ids}

                                  style: TextStyle(
                                      fontSize: 22,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: height * 0.005,
                            ),
                            Text(
                              '09.02.2024     18:30 ',
                              // ${orderObject!.ids}

                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        flex: 5,
                      ),
                      Expanded(
                        child: Container(
                            height: height * 0.05,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage(
                                  "assets/VB.png",
                                ),
                                // opacity: 0.60,
                                fit: BoxFit.cover,
                              ),
                            )),
                        flex: 1,
                      ),
                    ],
                  ),
                ),
                Column(
                  children: [
                    SizedBox(
                      height: height * 0.02,
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: width * 0.02,
                        ),
                        Expanded(
                          child: Text('Мясное антисапи',
                              style: TextStyle(
                                  fontWeight: FontWeight.normal,
                                  color: Color.fromARGB(255, 229, 229, 229),
                                  fontSize: 14)),
                          flex: 7,
                        ),
                        Expanded(
                            child: Row(
                              children: [
                                Text(
                                  '2',
                                  // state
                                  //     .positions![
                                  //         index]
                                  //     .count
                                  //     .toString(),
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 229, 229, 229),
                                      fontSize: 14),
                                ),
                                Text(
                                  ' x ',
                                  // state
                                  //     .positions![
                                  //         index]
                                  //     .count
                                  //     .toString(),
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 229, 229, 229),
                                      fontSize: 14),
                                ),
                                Text(
                                  '700₽',
                                  // line.totalCost.toInt().toString(),
                                  // '${state.positions![index].allCost!.toInt()} ₽',
                                  textAlign: TextAlign.right,
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 229, 229, 229),
                                      fontSize: 14),
                                ),
                              ],
                            ),
                            flex: 2),
                      ],
                    ),
                    SizedBox(
                      height: height * 0.01,
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: width * 0.02,
                        ),
                        Expanded(
                          child: Text(
                              'Оливки какие-то с очень длинным названием',
                              style: TextStyle(
                                  fontWeight: FontWeight.normal,
                                  color: Color.fromARGB(255, 229, 229, 229),
                                  fontSize: 14)),
                          flex: 7,
                        ),
                        Expanded(
                            child: Row(
                              children: [
                                Text(
                                  '1',
                                  // state
                                  //     .positions![
                                  //         index]
                                  //     .count
                                  //     .toString(),
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 229, 229, 229),
                                      fontSize: 14),
                                ),
                                Text(
                                  ' x ',
                                  // state
                                  //     .positions![
                                  //         index]
                                  //     .count
                                  //     .toString(),
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 229, 229, 229),
                                      fontSize: 14),
                                ),
                                Text(
                                  '900₽',
                                  // line.totalCost.toInt().toString(),
                                  // '${state.positions![index].allCost!.toInt()} ₽',
                                  textAlign: TextAlign.right,
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 229, 229, 229),
                                      fontSize: 14),
                                ),
                              ],
                            ),
                            flex: 2),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
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
                    SizedBox(
                      height: height * 0.01,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text('Итого:',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Color.fromARGB(255, 245, 245, 245),
                                fontSize: 16)),
                        SizedBox(width: width * 0.03),
                        Text(
                          '2600 ₽',
                          // line.totalCost.toInt().toString(),
                          // '${state.positions![index].allCost!.toInt()} ₽',
                          textAlign: TextAlign.right,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 229, 229, 229),
                              fontSize: 16),
                        ),
                      ],
                    ),
                  ],
                ),
              ]),
            ),
            SizedBox(
              height: height * 0.015,
            ),
          ]),
        ));
  }
}
