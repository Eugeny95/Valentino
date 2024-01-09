import 'package:cached_network_image/cached_network_image.dart';
import 'package:data_layer/models/dish_http_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:valentino/buisiness/basket_bloc/basket_bloc_bloc.dart';
import 'package:valentino/buisiness/menu_bloc/menu_bloc.dart';
import 'package:valentino/ui/constants.dart';

import 'package:valentino/ui/menu_page/components/select_dish_dialog.dart';

class MenuCategoryItem extends StatelessWidget {
  const MenuCategoryItem({
    Key? key,
    required this.title,
    required this.items,
  }) : super(key: key);

  final String title;
  final List items;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(top: 16),
          child: Text(
            title,
            style: const TextStyle(
              fontSize: 18,
              color: Colors.white60,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        GridView.count(
          crossAxisSpacing: 0.8,
          childAspectRatio: 0.83,
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          crossAxisCount: 2,
          children: [...items],
        )
      ],
    );
  }
}

class MenuCard extends StatelessWidget {
  final DishHttpModel dishHttpModel;
  const MenuCard({Key? key, required this.dishHttpModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    //  BlocProvider.of<BasketBloc>(context);
    return GestureDetector(
        onTap: () {
          BasketBloc basketBloc = BlocProvider.of<BasketBloc>(context);
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return BlocProvider<BasketBloc>.value(
                  value: basketBloc, //
                  child: SelectDishDialog(
                    dishHttpModel: dishHttpModel,
                  ));
            },
          );
        },
        child: Container(
            child: Stack(children: [
          Container(
            width: width / 2.2,
            height: height / 3.7,
            padding: const EdgeInsets.only(top: 4.0),
            margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0),
                color: kPrimaryColor),
            child: Column(children: [
              Container(
                width: width / 2.4,
                height: height / 7.8,
                padding: EdgeInsets.all(2), // Border width
                decoration: BoxDecoration(
                    color: Colors.grey[800],
                    borderRadius: BorderRadius.circular(20.0)),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20.0),
                  child: SizedBox.fromSize(
                    size: Size.fromRadius(70), // Image radius
                    child: CachedNetworkImage(
                        filterQuality: FilterQuality.low,
                        imageUrl:
                            //    'https://art-lunch.ru/content/uploads/2018/07/Greek_salad_01.jpg',
                            (dishHttpModel.imageLinks.isEmpty)
                                ? ''
                                : dishHttpModel.imageLinks.first,
                        placeholder: (context, url) =>
                            CircularProgressIndicator(),
                        errorWidget: (context, url, error) => Icon(Icons.error),
                        fit: BoxFit.cover),
                  ),
                ),
              ),
              Container(
                height: height / 25,
                child: Text(
                  dishHttpModel.name ?? '',
                  textDirection: TextDirection.ltr,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ),
              Row(children: [
                SizedBox(
                  width: width / 20,
                ),
                // Вес блюда
                Text(
                  '${dishHttpModel.energyFullAmount!.toInt()} ккал ',
                  textDirection: TextDirection.ltr,
                  textAlign: TextAlign.right,
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.normal,
                  ),
                ),
                Icon(Icons.circle,
                    size: 5, color: Color.fromARGB(189, 255, 255, 255)),
                // Энергетическая ценность
                Text(
                  ' ${(dishHttpModel.weight! * 1000).toInt()} гр',
                  textDirection: TextDirection.ltr,
                  textAlign: TextAlign.right,
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.normal,
                  ),
                )
              ]),
              SizedBox(
                height: height * 0.01,
              ),
              Container(
                width: width / 2.5,
                height: height / 22,
                decoration: BoxDecoration(
                    color: Color.fromARGB(255, 246, 246, 246),
                    borderRadius: BorderRadius.circular(14.0)),
                child: Center(
                  child: Text(
                    '${dishHttpModel.currentPrice!.toInt()} руб.',
                    textDirection: TextDirection.ltr,
                    style: TextStyle(
                      fontSize: 14,
                      color: const Color.fromARGB(204, 0, 0, 0),
                    ),
                  ),
                ),
              ),
            ]),
          ),
        ])));
  }
}
