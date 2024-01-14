import 'package:data_layer/models/category_http_model.dart';
import 'package:data_layer/models/menu_http_model.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rive/rive.dart';
import 'package:scroll_to_index/scroll_to_index.dart';
import 'package:valentino/buisiness/menu_bloc/menu_bloc.dart';
import 'package:valentino/ui/menu_page/components/carousel.dart';
import 'package:valentino/ui/menu_page/components/categories.dart';
import 'package:valentino/ui/menu_page/components/menu_card.dart';
import 'package:valentino/ui/menu_page/components/table_dialog.dart';

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
      GlobalKey globalKey = GlobalKey();
      globalKeys.add(globalKey);
      if (state.menuHttpModel!.menu![i].items!.isEmpty) continue;
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
          physics: ScrollPhysics(),
          controller: scrollController,
          slivers: <Widget>[
            SliverAppBar(
                pinned: true,
                snap: false,
                floating: false,
                expandedHeight: height / 3.0,
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
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        // backgroundColor: Color.fromARGB(0, 77, 77, 77),
                        shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(100), // <-- Radius
                        ),
                        // elevation: 5,
                        minimumSize: Size(height * 0.05, width * 0.14),
                      ),
                      child:
                          // Text('Забронировать \n столик',
                          //     textAlign: TextAlign.center,
                          //     style: TextStyle(
                          //         fontSize: 10,
                          //         color: Color.fromARGB(189, 255, 255, 255))),
                          Icon(Icons.table_bar_outlined,
                              size: 24,
                              color: Color.fromARGB(189, 255, 255, 255)),
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return TableDialog();
                          },
                        );
                      },
                    ),
                    top: 35,
                    right: 10,
                  ),
                ])),

            SliverAppBar(
              toolbarHeight: height / 60,
              pinned: true,
              snap: false,
              floating: false,
              flexibleSpace: ListView(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                children: <Widget>[
                  BlocBuilder<MenuBloc, MenuState>(
                    builder: (context, state) {
                      if (state.menuStatus == MenuStatus.done)
                        return ListView.builder(
                            scrollDirection: Axis.horizontal,
                            shrinkWrap: true,
                            itemCount: state.menuHttpModel!.menu!.length,
                            itemBuilder: (context, index) {
                              if (state.menuHttpModel!.menu![index]!.items!
                                  .isEmpty) return Column();
                              return Container(
                                margin: EdgeInsets.only(left: 7),
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    minimumSize:
                                        Size(height * 0.12, width * 0.1),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(
                                          12), // <-- Radius
                                    ),
                                    elevation: 10,
                                  ),
                                  onPressed: () {
                                    Scrollable.ensureVisible(
                                        globalKeys[index].currentContext!);
                                  },
                                  child: Text(
                                      state.menuHttpModel!.menu![index]
                                          .category_name
                                          .toString(),
                                      style: TextStyle(
                                          // fontFamily: 'Moniqa',
                                          fontWeight: FontWeight.normal,
                                          fontSize: 13,
                                          color: Color.fromARGB(
                                              255, 245, 245, 245))),
                                ),
                              );
                            });
                      else
                        return Column();
                    },
                  ),
                ],
              ),
            ),

            // Row(children: [
            //   SizedBox(
            //     width: width / 4,
            //     height: height / 20,
            //     child: ElevatedButton(
            //         onPressed: () {
            //           Scrollable.ensureVisible(globalKeys[0].currentContext!);
            //         },
            //         child: Text('Итал закуски')),
            //   ),
            //   SizedBox(
            //     width: width / 4,
            //     height: height / 20,
            //     child: ElevatedButton(
            //         onPressed: () {
            //           Scrollable.ensureVisible(globalKeys[1].currentContext!);
            //         },
            //         child: Text('Напитки')),
            //   ),
            //   SizedBox(
            //     width: width / 4,
            //     height: height / 20,
            //     child: ElevatedButton(
            //         onPressed: () {
            //           Scrollable.ensureVisible(globalKeys[2].currentContext!);
            //         },
            //         child: Text('Соусы')),
            //   ),
            // ]),
            // expandedHeight: height / 20,
            // collapsedHeight: height / 13,

            SliverList(
              delegate: SliverChildListDelegate(
                [
                  BlocBuilder<MenuBloc, MenuState>(
                    builder: (context, state) {
                      return (state.menuStatus == MenuStatus.done)
                          ? generateItems(state)
                          : Center(child: CircularProgressIndicator());
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
