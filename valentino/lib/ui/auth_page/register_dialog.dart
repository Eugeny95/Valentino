import 'dart:io';

import 'package:auth_feature/data/auth_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_datetime_picker_plus/flutter_datetime_picker_plus.dart';
import 'package:intl/intl.dart';
import 'package:valentino/buisiness/auth_bloc/auth_bloc.dart';

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
  String lastname = '';

  String phone = '';
  String email = '';
  String password = '';
  String retypePassword = '';
  String textStatus = '';
  bool obscurePassword1 = true;
  bool obscurePassword2 = true;
  String message = '';
  DateTime date_birth = DateTime.now();

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
                      textCapitalization: TextCapitalization.words,
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
                      cursorColor: Color.fromARGB(217, 255, 255, 255),
                      textCapitalization: TextCapitalization.words,
                      // validator: (value) => Validator.isEmptyValid(value!),
                      onChanged: (String value) {
                        lastname = value;
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
                          labelText: 'Фамилия',
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
                      onChanged: (String value) {},
                      onTap: () async {
                        DateTime date = DateTime(1900);
                        FocusScope.of(context).requestFocus(new FocusNode());
                        date_birth = await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(1950),
                              lastDate: DateTime(2030),
                            ) ??
                            date;

                        dateCtl.text =
                            DateFormat('dd.MM.yyyy').format(date_birth);
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
                      textStatus,
                      style: TextStyle(color: Colors.red),
                    ),

                    // BlocBuilder<AuthBloc, AuthState>(
                    //   builder: (context, state) {
                    //     if (state.message == 'Успех') {
                    //       Navigator.pop(context);
                    //     }
                    //     return Text(state.message,
                    //         style: TextStyle(color: Colors.red));
                    //   },
                    // ),
                    Padding(padding: EdgeInsets.only(top: height * 0.01)),
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
                          UserData userData = UserData();
                          userData.first_name = firstname;
                          userData.last_name = lastname;
                          userData.username = phone;
                          userData.email = email;
                          userData.password = password;
                          userData.date_birth = date_birth;

                          AuthStatus status =
                              await BlocProvider.of<AuthBloc>(context)
                                  .registerUser(userData);
                          switch (status) {
                            case AuthStatus.authorized:
                              {
                                ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                        content: Text('Успешная регистрация')));
                                BlocProvider.of<AuthBloc>(context)
                                    .add(RegisterEvent());
                                Navigator.pop(context, true);
                                break;
                              }
                            case AuthStatus.initial:
                              break;

                            case AuthStatus.user_exist:
                              {
                                setState(() {
                                  textStatus = 'Пользоваетель существует';
                                });
                                break;
                              }

                            default:
                              {
                                setState(() {
                                  textStatus = 'Неизвестная ошибка сервера';
                                });
                                break;
                              }
                          }
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

  @override
  void dispose() {
    BlocProvider.of<AuthBloc>(context).add(RegisterEvent());
    // TODO: implement dispose
    super.dispose();
  }
}
