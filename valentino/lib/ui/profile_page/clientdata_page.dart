import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:valentino/ui/constants.dart';

class ClientDataPage extends StatefulWidget {
  @override
  _ClientDataPageState createState() {
    return _ClientDataPageState();
  }
}

class _ClientDataPageState extends State<ClientDataPage> {
  void rebuildAllChildren(BuildContext context) {
    void rebuild(Element el) {
      el.markNeedsBuild();
      el.visitChildren(rebuild);
    }

    (context as Element).visitChildren(rebuild);
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    // UserProfile userProfile = Provider.of<UserProfile>(context, listen: true);

    rebuildAllChildren(context);

    //userProfile.addListener(setState())
    return Scaffold(
      appBar: AppBar(
          iconTheme: IconThemeData(color: Color.fromARGB(180, 253, 253, 253)),
          backgroundColor: kPrimaryColor,
          title: Text('Данные пользователя',
              style: TextStyle(
                  color: Color.fromARGB(202, 255, 255, 255), fontSize: 18))),
      body: Center(
        child: Column(children: [
          // Padding(padding: EdgeInsets.only(top: 40)),
          // ElevatedButton(
          //   onPressed: () {
          //     Navigator.pop(context);
          //   },
          //   child: const Text('Go back!'),
          // ),
          Padding(padding: EdgeInsets.only(top: 40)),
          Container(
            width: width * 0.9,
            child: Column(children: [
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: Color.fromARGB(255, 95, 93, 93),
                      width: 1,
                    )),
                child: IntrinsicHeight(
                    child: Row(
                  children: [
                    Icon(Icons.person, size: 40),
                    VerticalDivider(
                      color: Color.fromARGB(255, 97, 97, 97),
                      width: 5,
                      thickness: 1,
                    ),
                    Expanded(
                      child: Text('Имя'),
                      flex: 7,
                    ),
                    Expanded(
                        flex: 1,
                        child: GestureDetector(
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                  color: Color.fromARGB(0, 97, 97, 97),
                                  width: 1,
                                )),
                            child: Icon(Icons.edit, size: 20),
                          ),
                          onTap: () async {
                            // showDialog(
                            //     context: context,
                            //     builder: (BuildContext context) {
                            //       return EditTextDialog(
                            //           'Введите имя', userProfile.name, (text) {
                            //         userProfile.name = text;
                            //         setState(() {});
                            //       });
                            //     });
                          },
                        ))
                  ],
                )),
              ),
              SizedBox(
                height: height * 0.02,
              ),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: Color.fromARGB(255, 99, 99, 99),
                      width: 1,
                    )),
                child: IntrinsicHeight(
                    child: Row(
                  children: [
                    Icon(Icons.phone_iphone, size: 40),
                    VerticalDivider(
                      color: Color.fromARGB(255, 97, 97, 97),
                      width: 5,
                      thickness: 1,
                    ),
                    Expanded(
                      child: Text('89952519951'),
                      flex: 7,
                    ),
                    Expanded(
                        flex: 1,
                        child: GestureDetector(
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                  color: Color.fromARGB(0, 97, 97, 97),
                                  width: 1,
                                )),
                            child: Icon(Icons.edit, size: 20),
                          ),
                          onTap: () async {
                            // showDialog(
                            //     context: context,
                            //     builder: (BuildContext context) {
                            //       return EditTextDialog(
                            //           'Введите телефон', userProfile.phone, (text) {
                            //         userProfile.phone = text;
                            //         setState(() {});
                            //       });
                            //     });
                          },
                        ))
                  ],
                )),
              ),
              SizedBox(
                height: height * 0.02,
              ),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: Color.fromARGB(255, 97, 97, 97),
                      width: 1,
                    )),
                child: IntrinsicHeight(
                    child: Row(
                  children: [
                    Icon(Icons.email, size: 40),
                    VerticalDivider(
                      color: Color.fromARGB(255, 97, 97, 97),
                      width: 5,
                      thickness: 1,
                    ),
                    Expanded(
                      child: Text('anemail@mail.ru'),
                      flex: 7,
                    ),
                    Expanded(
                        flex: 1,
                        child: GestureDetector(
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                  color: Color.fromARGB(0, 97, 97, 97),
                                  width: 1,
                                )),
                            child: Icon(Icons.edit, size: 20),
                          ),
                          onTap: () async {
                            // showDialog(
                            //     context: context,
                            //     builder: (BuildContext context) {
                            //       return EditTextDialog(
                            //           'Введите email', userProfile.email, (text) {
                            //         userProfile.email = text;
                            //         setState(() {});
                            //       });
                            //     }
                            //     );
                          },
                        ))
                  ],
                )),
              ),
              SizedBox(
                height: height * 0.02,
              ),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: Color.fromARGB(255, 97, 97, 97),
                      width: 1,
                    )),
                child: IntrinsicHeight(
                    child: Row(
                  children: [
                    Icon(Icons.home_filled, size: 40),
                    VerticalDivider(
                      color: Color.fromARGB(255, 97, 97, 97),
                      width: 5,
                      thickness: 1,
                    ),
                    Expanded(
                      child: Text('Воронеж, ул. Мира, д.5'),
                      flex: 7,
                    ),
                    Expanded(
                        flex: 1,
                        child: GestureDetector(
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                  color: Color.fromARGB(0, 97, 97, 97),
                                  width: 1,
                                )),
                            child: Icon(Icons.edit, size: 20),
                          ),
                          onTap: () async {
                            // showDialog(
                            //     context: context,
                            //     builder: (BuildContext context) {
                            //       return EditTextDialog(
                            //           'Введите email', userProfile.email, (text) {
                            //         userProfile.email = text;
                            //         setState(() {});
                            //       });
                            //     }
                            //     );
                          },
                        ))
                  ],
                )),
              ),
              SizedBox(
                height: height * 0.02,
              ),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12), // <-- Radius
                    ),
                    elevation: 5,
                    minimumSize: Size(height * 0.43, width * 0.13),
                  ),
                  onPressed: () {
                    // userProfile.requestUserData();

                    // if (Validator.isPhoneValid(userProfile.phone) != null) {
                    //   const snackBar = SnackBar(
                    //     content: Text('Введите корректный телефон'),
                    //   );
                    //   ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    //   return;
                    // }
                    // if (Validator.isEmailValid(userProfile.email) != null) {
                    //   const snackBar = SnackBar(
                    //     content: Text('Введите корректный email'),
                    //   );
                    //   ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    //   return;
                    // }
                    // userProfile.updateProfile();

                    // TODO: validator
                  },
                  child: Text('Обновить профиль',
                      style: TextStyle(
                          color: Color.fromARGB(255, 220, 220, 220)))),
              SizedBox(
                height: height * 0.02,
              ),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12), // <-- Radius
                    ),
                    elevation: 5,
                    minimumSize: Size(height * 0.43, width * 0.13),
                  ),
                  onPressed: () {
                    // userProfile.requestUserData();

                    // if (Validator.isPhoneValid(userProfile.phone) != null) {
                    //   const snackBar = SnackBar(
                    //     content: Text('Введите корректный телефон'),
                    //   );
                    //   ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    //   return;
                    // }
                    // if (Validator.isEmailValid(userProfile.email) != null) {
                    //   const snackBar = SnackBar(
                    //     content: Text('Введите корректный email'),
                    //   );
                    //   ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    //   return;
                    // }
                    // userProfile.updateProfile();

                    // TODO: validator
                  },
                  child: Text('Выйти из профиля',
                      style:
                          TextStyle(color: Color.fromARGB(167, 247, 45, 45)))),
            ]),
          ),
        ]),
      ),
    );
  }
}
