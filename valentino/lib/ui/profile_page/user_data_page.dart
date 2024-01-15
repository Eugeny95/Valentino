import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:valentino/ui/constants.dart';

class UserDataPage extends StatefulWidget {
  @override
  _UserDataPageState createState() {
    return _UserDataPageState();
  }
}

class _UserDataPageState extends State<UserDataPage> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
          iconTheme: IconThemeData(color: Color.fromARGB(180, 253, 253, 253)),
          backgroundColor: kPrimaryColor,
          title: Text('Данные пользователя',
              style: TextStyle(
                  color: Color.fromARGB(202, 255, 255, 255), fontSize: 18))),
      body: Center(
        child: Column(children: [
          Padding(padding: EdgeInsets.only(top: 20)),
          CircleAvatar(
            backgroundColor: kThirdColor,
            radius: 74,
            child: Text('Name',
                // name.substring(0, 2),
                style: TextStyle(color: Colors.white)),
          ),
          Padding(padding: EdgeInsets.only(top: 30)),
          Container(
            width: width * 0.9,
            child: Column(children: [
              Container(
                  child: Row(
                children: [
                  Icon(Icons.person, size: 30),
                  Expanded(
                    child: Text(
                      'Игнат',
                      style: TextStyle(fontSize: 24),
                    ),
                    flex: 7,
                  ),
                ],
              )),
              Divider(
                color: Colors.black,
              ),
              SizedBox(
                height: height * 0.02,
              ),
              Container(
                  child: Row(
                children: [
                  Icon(Icons.phone_iphone_outlined, size: 30),
                  Expanded(
                    child: Text(
                      '89001002233',
                      style: TextStyle(fontSize: 24),
                    ),
                    flex: 7,
                  ),
                ],
              )),
              Divider(
                color: Colors.black,
              ),
              SizedBox(
                height: height * 0.05,
              ),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.circular(12), // <-- Radius
                          ),
                          elevation: 5,
                          minimumSize: Size(height * 0.13, width * 0.13),
                        ),
                        onPressed: () {},
                        child: Row(
                          children: [
                            Icon(Icons.phone,
                                size: 25,
                                color: Color.fromARGB(255, 42, 90, 44)),
                            SizedBox(
                              width: width * 0.02,
                            ),
                            Text('Вызов',
                                style: TextStyle(
                                    color: Color.fromARGB(255, 220, 220, 220))),
                          ],
                        )),
                    flex: 4,
                  ),
                  SizedBox(
                    width: width * 0.02,
                  ),
                  Expanded(
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.circular(12), // <-- Radius
                          ),
                          elevation: 5,
                          minimumSize: Size(height * 0.13, width * 0.13),
                        ),
                        onPressed: () {},
                        child: Row(
                          children: [
                            Icon(Icons.message_outlined,
                                size: 25,
                                color: Color.fromARGB(255, 42, 90, 44)),
                            SizedBox(
                              width: width * 0.02,
                            ),
                            Text('Начать чат',
                                style: TextStyle(
                                    color: Color.fromARGB(255, 220, 220, 220))),
                          ],
                        )),
                    flex: 5,
                  ),
                ],
              ),
            ]),
          ),
        ]),
      ),
    );
  }
}
