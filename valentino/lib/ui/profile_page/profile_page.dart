import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:valentino/ui/profile_page/about_widget.dart';
import 'package:valentino/ui/profile_page/clientdata_page.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() {
    return _ProfilePageState();
  }
}

class _ProfilePageState extends State<ProfilePage> {
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
    return Stack(
      children: [
        Column(children: [
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
                height: 0.4,
                fontWeight: FontWeight.normal),
          ),
          Padding(padding: EdgeInsets.only(top: 30)),
          Align(
              alignment: Alignment.center, //or choose another Alignment
              child: Container(
                  color: Colors.transparent,
                  width: width - (0.01 * width),
                  child: AboutWidget())),
          Padding(padding: EdgeInsets.only(top: 10)),
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12), // <-- Radius
                ),
                elevation: 5,
                minimumSize: Size(height * 0.43, width * 0.12),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ClientDataPage()),
                );
              },
              child: Row(
                children: [
                  Icon(Icons.person_2_outlined, size: 22),
                  SizedBox(
                    width: width * 0.03,
                  ),
                  Text('Данные пользователя',
                      style:
                          TextStyle(color: Color.fromARGB(255, 221, 221, 221))),
                ],
              )),
          Padding(padding: EdgeInsets.only(top: 6)),
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12), // <-- Radius
                ),
                elevation: 5,
                minimumSize: Size(height * 0.43, width * 0.12),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ClientDataPage()),
                );
              },
              child: Row(
                children: [
                  Icon(Icons.map, size: 22),
                  SizedBox(
                    width: width * 0.03,
                  ),
                  Text('Карта доставки',
                      style:
                          TextStyle(color: Color.fromARGB(255, 221, 221, 221))),
                ],
              )),
          Padding(padding: EdgeInsets.only(top: 40)),
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12), // <-- Radius
                ),
                elevation: 5,
                minimumSize: Size(height * 0.43, width * 0.12),
              ),
              onPressed: () {
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(builder: (context) => ClientDataPage()),
                // );
              },
              child: Row(
                children: [
                  Icon(Icons.privacy_tip_outlined, size: 20),
                  SizedBox(
                    width: width * 0.03,
                  ),
                  Text('Политика конфиденциальности',
                      style:
                          TextStyle(color: Color.fromARGB(255, 221, 221, 221))),
                ],
              )),
          Padding(padding: EdgeInsets.only(top: 40)),
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12), // <-- Radius
                ),
                elevation: 5,
                minimumSize: Size(height * 0.43, width * 0.12),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ClientDataPage()),
                );
              },
              child: Row(
                children: [
                  Icon(Icons.phone_iphone, size: 22),
                  SizedBox(
                    width: width * 0.03,
                  ),
                  Text('О приложении',
                      style:
                          TextStyle(color: Color.fromARGB(255, 221, 221, 221))),
                ],
              )),
          Padding(padding: EdgeInsets.only(top: 6)),
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12), // <-- Radius
                ),
                elevation: 5,
                minimumSize: Size(height * 0.43, width * 0.12),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ClientDataPage()),
                );
              },
              child: Row(
                children: [
                  Icon(Icons.update, size: 22),
                  SizedBox(
                    width: width * 0.03,
                  ),
                  Text('Обратная связь',
                      style:
                          TextStyle(color: Color.fromARGB(255, 221, 221, 221))),
                ],
              )),
        ]),
      ],
    );
  }
}
