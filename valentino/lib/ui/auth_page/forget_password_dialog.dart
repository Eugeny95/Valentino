import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// as datetimepic;

class ForgetPasswordDialog extends StatefulWidget {
  ForgetPasswordDialog();
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return ForgetPasswordDialogState();
  }
}

class ForgetPasswordDialogState extends State<ForgetPasswordDialog> {
  String email = '';
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return AlertDialog(
      backgroundColor: Color.fromARGB(241, 50, 50, 50),
      insetPadding: EdgeInsets.all(30),
      title: Column(
        children: [
          Text(
            'Забыли пароль?',
            style: TextStyle(color: Color.fromARGB(172, 255, 255, 255)),
          ),
        ],
      ),
      actionsAlignment: MainAxisAlignment.center,
      content: Container(
          width: width,
          height: height * 0.35,
          child: Column(children: [
            Text(
              'Укажите адресс Вашей электронной почты, на которую мы вышлем ссылку восстановления пароля',
              style: TextStyle(
                  color: Color.fromARGB(
                    172,
                    255,
                    255,
                    255,
                  ),
                  fontSize: 12),
            ),
            Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(padding: EdgeInsets.only(top: height * 0.01)),
                    TextFormField(
                      cursorColor: Color.fromARGB(139, 255, 255, 255),
                      keyboardType: TextInputType.number,
                      onChanged: (String value) {
                        email = value;
                      },
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10)),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(
                                  color: Color.fromARGB(139, 255, 255, 255),
                                  width: 2.0)),
                          prefixIcon: Icon(Icons.mail_outline,
                              color: Color.fromARGB(139, 255, 255, 255)),
                          labelText: 'Почта',
                          labelStyle: TextStyle(
                              color: Color.fromARGB(139, 255, 255, 255))),
                    ),
                    Padding(padding: EdgeInsets.only(top: height * 0.03)),
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.circular(12), // <-- Radius
                          ),
                          elevation: 5,
                          minimumSize: Size(height * 0.75, width * 0.12),
                        ),
                        onPressed: () async {},
                        child: Text(
                          'Восстановить пароль',
                          style: TextStyle(color: Colors.white),
                        )),
                    Padding(padding: EdgeInsets.only(top: height * 0.02)),
                    TextButton(
                      child: Text('Отмена',
                          style: TextStyle(
                              color: Color.fromARGB(139, 255, 255, 255),
                              fontSize: 14)),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    )
                  ],
                ))
          ])),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20))),
    );
  }
}
