import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_datetime_picker_plus/flutter_datetime_picker_plus.dart';
import 'package:valentino/ui/basket_page/TimePicker.dart';
import 'package:valentino/utils/Validator.dart';

// as datetimepic;

class RegisterDialog extends StatefulWidget {
  RegisterDialog();

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState

    return RegisterDialogState();
  }
}

class RegisterDialogState extends State<RegisterDialog> {
  TextEditingController dateCtl = TextEditingController();

  String firstname = '';

  String phone = '';
  String email = '';
  String password = '';
  String retypePassword = '';
  String status = '';
  bool obscurePassword1 = true;
  bool obscurePassword2 = true;
  String message = '';

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return AlertDialog(
      backgroundColor: Color.fromARGB(255, 79, 102, 59),
      insetPadding: EdgeInsets.all(30),
      title: Text(
        'Регистрация',
        style: TextStyle(color: Color.fromARGB(172, 255, 255, 255)),
      ),
      actionsAlignment: MainAxisAlignment.center,
      content: Container(
          width: width,
          child: ListView(children: [
            Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(padding: EdgeInsets.only(top: height * 0.03)),
                    TextFormField(
                      cursorColor: Color.fromARGB(217, 255, 255, 255),
                      // validator: (value) => Validator.isEmptyValid(value!),
                      onChanged: (String value) {
                        firstname = value;
                      },
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10)),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(
                                  color: Color.fromARGB(209, 255, 255, 255),
                                  width: 2.0)),
                          prefixIcon: Icon(Icons.person_add,
                              color: Color.fromARGB(209, 255, 255, 255)),
                          labelText: 'Имя',
                          labelStyle: TextStyle(
                              color: Color.fromARGB(209, 255, 255, 255))),
                    ),
                    Padding(padding: EdgeInsets.only(top: height * 0.015)),
                    TextFormField(
                      cursorColor: Color.fromARGB(209, 255, 255, 255),
                      keyboardType: TextInputType.number,
                      inputFormatters: <TextInputFormatter>[
                        FilteringTextInputFormatter.allow(RegExp(r'[0-9.,]'))
                      ],
                      validator: (value) => Validator.isPhoneValid(value),
                      onChanged: (String value) {
                        phone = value;
                      },
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10)),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(
                                  color: Color.fromARGB(209, 255, 255, 255),
                                  width: 2.0)),
                          prefixIcon: Icon(Icons.phone_iphone,
                              color: Color.fromARGB(209, 255, 255, 255)),
                          labelText: 'Телефон',
                          labelStyle: TextStyle(
                              color: Color.fromARGB(209, 255, 255, 255))),
                    ),
                    Padding(padding: EdgeInsets.only(top: height * 0.015)),
                    TextFormField(
                      cursorColor: Color.fromARGB(209, 255, 255, 255),
                      //controller: TextEditingController()..text = dateTime,

                      //initialValue: dateTime,
                      validator: (value) => Validator.isEmailValid(value),
                      onChanged: (String value) {
                        email = value;
                      },
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10)),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(
                                  color: Color.fromARGB(209, 255, 255, 255),
                                  width: 2.0)),
                          prefixIcon: Icon(Icons.mail,
                              color: Color.fromARGB(209, 255, 255, 255)),
                          labelText: 'Email',
                          labelStyle: TextStyle(
                              color: Color.fromARGB(209, 255, 255, 255))),
                    ),

                    Padding(padding: EdgeInsets.only(top: height * 0.015)),
                    TextFormField(
                      cursorColor: Color.fromARGB(209, 255, 255, 255),
                      controller: dateCtl,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10)),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(
                                  color: Color.fromARGB(209, 255, 255, 255),
                                  width: 2.0)),
                          prefixIcon: Icon(Icons.date_range,
                              color: Color.fromARGB(209, 255, 255, 255)),
                          labelText: 'Дата рождения',
                          labelStyle: TextStyle(
                            color: Color.fromARGB(209, 255, 255, 255),
                          )),
                      onTap: () async {
                        DateTime date = DateTime(1900);
                        FocusScope.of(context).requestFocus(new FocusNode());
                        await showDatePicker(
                          context: context,
                          // locale: const Locale("fr", "FR"),
                          initialDate: DateTime.now(),
                          firstDate: DateTime(2018),
                          lastDate: DateTime(2030),
                        );

                        dateCtl.text = date.toIso8601String();
                      },
                    ),
                    // SizedBox(
                    //   height: 200,
                    //   child: CupertinoDatePicker(
                    //     mode: CupertinoDatePickerMode.date,
                    //     initialDateTime: DateTime(1969, 1, 1),
                    //     onDateTimeChanged: (DateTime newDateTime) {
                    //       // Do something
                    //     },
                    //   ),
                    // ),

                    Padding(padding: EdgeInsets.only(top: height * 0.015)),
                    TextFormField(
                      cursorColor: Color.fromARGB(209, 255, 255, 255),
                      //controller: TextEditingController()..text = dateTime,

                      //initialValue: dateTime,
                      validator: (value) => Validator.isPasswordValid(value),
                      onChanged: (String value) {
                        password = value;
                      },
                      obscureText: obscurePassword1,
                      decoration: InputDecoration(
                          suffixIcon: GestureDetector(
                            onTap: () {
                              obscurePassword1 = !obscurePassword1;
                              setState(() {});
                            },
                            child: Icon(
                              obscurePassword1
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                              color: Color.fromARGB(209, 255, 255, 255),
                            ),
                          ),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10)),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(
                                  color: Color.fromARGB(209, 255, 255, 255),
                                  width: 2.0)),
                          prefixIcon: Icon(Icons.key,
                              color: Color.fromARGB(209, 255, 255, 255)),
                          labelText: 'Пароль',
                          labelStyle: TextStyle(
                            color: Color.fromARGB(209, 255, 255, 255),
                          )),
                    ),
                    Padding(padding: EdgeInsets.only(top: height * 0.015)),
                    TextFormField(
                      cursorColor: Color.fromARGB(209, 255, 255, 255),
                      //controller: TextEditingController()..text = dateTime,

                      //initialValue: dateTime,
                      validator: (value) =>
                          Validator.isPasswordMatch(password, retypePassword),
                      onChanged: (String value) {
                        retypePassword = value;
                      },
                      obscureText: obscurePassword2,
                      decoration: InputDecoration(
                          suffixIcon: GestureDetector(
                            onTap: () {
                              obscurePassword2 = !obscurePassword2;
                              setState(() {});
                            },
                            child: Icon(
                              obscurePassword2
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                              color: const Color.fromARGB(209, 255, 255, 255),
                            ),
                          ),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10)),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(
                                  color: Color.fromARGB(209, 255, 255, 255),
                                  width: 2.0)),
                          prefixIcon: Icon(
                            Icons.key,
                            color: Color.fromARGB(209, 255, 255, 255),
                          ),
                          labelText: 'Повторите пароль',
                          labelStyle: TextStyle(
                              color: Color.fromARGB(209, 255, 255, 255))),
                    ),
                    Text(
                      status,
                      style: TextStyle(color: Colors.red),
                    ),
                    Padding(padding: EdgeInsets.only(top: height * 0.05)),
                    // BlocBuilder<AuthBloc, AuthState>(
                    //   builder: (context, state) {
                    //     if (state.message == 'Успех') {
                    //       Navigator.pop(context);
                    //     }
                    //     return Text(state.message,
                    //         style: TextStyle(color: Colors.red));
                    //   },
                    // ),
                    Padding(padding: EdgeInsets.only(top: height * 0.03)),
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                              side: BorderSide(
                                  color: Colors.white, width: 0.3) // <-- Radius
                              ),
                          elevation: 5,
                          minimumSize: Size(height * 0.75, width * 0.12),
                        ),
                        onPressed: () async {
                          if (!_formKey.currentState!.validate()) return;
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

                          if (!_formKey.currentState!.validate()) return;
                          // BlocProvider.of<AuthBloc>(context).add(
                          //     AuthEventRegister(
                          //         firstName: firstname,
                          //         phone: phone,
                          //         email: email,
                          //         password: password));
                        },
                        child: Text('Зарегестрироваться',
                            style: TextStyle(
                                color: Color.fromARGB(217, 255, 255, 255)))),
                    Padding(padding: EdgeInsets.only(top: height * 0.01)),
                    TextButton(
                      child: Text('Отмена',
                          style: TextStyle(
                              color: Color.fromARGB(219, 255, 255, 255),
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
