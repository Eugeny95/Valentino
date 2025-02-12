import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:radio_grouped_buttons/custom_buttons/custom_radio_buttons_group.dart';

import 'package:valentino/buisiness/auth_bloc/auth_bloc.dart';
import 'package:valentino/buisiness/basket_bloc/basket_bloc_bloc.dart';

import 'package:valentino/ui/constants.dart';

class AvailableSalesItem extends StatelessWidget {
  Function(int index) onSelectSale;

  AvailableSalesItem({
    Key? key,
    required this.available_sales,
    required this.onSelectSale,
  }) : super(key: key);

  final List<String> available_sales;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    print('AS$available_sales');

    return (available_sales.isEmpty == false) // Проверка есть ли активные акции
        ? Center(
            child: CustomRadioButton(
              buttonLables: available_sales,
              buttonValues: available_sales,
              radioButtonValue: (value, index) {
                onSelectSale(index);
              },
              buttonBorderColor: Color.fromARGB(255, 197, 18, 18),
              fontSize: height * 0.014,
              horizontal: true,
              enableShape: true,
              buttonSpace: 3,
              buttonColor: Colors.white,
              selectedColor: kPrimaryColor,
              buttonWidth: width * 0.45,
              buttonHeight: height * 0.05,
            ),
          )
        : Container();
  }
}
