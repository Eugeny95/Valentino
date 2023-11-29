import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:valentino/ui/constants.dart';

class StorePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return StorePageState();
  }
}

class StorePageState extends State<StorePage> {
  @override
  Widget build(BuildContext context) {
    // BasketObject basket = Provider.of<BasketObject>(context);
    // OrderController _orderController =
    //     Provider.of<OrderController>(context, listen: true);

    List<Widget> positions = [];
    // List<HistoryPreview> orders = [];
    // for (int i = 0; i < _orderController.historyOrders.length; i++) {
    //   orders.add(HistoryPreview(
    //     _orderController.historyOrders[i],
    //     key: UniqueKey(),
    //   ));
    // }

    return Scaffold(
        appBar: AppBar(
            backgroundColor: kPrimaryColor,
            title:
                Text('История заказов', style: TextStyle(color: const Color.fromARGB(255, 239, 239, 239)))),
        body: ListView(
          children: [
            Column(children: positions),
            Column(
                // children: orders,
                )
          ],
        ));
  }
  // TODO: implement build
}
