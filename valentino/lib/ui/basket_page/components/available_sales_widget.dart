import 'package:data_layer/models/http_models/dish_http_model.dart';
import 'package:data_layer/models/http_models/order_http_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:valentino/buisiness/all_sale_bloc/all_sales_bloc.dart';
import 'package:valentino/buisiness/auth_bloc/auth_bloc.dart';
import 'package:valentino/buisiness/available_sale_bloc/available_sales_bloc.dart';
import 'package:valentino/buisiness/basket_bloc/basket_bloc_bloc.dart';
import 'package:valentino/ui/basket_page/components/available_sale_card.dart';
import 'package:valentino/ui/basket_page/data/models.dart';

class AvailabeSalesWidget extends StatefulWidget {
  Function(int id) onSelectSale;
  int? toggleForSale2;
  AddressData? addressData2;
  Function(int) onToggleChanged;
  Function(AddressData) onAdressChanged;

  AvailabeSalesWidget(
      {super.key,
      required this.onSelectSale,
      required this.toggleForSale2,
      required this.addressData2,
      required this.onToggleChanged,
      required this.onAdressChanged});

  @override
  State<StatefulWidget> createState() {
    return _AvailabeSalesWidgetState();
  }
}

class _AvailabeSalesWidgetState extends State<AvailabeSalesWidget> {
  List<GlobalKey> globalKeys = [];
  late int toggleForSale2;
  late AddressData addressData2;

  @override
  void initState() {
    super.initState();
    toggleForSale2 = widget.toggleForSale2 ?? 0;
    addressData2 = widget.addressData2 ?? addressData2;
  }

  void _changeToggleForSale(int value) {
    widget.onToggleChanged(value); // Вызываем метод из родительского виджета
    setState(() {
      toggleForSale2 = value; // Изменяем значение локальной переменной
    });
  }

  void _changeAdressData(AddressData addressData) {
    widget.onAdressChanged(
        addressData); // Вызываем метод из родительского виджета
    setState(() {
      addressData2 = addressData; // Изменяем значение локальной переменной
    });
  }

  @override
  void didUpdateWidget(AvailabeSalesWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.toggleForSale2 != widget.toggleForSale2) {
      setState(() {
        toggleForSale2 =
            widget.toggleForSale2 ?? 0; // Обновляем локальную переменную
      });
    }
    if (oldWidget.addressData2 != widget.addressData2) {
      setState(() {
        addressData2 = widget.addressData2 ??
            addressData2; // Обновляем локальную переменную
      });
    }
  }

  PaymentType paymentType = PaymentType.CardOnline;
  DishHttpModel dishHttpModel = DishHttpModel(
      id: '1',
      name: 'name',
      weight: 1,
      energyAmount: 1,
      energyFullAmount: 1,
      currentPrice: 1,
      description: 'description',
      proteinsAmount: 1,
      fatAmount: 1,
      carbohydratesAmount: 1,
      proteinsFullAmount: 1,
      fatFullAmount: 1,
      carbohydratesFullAmount: 1,
      additionalinfo: 'additionalinfo',
      modifiers: [],
      imageLinks: []);
  int saleId = -1;
  int toggleForSale = -1;
  String? promo = 'PromoS';
  OrderServiceType orderServiceType = OrderServiceType.DeliveryPickUp;

  Widget generateItems(AvailableSalesState state) {
    return AvailableSalesItem(
      onSelectSale: (int index) {
        int saleId =
            state.availableSalesHttpModel!.available_actions![index].id ?? -1;
        widget.onSelectSale(saleId);

        print(widget.toggleForSale2);

        BlocProvider.of<BasketBloc>(context).add(SlectSaleEvent(
            dishHttpModel: dishHttpModel,
            addressData: addressData2,
            promo: promo,
            user: BlocProvider.of<AuthBloc>(context).getUser(),
            orderServiceType:
                // orderServiceType,

                (toggleForSale2 == 1)
                    ? OrderServiceType.DeliveryByCourier
                    : OrderServiceType.DeliveryPickUp,
            // BlocProvider.of<BasketBloc>(context).getOrderServiceType(),
            paymentType: paymentType,
            saleId: saleId));
      },
      // key: globalKey,
      available_sales: List.generate(
        state.availableSalesHttpModel!.available_actions!.length,
        (index) => state
            .availableSalesHttpModel!.available_actions![index].title
            .toString(),
      ),
    );
    // });
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Container(
        padding: const EdgeInsets.only(top: 20),
        color: const Color.fromARGB(0, 62, 62, 62),
        child: BlocBuilder<AvailableSalesBloc, AvailableSalesState>(
          builder: (context, state) {
            return (state.availableSalesStatus == AvailableSalesStatus.done)
                ? generateItems(state)
                : Column(
                    children: [
                      const Center(child: CircularProgressIndicator()),
                    ],
                  );
          },
        ));
  }
}
