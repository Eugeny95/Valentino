import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:valentino/utils/Validator.dart';

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
  String phone = '';
  final _formKey = GlobalKey<FormState>();
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
            'Забыли пароль?',
            style: TextStyle(color: Color.fromARGB(248, 255, 255, 255)),
          ),
        ],
      ),
      actionsAlignment: MainAxisAlignment.center,
      content: Container(
          width: width,
          height: height * 0.35,
          child: Column(children: [
            Text(
              'Укажите номер телефона, и мы вышлем ссылку восстановления пароля на e-mail, указанный при регистрации',
              style: TextStyle(
                  color: Color.fromARGB(248, 255, 255, 255), fontSize: 12),
            ),
            Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(padding: EdgeInsets.only(top: height * 0.02)),
                    TextFormField(
                      style: TextStyle(color: Colors.white),
                      cursorColor: Color.fromARGB(248, 255, 255, 255),
                      keyboardType: TextInputType.number,
                      onChanged: (String value) {
                        phone = value;
                      },
                      inputFormatters: <TextInputFormatter>[
                        FilteringTextInputFormatter.allow(RegExp(r'[0-9.,]'))
                      ],
                      validator: (value) => Validator.isPhoneValid(value),
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10)),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(
                                  color: Color.fromARGB(248, 255, 255, 255),
                                  width: 2.0)),
                          prefixIcon: Icon(Icons.phone_iphone,
                              color: Color.fromARGB(248, 255, 255, 255)),
                          labelText: 'Телефон',
                          labelStyle: TextStyle(
                              color: Color.fromARGB(248, 255, 255, 255))),
                    ),
                    Padding(padding: EdgeInsets.only(top: height * 0.03)),
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color.fromARGB(248, 255, 255, 255),
                          shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.circular(12), // <-- Radius
                          ),
                          elevation: 5,
                          minimumSize: Size(height * 0.75, width * 0.12),
                        ),
                        onPressed: () async {
                          // if (!_formKey.currentState!.validate()) return;
                          // BlocProvider.of<RegisterBlocBloc>(context)
                          //     .add(ForgetPasswordEvent(phone: phone));
                          // Navigator.pop(context);
                        },
                        child: Text(
                          'Восстановить пароль',
                          style: TextStyle(),
                        )),
                    Padding(padding: EdgeInsets.only(top: height * 0.02)),
                    TextButton(
                      child: Text('Отмена',
                          style: TextStyle(
                              color: Color.fromARGB(248, 255, 255, 255),
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

    // TODO: implement build
  }
}
