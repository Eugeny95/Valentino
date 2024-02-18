import 'package:auth_feature/data/auth_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:valentino/buisiness/auth_bloc/auth_bloc.dart';
import 'package:valentino/ui/auth_page/signin_or_signup_screen.dart';
import 'package:valentino/ui/constants.dart';

class PrivacyPolicyPage extends StatefulWidget {
  @override
  _PrivacyPolicyPageState createState() {
    return _PrivacyPolicyPageState();
  }
}

class _PrivacyPolicyPageState extends State<PrivacyPolicyPage> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
        appBar: AppBar(
            iconTheme: IconThemeData(color: Color.fromARGB(180, 253, 253, 253)),
            backgroundColor: kPrimaryColor,
            title: Text('Политика конфиденциальности',
                style: TextStyle(
                    color: Color.fromARGB(202, 255, 255, 255), fontSize: 18))),
        body: Center(
          child: Container(
            width: width * 0.9,
            child: ListView(
                physics: const AlwaysScrollableScrollPhysics(),
                scrollDirection: Axis.vertical,
                children: [
                  Padding(padding: EdgeInsets.only(top: 20)),
                  Text(
                      '1. Общие положения Настоящая Политика обработки персональных данных (далее – «Политика») разработана и применяется ООО «Ресторатор Премьер» (далее - «Оператор») в соответствии с Федеральным законом от 27.07.2006 г. № 152-ФЗ «О персональных данных» и определяет порядок и условия осуществления обработки персональных данных Субъектов, передавших свои персональные данные для обработки Оператору с использованием и без использования средств автоматизации, устанавливает процедуры, направленные на предотвращение нарушений законодательства Российской Федерации, связанных с обработкой персональных данных. 1.2. Настоящая Политика разработана с целью обеспечения защиты прав Субъектов при обработке их персональных данных и основана на принципе строгого соблюдения конфиденциальности персональных данных, а именно: операторы и иные лица, получившие доступ к персональным данным, обязаны не раскрывать третьим лицам и не распространять персональные данные без согласия субъекта персональных данных, если иное не предусмотрено федеральным законо............'),
                  SizedBox(
                    height: 20,
                  ),
                ]),
          ),
        ));
  }
}
