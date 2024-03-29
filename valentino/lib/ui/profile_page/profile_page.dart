import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:valentino/buisiness/auth_bloc/auth_bloc.dart';
import 'package:valentino/ui/profile_page/components/about_app_page.dart';
import 'package:valentino/ui/profile_page/components/about_restaurant_page.dart';
import 'package:valentino/ui/profile_page/components/about_widget.dart';

import 'package:valentino/ui/profile_page/components/client_data_page.dart';
import 'package:valentino/ui/profile_page/components/delivery_map_page.dart';
import 'package:valentino/ui/profile_page/components/privacy_policy_page.dart';
import 'package:valentino/ui/profile_page/components/social_network_widget.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() {
    return _ProfilePageState();
  }
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Stack(
      children: [
        Container(
          width: width * 0.98,
          child: Column(children: [
            Padding(padding: EdgeInsets.only(top: 40)),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(width: width / 7),
                Text(
                  'Valentino',
                  style: TextStyle(
                      fontFamily: 'SHAL',
                      color: Colors.red,
                      fontSize: 65,
                      fontWeight: FontWeight.normal),
                ),
              ],
            ),
            Text(
              '      Bontempi',
              style: TextStyle(
                  fontFamily: 'SHAL',
                  color: Color.fromARGB(255, 69, 161, 48),
                  fontSize: 65,
                  height: 0.2,
                  fontWeight: FontWeight.normal),
            ),
            Padding(padding: EdgeInsets.only(top: 30)),
            Align(
                alignment: Alignment.center, //or choose another Alignment
                child: Container(
                    color: Colors.transparent,
                    width: width - (0.01 * width),
                    child: AboutWidget())),
            Padding(padding: EdgeInsets.only(top: 20)),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                      side: BorderSide(
                          color: Colors.white, width: 0.2) // <-- Radius
                      ),
                  elevation: 5,
                  minimumSize: Size(height * 0.43, width * 0.12),
                ),
                onPressed: () {
                  AuthBloc authBloc = BlocProvider.of<AuthBloc>(context);
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => BlocProvider<AuthBloc>.value(
                            value: authBloc, //
                            child: ClientDataPage()),
                      ));
                },
                child: Row(
                  children: [
                    Icon(
                      Icons.person,
                      size: 22,
                      color: Colors.white,
                    ),
                    SizedBox(
                      width: width * 0.03,
                    ),
                    Text('Данные пользователя',
                        style: TextStyle(
                            color: Color.fromARGB(255, 255, 255, 255))),
                  ],
                )),
            Padding(padding: EdgeInsets.only(top: 15)),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                      side: BorderSide(
                          color: Colors.white, width: 0.2) // <-- Radius
                      ),
                  elevation: 5,
                  minimumSize: Size(height * 0.43, width * 0.12),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => DeliveryMapPage()),
                  );
                },
                child: Row(
                  children: [
                    Icon(
                      Icons.map,
                      size: 22,
                      color: Colors.white,
                    ),
                    SizedBox(
                      width: width * 0.03,
                    ),
                    Text('Карта доставки',
                        style: TextStyle(color: Colors.white)),
                  ],
                )),
            Padding(padding: EdgeInsets.only(top: 6)),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                      side: BorderSide(
                          color: Colors.white, width: 0.2) // <-- Radius
                      ),
                  elevation: 5,
                  minimumSize: Size(height * 0.43, width * 0.12),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => AboutRestaurantPage()),
                  );
                },
                child: Row(
                  children: [
                    Icon(
                      Icons.restaurant,
                      size: 18,
                      color: Colors.white,
                    ),
                    SizedBox(
                      width: width * 0.03,
                    ),
                    Text('О ресторане',
                        style: TextStyle(
                            color: Color.fromARGB(255, 255, 255, 255))),
                  ],
                )),
            Padding(padding: EdgeInsets.only(top: 15)),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                      side: BorderSide(
                          color: Colors.white, width: 0.2) // <-- Radius
                      ),
                  elevation: 5,
                  minimumSize: Size(height * 0.43, width * 0.12),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => PrivacyPolicyPage()),
                  );
                },
                child: Row(
                  children: [
                    Icon(
                      Icons.privacy_tip_outlined,
                      size: 22,
                      color: Colors.white,
                    ),
                    SizedBox(
                      width: width * 0.03,
                    ),
                    Text('Политика конфиденциальности',
                        style: TextStyle(
                          color: Colors.white,
                        )),
                  ],
                )),
            Padding(padding: EdgeInsets.only(top: 6)),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                      side: BorderSide(
                          color: Colors.white, width: 0.2) // <-- Radius
                      ),
                  elevation: 5,
                  minimumSize: Size(height * 0.43, width * 0.12),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => AboutAppPage()),
                  );
                },
                child: Row(
                  children: [
                    Icon(
                      Icons.phone_iphone,
                      size: 22,
                      color: Colors.white,
                    ),
                    SizedBox(
                      width: width * 0.03,
                    ),
                    Text('О приложении',
                        style: TextStyle(
                          color: Colors.white,
                        )),
                  ],
                )),
            Padding(padding: EdgeInsets.only(top: 40)),
            Align(
                alignment: Alignment.center, //or choose another Alignment
                child: Container(
                    color: Colors.transparent,
                    width: width - (0.01 * width),
                    child: SocialNetworkWidget())),
          ]),
        ),
      ],
    );
  }
}
