import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:valentino/ui/constants.dart';
import 'package:valentino/ui/menu_page/components/table_dialog.dart';

final List<String> imgList = [
  'http://91.222.236.176:8880/image/image/home_1.jpg',
  'http://91.222.236.176:8880/image/image/home_2.jpg',
  'http://91.222.236.176:8880/image/image/home_3.jpg',
  'http://91.222.236.176:8880/image/image/home_4.jpg',
  'http://91.222.236.176:8880/image/image/home_5.jpg'
];

final List<Widget> imageSliders = imgList
    .map((item) => Container(
          margin: const EdgeInsets.all(5.0),
          child: ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(20.0)),
              child: Stack(
                children: <Widget>[
                  CachedNetworkImage(
                      imageUrl: item, fit: BoxFit.cover, width: 1000.0),
                  Positioned(
                    bottom: 0.0,
                    left: 0.0,
                    right: 0.0,
                    child: Container(
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Color.fromARGB(200, 0, 0, 0),
                            Color.fromARGB(0, 0, 0, 0)
                          ],
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                        ),
                      ),
                      padding: const EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 20.0),
                      // child: Text(
                      //   'No. ${imgList.indexOf(item)} image',
                      //   style: TextStyle(
                      //     color: Colors.white,
                      //     fontSize: 20.0,
                      //     fontWeight: FontWeight.bold,
                      //   ),
                      // ),
                    ),
                  ),
                ],
              )),
        ))
    .toList();

class Cerousel extends StatelessWidget {
  const Cerousel({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          FloatingActionButton.small(
            backgroundColor: kPrimaryColor,
            onPressed: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return TableDialog();
                },
              );
            },
            child: Icon(
              Icons.table_bar_outlined,
              size: 22,
              color: Color.fromARGB(189, 255, 255, 255),
            ),
            shape: RoundedRectangleBorder(
                side: BorderSide(
                    width: 1, color: Color.fromARGB(49, 255, 255, 255)),
                borderRadius: BorderRadius.circular(100)),
          ),
        ],
        title: const Center(
          child: Text(
            '    Valentino',
            style: TextStyle(
                fontFamily: 'SHAL',
                color: Colors.red,
                fontSize: 65,
                fontWeight: FontWeight.normal),
          ),
        ),
        backgroundColor: Colors.transparent,
      ),
      body: CarouselSlider(
        options: CarouselOptions(
          autoPlay: true,
          aspectRatio: 2.0,
          enlargeCenterPage: true,
        ),
        items: imageSliders,
      ),
    );
  }
}
