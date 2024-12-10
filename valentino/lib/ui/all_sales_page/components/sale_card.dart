import 'dart:ffi';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:data_layer/models/http_models/sale_http_model.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:valentino/ui/all_sales_page/components/select_sale_dialog.dart';

class AllSalesItem extends StatelessWidget {
  const AllSalesItem({
    Key? key,
    required this.sales,
  }) : super(key: key);

  final List sales;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return SingleChildScrollView(
        child: Center(
            // Wrap center outside of column
            child: Column(
      // crossAxisAlignment: CrossAxisAlignment.center,
      // mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        SizedBox(
            width: width * 0.9,
            // padding: const EdgeInsets.only(left: 10),
            child: GridView.count(
              scrollDirection: Axis.vertical,
              childAspectRatio: 1.7,
              shrinkWrap: true,
              physics: ScrollPhysics(),
              crossAxisCount: 1,
              children: [...sales],
            ))
      ],
    )));
  }
}

class SaleCard extends StatelessWidget {
  final SaleHttpModel saleHttpModel;
  const SaleCard({Key? key, required this.saleHttpModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    //  BlocProvider.of<BasketBloc>(context);
    return GestureDetector(
        onTap: () {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return SelectSaleDialog(saleHttpModel: saleHttpModel);
            },
          );
        },
        child: Stack(children: [
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Container(
              width: width * 0.9,
              height: height * 0.22,
              // padding: const EdgeInsets.all(2), // Border width
              decoration: BoxDecoration(
                  border: Border.all(
                      width: 2, color: const Color.fromARGB(213, 0, 0, 0)),
                  color: Colors.grey[800],
                  borderRadius: BorderRadius.circular(10.0)),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: SizedBox.fromSize(
                  // size:  Size.fromRadius(70), // Image radius
                  child: CachedNetworkImage(
                      cacheKey: (saleHttpModel.image ?? ''),
                      useOldImageOnUrlChange: true,
                      fadeInDuration: Duration(milliseconds: 500),
                      fadeOutDuration: Duration(milliseconds: 0),
                      filterQuality: FilterQuality.low,
                      imageUrl:
                          //    'https://art-lunch.ru/content/uploads/2018/07/Greek_salad_01.jpg',
                          (saleHttpModel.image ?? ''),
                      placeholder: (context, url) => Container(
                          width: 50,
                          height: 50,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Center(
                                  child: Text(
                                'Изображение загружается',
                                textAlign: TextAlign.center,
                              )),
                              CircularProgressIndicator.adaptive(),
                            ],
                          )),
                      errorWidget: (context, url, error) =>
                          const Icon(Icons.error),
                      fit: BoxFit.cover),
                ),
              ),
            ),
            // SizedBox(
            //   height: height * 0.01,
            // ),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.start,
            //   children: [
            //     SizedBox(
            //       width: width * 0.02,
            //     ),
            //     SizedBox(
            //       height: height * 0.02,
            //       child: Text(
            //         saleHttpModel.name!,
            //         textAlign: TextAlign.center,
            //         style: const TextStyle(
            //           fontSize: 16,
            //           fontWeight: FontWeight.bold,
            //           height: 0.97,
            //         ),
            //       ),
            //     ),
            //   ],
            // ),
          ]),
        ]));
  }
}
