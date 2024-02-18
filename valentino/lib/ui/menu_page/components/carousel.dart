import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final List<String> imgList = [
  'https://lh3.googleusercontent.com/p/AF1QipN83HvGYsyX-n9vvqHqnf28hXsrQvCC4IogQ-q-=s680-w680-h510',
  'https://avatars.mds.yandex.net/get-altay/1132477/2a00000186f3fc415c9925d5ef77e670333b/XXXL',
  'https://valentino-vrn.ru/upload/iblock/09e/qfxsy3ekftdb600end9qljk1kxtebtci.JPG',
  'https://media-cdn.tripadvisor.com/media/photo-s/29/c8/f5/ec/valentino.jpg',
  'https://valentino-vrn.ru/upload/iblock/65f/u0b248kd6htfrln5jodfvj5apelc1wac.JPG',
  'https://valentino-vrn.ru/upload/iblock/6ed/o490ig40sv2tqh1zeunkipjo1v1hwnyj.JPG'
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
        title: const Center(
          child: Column(children: [
            Text(
              'Valentino',
              style: TextStyle(
                  fontFamily: 'SHAL',
                  color: Colors.red,
                  fontSize: 55,
                  fontWeight: FontWeight.normal),
            ),
          ]),
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
