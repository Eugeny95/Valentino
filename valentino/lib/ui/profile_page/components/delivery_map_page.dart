import 'package:auth_feature/data/auth_data.dart';
import 'package:easy_image_viewer/easy_image_viewer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:valentino/buisiness/auth_bloc/auth_bloc.dart';
import 'package:valentino/ui/auth_page/signin_or_signup_screen.dart';
import 'package:valentino/ui/constants.dart';

class DeliveryMapPage extends StatefulWidget {
  @override
  _DeliveryMapPageState createState() {
    return _DeliveryMapPageState();
  }
}

class _DeliveryMapPageState extends State<DeliveryMapPage> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
        appBar: AppBar(
            iconTheme: IconThemeData(color: Color.fromARGB(180, 253, 253, 253)),
            backgroundColor: kPrimaryColor,
            title: Text('Карта доставки',
                style: TextStyle(
                    color: Color.fromARGB(202, 255, 255, 255), fontSize: 18))),
        body: Center(
            child: Container(
          width: width * 0.9,
          child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
            Padding(padding: EdgeInsets.only(top: 20)),
            InkWell(
                onTap: () {
                  final imageProvider = Image.asset(
                    "assets/map.png",
                    fit: BoxFit.fill,
                  ).image;
                  showImageViewer(context, imageProvider,
                      swipeDismissible: true, doubleTapZoomable: true);
                },
                child: Container(
                  width: width * 0.9,
                  height: height * 0.5,
                  padding: EdgeInsets.all(2), // Border width
                  decoration: BoxDecoration(
                      color: Colors.grey[800],
                      borderRadius: BorderRadius.circular(15.0)),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15.0),
                    child: SizedBox.fromSize(
                      size: Size.fromRadius(70), // Image radius
                      child: Image.asset(
                        "assets/map.png",
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                )),
            Padding(padding: EdgeInsets.only(top: 10)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  height: height * 0.02,
                  width: width * 0.1,
                  color: Color.fromARGB(180, 92, 239, 97),
                ),
                Text(
                  '- стоимость доставки 400 руб.',
                  style: TextStyle(fontWeight: FontWeight.normal, fontSize: 16),
                ),
              ],
            ),
            Padding(padding: EdgeInsets.only(top: 5)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  height: height * 0.02,
                  width: width * 0.1,
                  color: Colors.orange,
                ),
                Text(
                  '- стоимость доставки 600 руб.',
                  style: TextStyle(fontWeight: FontWeight.normal, fontSize: 16),
                ),
              ],
            ),
            Padding(padding: EdgeInsets.only(top: 5)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  height: height * 0.02,
                  width: width * 0.1,
                  color: Colors.yellow,
                ),
                Text(
                  '- стоимость доставки 800 руб.',
                  style: TextStyle(fontWeight: FontWeight.normal, fontSize: 16),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
          ]),
        )));
  }
}
