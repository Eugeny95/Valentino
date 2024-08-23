import 'package:auth_feature/data/auth_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:valentino/buisiness/auth_bloc/auth_bloc.dart';
import 'package:valentino/ui/auth_page/signin_or_signup_screen.dart';
import 'package:valentino/ui/constants.dart';

class AboutAppPage extends StatefulWidget {
  @override
  _AboutAppPageState createState() {
    return _AboutAppPageState();
  }
}

class _AboutAppPageState extends State<AboutAppPage> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
        appBar: AppBar(
            iconTheme: IconThemeData(color: Color.fromARGB(180, 253, 253, 253)),
            backgroundColor: kPrimaryColor,
            title: Text('О приложении',
                style: TextStyle(
                    color: Color.fromARGB(202, 255, 255, 255), fontSize: 18))),
        body: Center(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Text(
            'Версия 2.0.1, сборка 1',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          SizedBox(
            height: 20,
          ),
          // GestureDetector(
          //         child: Container(
          //             width: width * 0.93,
          //             height: height * 0.05,
          //             decoration: BoxDecoration(
          //               boxShadow: [
          //                 BoxShadow(
          //                   color: Colors.grey.withOpacity(0.5),
          //                   spreadRadius: 2,
          //                   blurRadius: 3,
          //                   offset: Offset(0, 2), // changes position of shadow
          //                 ),
          //               ],
          //               border: Border.all(
          //                   width: 2, color: Color.fromARGB(74, 88, 88, 88)),
          //               borderRadius: BorderRadius.circular(10.0),

          //               color: Colors.red,
          //               image: DecorationImage(
          //                   image: AssetImage(
          //                     "assets/PinBon.png",
          //                   ),
          //                   opacity: 0.1,
          //                   fit: BoxFit.fitHeight),
          //               // button text
          //             ),
          //             child: Center(
          //               child: Row(
          //                 mainAxisAlignment: MainAxisAlignment.center,
          //                 children: [
          //                   Text(
          //                     "Поделиться приложением    ",
          //                     textAlign: TextAlign.center,
          //                     style: TextStyle(
          //                         fontFamily: 'Moniqa',
          //                         color: Color.fromARGB(207, 34, 34, 34),
          //                         fontSize: height * 0.024,
          //                         height: 0.9,
          //                         fontWeight: FontWeight.bold),
          //                   ),
          //                   Icon(
          //                     Icons.send,
          //                     size: 25,
          //                     color: kIconsColor,
          //                   ),
          //                 ],
          //               ),
          //             )),
          //         // onTap: () async {
          //         //   Share.share(
          //         //       'Посмотрите новое  мобильное приложение https://apps.apple.com/ru/app/youtube/id544007664',
          //         //       subject: 'Pinzeria Bontempi');
          //         // },
          //       )
        ])));
  }
}
