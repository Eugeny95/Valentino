import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:valentino/ui/constants.dart';

class SocialNetworkWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    // TODO: implement build
    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                  // <-- Radius
                ),
                padding: EdgeInsets.all(2),
                elevation: 5,
                minimumSize: Size(height * 0.06, width * 0.13),
              ),
              onPressed: () async {
                final url = "https://vk.com/valentino_vrn";
                if (await canLaunch(url)) {
                  await launch(
                    url,
                  );
                }
              },
              clipBehavior: Clip.antiAlias,
              child: Container(
                child: Image.asset(
                  "assets/VK.png",
                  width: width * 0.12,
                  fit: BoxFit.cover,
                ),
              )),

          // Padding(padding: EdgeInsets.only(left: 10)),
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                  // <-- Radius
                ),
                padding: EdgeInsets.all(2),
                elevation: 5,
                minimumSize: Size(height * 0.06, width * 0.13),
              ),
              onPressed: () async {
                final url =
                    "https://api.whatsapp.com/send/?phone=79515542002&text&type=phone_number&app_absent=0";
                if (await canLaunch(url)) {
                  await launch(
                    url,
                  );
                }
              },
              clipBehavior: Clip.antiAlias,
              child: Container(
                child: Image.asset(
                  "assets/WA.png",
                  width: width * 0.08,
                  fit: BoxFit.cover,
                ),
              )),
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                  // <-- Radius
                ),
                padding: EdgeInsets.all(2),
                elevation: 5,
                minimumSize: Size(height * 0.06, width * 0.13),
              ),
              onPressed: () async {
                final url = "https://t.me/Valentino_vrn";
                if (await canLaunch(url)) {
                  await launch(
                    url,
                  );
                }
              },
              clipBehavior: Clip.antiAlias,
              child: Container(
                child: Image.asset(
                  "assets/Telegram.png",
                  width: width * 0.1,
                  fit: BoxFit.cover,
                ),
              )),
        ]);
  }
}
