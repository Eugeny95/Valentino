import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:valentino/buisiness/menu_page_bloc/menu_bloc/menu_bloc.dart';
import 'package:valentino/buisiness/menu_page_bloc/select_category_bloc/bloc/select_category_bloc.dart';
import 'package:valentino/ui/menu_page/components/carousel.dart';
import 'package:valentino/ui/menu_page/components/menu_card.dart';
import 'package:valentino/ui/menu_page/components/table_dialog.dart';
import 'package:visibility_detector/visibility_detector.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _MenuPageState();
  }
}

class _MenuPageState extends State<MenuPage> {
  double restaurantInfoHeighth = 220 + 120 - kToolbarHeight;
  List<GlobalKey> globalKeys = [];
  bool lock = false;

  final scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
  }

  Widget generateItems(MenuState state) {
    globalKeys.clear();
    return ListView.builder(
        shrinkWrap: true,
        itemCount: state.menuHttpModel!.menu!.length,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, i) {
          GlobalKey globalKey = GlobalKey();

          globalKeys.add(globalKey);
          if (state.menuHttpModel!.menu![i].items!.isEmpty) {
            return const Column();
          }
          return VisibilityDetector(
            key: Key(i.toString()),
            onVisibilityChanged: (info) async {
              print('visible ${info.key}');
              if (!lock) {
                BlocProvider.of<SelectCategoryBloc>(context).add(
                    SelectCategoryIndexEvent(
                        selectedIndex:
                            int.parse(info.key.toString().split("'")[1])));
              }
              await Future.delayed(Duration(seconds: 3)).then((value) {
                lock = false;
              });
            },
            child: MenuCategoryItem(
              key: globalKey,
              title: state.menuHttpModel!.menu![i].category_name!,
              items: List.generate(
                  state.menuHttpModel!.menu![i].items!.length,
                  (index) => MenuCard(
                        dishHttpModel:
                            state.menuHttpModel!.menu![i].items![index],
                      )),
            ),
          );
        }); //Column(children: categoriesWidget);
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        color: const Color.fromARGB(0, 62, 62, 62),
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
                    decoration: const BoxDecoration(
                        color: Color.fromARGB(255, 116, 116, 116),
                        borderRadius: BorderRadius.only(
                            // bottomRight: Radius.circular(30),
                            // bottomLeft: Radius.circular(30),
                            )),
                    child: Cerousel(),
                  ),
                  Positioned(
                    top: 35,
                    right: 10,
                    child: IconButton(
                      icon: const Icon(Icons.table_bar_outlined,
                          size: 24, color: Color.fromARGB(189, 255, 255, 255)),
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return TableDialog();
                          },
                        );
                      },
                    ),
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
                      if (state.menuStatus == MenuStatus.done) {
                        return BlocBuilder<SelectCategoryBloc,
                                SelectCategoryState>(
                            builder: (context, stateCategory) {
                          return ListView.builder(
                              scrollDirection: Axis.horizontal,
                              shrinkWrap: true,
                              itemCount: state.menuHttpModel!.menu!.length,
                              itemBuilder: (context, index) {
                                if (state.menuHttpModel!.menu![index]!.items!
                                    .isEmpty) return Column();
                                return Container(
                                  margin: const EdgeInsets.only(left: 7),
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor:
                                          (index == stateCategory.selectedIndex)
                                              ? Colors.blue
                                              : null,
                                      minimumSize:
                                          Size(height * 0.12, width * 0.1),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(
                                            12), // <-- Radius
                                      ),
                                      elevation: 10,
                                    ),
                                    onPressed: () {
                                      lock = true;
                                      BlocProvider.of<SelectCategoryBloc>(
                                              context)
                                          .add(SelectCategoryIndexEvent(
                                              selectedIndex: index));
                                      Scrollable.ensureVisible(
                                          globalKeys[index].currentContext!);
                                    },
                                    child: Text(
                                        state.menuHttpModel!.menu![index]
                                            .category_name
                                            .toString(),
                                        style: const TextStyle(
                                            // fontFamily: 'Moniqa',
                                            fontWeight: FontWeight.normal,
                                            fontSize: 13,
                                            color: Color.fromARGB(
                                                255, 245, 245, 245))),
                                  ),
                                );
                              });
                        });
                      } else {
                        return const Column();
                      }
                    },
                  ),
                ],
              ),
            ),
            SliverList(
              delegate: SliverChildListDelegate(
                [
                  BlocBuilder<MenuBloc, MenuState>(
                    builder: (context, state) {
                      return (state.menuStatus == MenuStatus.done)
                          ? generateItems(state)
                          : const Center(child: CircularProgressIndicator());
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
