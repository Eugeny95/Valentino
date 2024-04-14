import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:valentino/buisiness/auth_bloc/auth_bloc.dart';
import 'package:valentino/utils/Validator.dart';

// as datetimepic;

class RemovaAccountDialog extends StatefulWidget {
  RemovaAccountDialog();
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return RemovaAccountDialogState();
  }
}

class RemovaAccountDialogState extends State<RemovaAccountDialog> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return AlertDialog(
      backgroundColor: Color.fromARGB(255, 79, 102, 59),
      insetPadding: EdgeInsets.all(30),
      title: Column(
        children: [
          Text(
            'Удалить аккаунт?',
            style: TextStyle(color: Color.fromARGB(248, 255, 255, 255)),
          ),
        ],
      ),
      actionsAlignment: MainAxisAlignment.center,
      content: Container(
          width: width,
          height: height * 0.13,
          child: Column(children: [
            Text(
              'Это необратимое действие. История ваших заказов и другая информация пропадет ',
              style: TextStyle(
                  color: Color.fromARGB(248, 255, 255, 255), fontSize: 12),
            ),
            Padding(padding: EdgeInsets.only(top: height * 0.02)),
            Form(
                child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromARGB(248, 255, 255, 255),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12), // <-- Radius
                      ),
                      elevation: 5,
                      minimumSize: Size(height * 0.16, width * 0.11),
                    ),
                    onPressed: () async {
                      Navigator.pop(context);
                    },
                    child: Text(
                      'Отмена',
                      style: TextStyle(color: Colors.black),
                    )),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromARGB(248, 255, 255, 255),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12), // <-- Radius
                      ),
                      elevation: 5,
                      minimumSize: Size(height * 0.16, width * 0.11),
                    ),
                    onPressed: () async {
                      try {
                        final result =
                            await InternetAddress.lookup('google.com');
                        if (result.isNotEmpty &&
                            result[0].rawAddress.isNotEmpty) {}
                      } on SocketException catch (_) {
                        showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: Text('Внимание'),
                                content: Text('Нед доступа к Интернету'),
                              );
                            });
                      }
                      // Response responce = await Dio().post(
                      //   'http://91.222.236.176:8880/auth/delete/',

                      //   // options: Options(headers: <String, String>{
                      //   //   'authorization': 'Bearer ${accessToken}'
                      //   // })
                      // );
                      try {
                        Response response = await await Dio()
                            .delete('http://91.222.236.176:8880/auth/delete/',
                                options: Options(headers: <String, String>{
                                  // 'authorization': 'Bearer ${accessToken}'
                                }));

                        Navigator.pop(context);

                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text('Ваш аккаунт успешно удален')));
                      } on DioError catch (e) {
                        // print('pisun');
                        // if (e.response?.statusCode == 409) {
                        ScaffoldMessenger.of(context)
                            .showSnackBar(SnackBar(content: Text('Ошибка')));
                      }
                    },
                    child: Text(
                      'Удалить',
                      style: TextStyle(color: Colors.red),
                    )),
              ],
            ))
          ])),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20))),
    );

    // TODO: implement build
  }
}
