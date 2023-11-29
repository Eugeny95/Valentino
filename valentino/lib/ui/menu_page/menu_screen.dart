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
  final scrollController = ScrollController();

  int selectCategoryIndex = 0;
  ScrollPhysics? scrollPhysics = NeverScrollableScrollPhysics();

  double restaurantInfoHeighth = 220 + 120 - kToolbarHeight;
  double lastPosition = 0;

  late AutoScrollController controller;

  void _onScrollEvent() {
    final extentAfter = scrollController.position.extentAfter;
    if (lastPosition <= restaurantInfoHeighth)
      scrollPhysics = null;
    else {
      print('null');
      scrollPhysics = NeverScrollableScrollPhysics();
    }
    ;
    lastPosition = extentAfter;
  }

  @override
  void initState() {
    scrollController.addListener(_onScrollEvent);
    super.initState();
    controller = AutoScrollController(
        keepScrollOffset: false,
        viewportBoundaryGetter: () =>
            Rect.fromLTRB(0, 0, 0, MediaQuery.of(context).padding.bottom),
        axis: Axis.vertical);
  }

  Widget _wrapScrollTag({required int index, required Widget child}) =>
      AutoScrollTag(
        key: ValueKey(index),
        controller: controller,
        index: index,
        child: child,
        highlightColor: Colors.black.withOpacity(0.1),
      );

  Future<void> scrollToCategory(int index) async {
    await controller.scrollToIndex(index,
        duration: Duration(milliseconds: 500),
        preferPosition: AutoScrollPosition.begin);
    controller.highlight(index);
    setState(() {
      selectCategoryIndex = 500;
      scrollPhysics = null;
      scrollController.animateTo(123,
          duration: Duration(seconds: 1), curve: Curves.linear);
    });
  }

// List<double> breackPoints = [];
// void createBreackPoints(){.

//   double firstBreackPoint =
//   restaurantInfoHeighth + 50 +
//   (100 * demoCategoryMenus[0].items.length);

//   breackPoints.add(firstBreackPoint);
//   for (var i=1; i<demoCategoryMenus.length; i++){
//     double breackPoint =
//     breackPoints.last + 50 +
//   (116 * demoCategoryMenus[i].items.length);
//   breackPoints.add(breackPoint);

//   }
// }

// void updateCategoryIndexOnScroll (double offset){
//    for (var i=1; i<demoCategoryMenus.length; i++){
//     if (i==0){
//       if ((offset< breackPoints.first) & (selectCategoryIndex !=0)){
//       setState(() {
//         selectCategoryIndex = 0;
//       });
//     }
//      }
//       else if ((breackPoints[i-1] <= offset)& (offset<breackPoints[i])){
//         if (selectCategoryIndex !=1){
//           setState(() {
//             selectCategoryIndex =i;
//           });
//         }
//       }
// }}

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Container(
      color: Color.fromARGB(0, 62, 62, 62),
      child: CustomScrollView(
        controller: scrollController,
        slivers: <Widget>[
          SliverAppBar(
              pinned: false,
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
                          size: 25, color: Color.fromARGB(189, 255, 255, 255)),
                      onPressed: () {
                        // showDialog(
                        //   context: context,
                        //   builder: (BuildContext context) {
                        //     // return PushDialog(
                        //     //     // Provider.of<CoffeHouse>(context, listen: true)
                        //     //     //     .photos
                        //     //     );
                        //   },
                        // );
                      }),
                  top: 45,
                  right: 10,
                ),
              ])),
          SliverList(
            // key: focusKey,
            delegate: SliverChildListDelegate([
              Align(
                  alignment: Alignment.center, //or choose another Alignment
                  child: Container(
                      color: Colors.transparent,
                      width: width - (0.01 * width),
                      child: AboutWidget())),
              //  SliverToBoxAdapter(
              //    child: SliverPersistentHeader(
              //               delegate: RestaurantCategories(
              //                   onChanged: scrollToCategory,
              //                   selectedIndex: selectCategoryIndex),
              //            floating:  true,
              //               pinned: false,
              //            // ),
              //    ),
              //  ),
              ElevatedButton(
                  onPressed: () {
                    scrollToCategory(6);
                  },
                  child: Text('press me')),
              BlocBuilder<MenuBloc, MenuState>(
                builder: (context, state) {
                  return (state.menuStatus == MenuStatus.done)
                      ? Container(
                          //ЭТО ЕБАНЫЙ КОСТЫЛЬ!!!!!
                          height: state.menuHttpModel!.menu!.length *
                                  (height / 3.7) +
                              20000,
                          child: ListView.builder(
                            controller: controller,
                            physics: scrollPhysics,
                            shrinkWrap: true,
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            itemCount: state.menuHttpModel!.menu!.length,
                            itemBuilder:
                                (BuildContext context, int categoryIndex) {
                              CategoryHttpModel items =
                                  state.menuHttpModel!.menu![categoryIndex];
                              if (state.menuHttpModel!.menu![categoryIndex]
                                      .items ==
                                  null) return Container();
                              return _wrapScrollTag(
                                index: categoryIndex,
                                child: MenuCategoryItem(
                                  title: state.menuHttpModel!
                                      .menu![categoryIndex].category_name!,
                                  items: List.generate(
                                      state.menuHttpModel!.menu![categoryIndex]
                                          .items!.length,
                                      (index) => MenuCard(
                                            dishHttpModel: state
                                                .menuHttpModel!
                                                .menu![categoryIndex]
                                                .items![index],
                                          )),
                                ),
                              );
                            },
                          ))
                      : CircularProgressIndicator();
                },
              )
            ], semanticIndexOffset: selectCategoryIndex),
          ),
        ],
      ),
    );
  }
}
