import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// as datetimepic;

class TableDialog extends StatefulWidget {
  TableDialog();
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return TableDialogState();
  }
}

class TableDialogState extends State<TableDialog> {
  String firstname = '';

  String phone = '';

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
            'Забронировать столик',
            style: TextStyle(color: Color.fromARGB(172, 255, 255, 255)),
          ),
        ],
      ),
      actionsAlignment: MainAxisAlignment.center,
      content: Container(
          width: width,
          height: height * 0.45,
          child: Column(children: [
            Text(
              'С Вами свяжется наш менеджер и уточнит детали',
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
                                  color: Color.fromARGB(139, 255, 255, 255),
                                  width: 2.0)),
                          prefixIcon: Icon(Icons.person_add,
                              color: Color.fromARGB(139, 255, 255, 255)),
                          labelText: 'Имя',
                          labelStyle: TextStyle(
                              color: Color.fromARGB(139, 255, 255, 255))),
                    ),
                    Padding(padding: EdgeInsets.only(top: height * 0.03)),
                    TextFormField(
                      cursorColor: Color.fromARGB(139, 255, 255, 255),
                      keyboardType: TextInputType.number,
                      inputFormatters: <TextInputFormatter>[
                        FilteringTextInputFormatter.allow(RegExp(r'[0-9.,]'))
                      ],
                      // validator: (value) => Validator.isPhoneValid(value),
                      onChanged: (String value) {
                        phone = value;
                      },
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10)),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(
                                  color: Color.fromARGB(139, 255, 255, 255),
                                  width: 2.0)),
                          prefixIcon: Icon(Icons.phone_iphone,
                              color: Color.fromARGB(139, 255, 255, 255)),
                          labelText: 'Телефон',
                          labelStyle: TextStyle(
                              color: Color.fromARGB(139, 255, 255, 255))),
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

                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.circular(12), // <-- Radius
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
                        child: Text('Отправить')),
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

    // TODO: implement build
  }
}
