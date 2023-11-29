import 'package:data_layer/models/category_http_model.dart';
import 'package:data_layer/models/menu_http_model.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rive/rive.dart';
import 'package:scroll_to_index/scroll_to_index.dart';
import 'package:valentino/buisiness/menu_bloc/menu_bloc.dart';
import 'package:valentino/models/menu.dart';
import 'package:valentino/ui/constants.dart';

import 'package:valentino/ui/menu_page/components/about_widget.dart';
import 'package:valentino/ui/menu_page/components/carousel.dart';
import 'package:valentino/ui/menu_page/components/categories.dart';
import 'package:valentino/ui/menu_page/components/menu_card.dart';

class MenuPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState

    return _MenuPageState();
  }
}

class _MenuPageState extends State<MenuPage> {
  double restaurantInfoHeighth = 220 + 120 - kToolbarHeight;
  List<GlobalKey> globalKeys = [];
  final scrollController = ScrollController();
  @override
  void initState() {
    super.initState();
  }

  Widget generateItems(MenuState state) {
    List<Widget> categoriesWidget = [];
    globalKeys = [];
    if (state.menuHttpModel!.menu == null) return Container();
    for (int i = 0; i < state.menuHttpModel!.menu!.length; i++) {
      if (state.menuHttpModel!.menu![i].items == null) continue;
      GlobalKey globalKey = GlobalKey();
      globalKeys.add(globalKey);
      categoriesWidget.add(MenuCategoryItem(
        key: globalKey,
        title: state.menuHttpModel!.menu![i].category_name!,
        items: List.generate(
            state.menuHttpModel!.menu![i].items!.length,
            (index) => MenuCard(
                  dishHttpModel: state.menuHttpModel!.menu![i].items![index],
                )),
      ));
    }
    return Column(children: categoriesWidget);
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        color: Color.fromARGB(0, 62, 62, 62),
        child: CustomScrollView(
          controller: scrollController,
          slivers: <Widget>[
            SliverAppBar(
                pinned: true,
                snap: false,
                floating: false,
                expandedHeight: height / 3.2,
                // backgroundColor: Colors.transparent,
                flexibleSpace: Stack(children: [
                  Container(
                    child: Cerousel(),
                    decoration: BoxDecoration(
                        color: Color.fromARGB(255, 116, 116, 116),
                        borderRadius: BorderRadius.only(
                            // bottomRight: Radius.circular(30),
                            // bottomLeft: Radius.circular(30),
                            )),
                  ),
                  Positioned(
                    child: IconButton(
                        icon: Icon(Icons.notifications,
                            size: 25,
                            color: Color.fromARGB(189, 255, 255, 255)),
                        onPressed: () {}),
                    top: 45,
                    right: 10,
                  ),
                ])),
            SliverAppBar(
              pinned: true,
              snap: false,
              floating: false,
              // bottom: PreferredSize(
              //   preferredSize: Size.fromHeight(height / 100),
              //   child: Text('jljkj'),
              // ),
              flexibleSpace: Row(children: [
                SizedBox(
                  width: width / 4,
                  height: height / 20,
                  child: ElevatedButton(
                      onPressed: () {
                        Scrollable.ensureVisible(globalKeys[0].currentContext!);
                      },
                      child: Text('Итал закуски')),
                ),
                SizedBox(
                  width: width / 4,
                  height: height / 20,
                  child: ElevatedButton(
                      onPressed: () {
                        Scrollable.ensureVisible(globalKeys[1].currentContext!);
                      },
                      child: Text('Напитки')),
                ),
                SizedBox(
                  width: width / 4,
                  height: height / 20,
                  child: ElevatedButton(
                      onPressed: () {
                        Scrollable.ensureVisible(globalKeys[2].currentContext!);
                      },
                      child: Text('Соусы')),
                ),
              ]),
              // expandedHeight: height / 20,
              // collapsedHeight: height / 13,
              toolbarHeight: height / 30,
            ),
            SliverList(
              delegate: SliverChildListDelegate(
                [
                  BlocBuilder<MenuBloc, MenuState>(
                    builder: (context, state) {
                      return (state.menuStatus == MenuStatus.done)
                          ? generateItems(state)
                          : CircularProgressIndicator();
                    },
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
