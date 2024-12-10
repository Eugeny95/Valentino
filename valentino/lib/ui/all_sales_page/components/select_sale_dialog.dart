import 'package:cached_network_image/cached_network_image.dart';
import 'package:data_layer/models/http_models/sale_http_model.dart';

import 'package:easy_image_viewer/easy_image_viewer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SelectSaleDialog extends StatefulWidget {
  SaleHttpModel saleHttpModel;

  SelectSaleDialog({
    super.key,
    required this.saleHttpModel,
  });

  // SelectDishDialog(this.dish);
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return SelectSaleDialogState();
  }
}

class SelectSaleDialogState extends State<SelectSaleDialog> {
  @override
  Widget build(BuildContext context) {
    List<Widget> propertiesWidget = [];
    List<Widget> volumesWidget = [];
    SaleHttpModel saleHttpModel = widget.saleHttpModel;

    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    double fontSize = width / 25;
    //
    return AlertDialog(
      contentPadding: EdgeInsets.all(3),
      insetPadding: const EdgeInsets.all(20),
      backgroundColor: const Color.fromARGB(247, 79, 102, 59),
      actionsAlignment: MainAxisAlignment.start,
      content: SizedBox(
          width: width * 0.96,
          child: ListView(
            shrinkWrap: true,
            children: [
              Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  InkWell(
                    onTap: () {
                      final imageProvider =
                          Image.network(saleHttpModel.image ?? '').image;
                      showImageViewer(context, imageProvider,
                          swipeDismissible: true, doubleTapZoomable: true);
                    },
                    child: Container(
                      // height: height / 1.5,
                      decoration: BoxDecoration(
                          color: Colors.black54,
                          border: Border.all(
                              width: 2,
                              color: const Color.fromARGB(211, 45, 45, 45)),
                          borderRadius: BorderRadius.circular(15.0)),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(15.0),
                        child: CachedNetworkImage(
                            imageUrl: (saleHttpModel.image ?? ''),
                            placeholder: (context, url) =>
                                const CircularProgressIndicator(),
                            errorWidget: (context, url, error) =>
                                const Icon(Icons.error),
                            fit: BoxFit.cover),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: height * 0.005,
                  ),
                  Text(
                    saleHttpModel.title ?? '',
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.normal),
                  ),
                  SizedBox(
                    height: height * 0.004,
                  ),
                  (saleHttpModel.descryption != '')
                      ? SizedBox(
                          width: width * 0.9,
                          height: height * 0.002,
                          child: Container(
                            decoration: const BoxDecoration(
                                gradient: LinearGradient(colors: [
                              Color.fromARGB(0, 255, 255, 255),
                              Color.fromARGB(220, 255, 255, 255),
                              Color.fromARGB(0, 255, 255, 255),
                            ])),
                          ),
                        )
                      : Container(),
                  SizedBox(
                    height: height * 0.01,
                  ),
                  Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        (saleHttpModel.descryption != '')
                            ? SizedBox(
                                // height: height / 7.5,
                                child: Text(
                                saleHttpModel.descryption ?? '',
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.normal),
                              ))
                            : Container(),
                        SizedBox(
                          height: height * 0.03,
                        ),
                      ])
                ],
              )
            ],
          )),
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(15))),
    );

    // TODO: implement build
  }
}
