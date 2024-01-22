import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:valentino/ui/auth_page/signin_or_signup_screen.dart';
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
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(
                      "assets/VB.png",
                    ),
                    opacity: 0.15)),
            width: width * 0.9,
            child: Column(children: [
              Container(
                height: height * 0.06,
                child: IntrinsicHeight(
                    child: Column(
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.person,
                          size: 25,
                          color: kIconsColor,
                        ),
                        SizedBox(width: width * 0.05),
                        Text(
                          'Константин',
                          style: TextStyle(fontSize: 17),
                        ),
                      ],
                    ),
                    Divider(color: const Color.fromARGB(224, 255, 255, 255)),
                  ],
                )),
              ),
              SizedBox(
                height: height * 0.01,
              ),
              Container(
                height: height * 0.06,
                child: IntrinsicHeight(
                    child: Column(
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.phone_iphone,
                          size: 25,
                          color: kIconsColor,
                        ),
                        SizedBox(width: width * 0.05),
                        Text(
                          '89991112233',
                          style: TextStyle(fontSize: 17),
                        ),
                      ],
                    ),
                    Divider(color: const Color.fromARGB(224, 255, 255, 255)),
                  ],
                )),
              ),
              SizedBox(
                height: height * 0.01,
              ),
              Container(
                height: height * 0.06,
                child: IntrinsicHeight(
                    child: Column(
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.date_range,
                          size: 25,
                          color: kIconsColor,
                        ),
                        SizedBox(width: width * 0.05),
                        Text(
                          '18.07.1994',
                          style: TextStyle(fontSize: 17),
                        ),
                      ],
                    ),
                    Divider(color: const Color.fromARGB(224, 255, 255, 255)),
                  ],
                )),
              ),
              SizedBox(
                height: height * 0.01,
              ),
              Container(
                height: height * 0.06,
                child: IntrinsicHeight(
                    child: Column(
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.email,
                          size: 25,
                          color: kIconsColor,
                        ),
                        SizedBox(width: width * 0.05),
                        Text(
                          'example@yandex.ru',
                          style: TextStyle(fontSize: 17),
                        ),
                      ],
                    ),
                    Divider(color: const Color.fromARGB(224, 255, 255, 255)),
                  ],
                )),
              ),
              SizedBox(
                height: height * 0.04,
              ),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                        side: BorderSide(
                            color: Colors.white, width: 0.3) // <-- Radius
                        ),
                    elevation: 5,
                    minimumSize: Size(height * 0.43, width * 0.13),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => SigninOrSignupScreen()),
                    );
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
                  child: Text('Изменить данные',
                      style: TextStyle(
                          color: Color.fromARGB(255, 220, 220, 220)))),
              SizedBox(
                height: height * 0.02,
              ),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                        side: BorderSide(
                            color: Colors.white, width: 0.3) // <-- Radius
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
                          TextStyle(color: Color.fromARGB(229, 227, 52, 52)))),
            ]),
          ),
        ]),
      ),
    );
  }
}
