import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:valentino/ui/auth_page/register_dialog.dart';
import 'package:valentino/ui/constants.dart';

class SigninOrSignupScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return SigninOrSignupScreenState();
  }
}

class SigninOrSignupScreenState extends State<SigninOrSignupScreen> {
  String login = '';
  String password = '';
  String status = '';
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
            child: Column(
              children: [
                Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        Container(
                            // width: width * 0.85,
                            child: Column(children: [
                          SizedBox(height: kDefaultPadding * 3),
                          Container(
                              height: height / 3,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(25),
                                    bottomRight: Radius.circular(25)),
                                image: DecorationImage(
                                  image: AssetImage(
                                    "assets/VB.png",
                                  ),
                                  opacity: 0.60,
                                  fit: BoxFit.fitWidth,
                                ),
                              )),
                          //Spacer(flex: 1),
                          SizedBox(height: kDefaultPadding * 0.9),
                          SizedBox(
                            height: height * 0.07,
                            child: TextFormField(
                              cursorColor: Color.fromARGB(139, 255, 255, 255),

                              //controller: TextEditingController()..text = dateTime,

                              //initialValue: dateTime,
                              keyboardType: TextInputType.number,
                              inputFormatters: <TextInputFormatter>[
                                FilteringTextInputFormatter.allow(
                                    RegExp(r'[0-9.,]'))
                              ],
                              // validator: (value) => Validator.isPhoneValid(value),
                              onChanged: (String value) {
                                login = value;
                              },
                              decoration: InputDecoration(
                                  fillColor: Color.fromARGB(139, 255, 255, 255),
                                  focusColor:
                                      Color.fromRGBO(255, 255, 255, 0.545),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: BorderSide(
                                          color: Color.fromARGB(
                                              199, 255, 255, 255),
                                          width: 1.0)),
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: BorderSide(
                                          color: Color.fromRGBO(
                                              255, 255, 255, 0.545),
                                          width: 1.0)),
                                  prefixIcon: Icon(Icons.phone_iphone,
                                      color:
                                          Color.fromARGB(139, 255, 255, 255)),
                                  labelText: 'Телефон',
                                  labelStyle: TextStyle(
                                      color: Color.fromARGB(139, 255, 255, 255),
                                      fontSize: 14)),
                            ),
                          ),
                          SizedBox(height: kDefaultPadding * 0.7),
                          SizedBox(
                            height: height * 0.07,
                            child: TextFormField(
                              cursorColor: Color.fromARGB(139, 255, 255, 255),
                              //controller: TextEditingController()..text = dateTime,
                              obscureText: true,
                              //initialValue: dateTime,
                              // validator: (value) =>
                              //     Validator.isPasswordValid(value),
                              onChanged: (String value) {
                                password = value;
                              },
                              decoration: InputDecoration(
                                  fillColor: Color.fromARGB(139, 255, 255, 255),
                                  focusColor:
                                      Color.fromARGB(139, 255, 255, 255),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10)),
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: BorderSide(
                                          color: Color.fromARGB(
                                              199, 255, 255, 255),
                                          width: 1.0)),
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: BorderSide(
                                          color: Color.fromARGB(
                                              139, 255, 255, 255),
                                          width: 1.0)),
                                  prefixIcon: Icon(Icons.key,
                                      color:
                                          Color.fromARGB(139, 255, 255, 255)),
                                  labelText: 'Пароль',
                                  labelStyle: TextStyle(
                                      color: Color.fromARGB(139, 255, 255, 255),
                                      fontSize: 14)),
                            ),
                          ),
                          // Spacer(flex: 2),
                          // Spacer(),
                          SizedBox(height: kDefaultPadding * 1.5),
                          // BlocBuilder<AuthBloc, AuthState>(
                          //   builder: (context, state) {
                          //     return Text(state.message,
                          //         style: TextStyle(color: Colors.red));
                          //   },
                          // ),
                          SizedBox(height: kDefaultPadding * 0.5),
                          ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15),
                                    side: BorderSide(
                                        color: Colors.white,
                                        width: 0.3) // <-- Radius
                                    ),
                                elevation: 5,
                                minimumSize: Size(height * 0.4, width * 0.12),
                              ),
                              child: Text(
                                "Войти",
                                style: TextStyle(
                                    color: Color.fromARGB(218, 255, 255, 255),
                                    fontSize: 13),
                              ),
                              onPressed: () {
                                // if (!_formKey.currentState!.validate()) return;

                                // BlocProvider.of<AuthBloc>(context).add(
                                //     AuthEventLogin(
                                //         login: login, password: password));
                              }),
                          SizedBox(height: kDefaultPadding * 0.5),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15),
                                  side: BorderSide(
                                      color: Colors.white,
                                      width: 0.3) // <-- Radius
                                  ),
                              elevation: 5,
                              minimumSize: Size(height * 0.4, width * 0.12),
                            ),
                            // color: Theme.of(context).colorScheme.secondary,
                            child: Text(
                              "Зарегестрироваться",
                              style: TextStyle(
                                  color: Color.fromARGB(170, 255, 255, 255)),
                            ),
                            onPressed: () {
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return RegisterDialog();
                                },
                              );
                            },
                          ),
                          //Spacer(flex: 1),
                        ])),
                      ],
                    )),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
