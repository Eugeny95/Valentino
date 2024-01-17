import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:valentino/buisiness/basket_bloc/basket_bloc_bloc.dart';
import 'package:valentino/buisiness/menu_page_bloc/menu_bloc/menu_bloc.dart';
import 'package:valentino/buisiness/menu_page_bloc/select_category_bloc/bloc/select_category_bloc.dart';
import 'package:valentino/ui/menu_page/menu_screen.dart';
import 'package:valentino/ui/profile_page/profile_page.dart';
import 'package:valentino/ui/store_page/store_page.dart';
import 'package:valentino/ui/theme.dart';
import 'package:badges/badges.dart' as badges;

import 'ui/basket_page/basket_page.dart';

void main() {
  runApp(MyApp());
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Valentino',
      debugShowCheckedModeBanner: false,
      theme: lightThemeData(context),
      darkTheme: darkThemeData(context),
      themeMode: ThemeMode.dark,
      home: MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) {
            MenuBloc menuBloc = MenuBloc();
            menuBloc.add(GetMenuEvent());
            return menuBloc;
          }),
          BlocProvider(create: (context) {
            BasketBloc basketBloc = BasketBloc();
            basketBloc.add(EmptyBasketEvent());
            return basketBloc;
          }),
          BlocProvider(create: (context) {
            return SelectCategoryBloc();
          })
        ],
        child: MainScreen(),
      ),
    );
  }
}

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  List<Widget> screens = [
    MenuPage(),
    BasketPage(),
    StorePage(),
    ProfilePage(),
  ];
  int _selectedIndex = 0;

  BottomNavigationBar buildBottomNavigationBar() {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      elevation: 0,
      backgroundColor: Colors.transparent,
      currentIndex: _selectedIndex,
      onTap: (value) {
        setState(() {
          _selectedIndex = value;
          if (_selectedIndex == 1) {
            BlocProvider.of<BasketBloc>(context).add(GetBasketPositions());
          }
        });
      },
      items: [
        BottomNavigationBarItem(
            icon: Icon(Icons.restaurant_menu_outlined), label: "Меню"),
        BottomNavigationBarItem(
            icon: BlocBuilder<BasketBloc, BasketState>(
              builder: (context, state) {
                if (state.basketStatus == BasketStatus.done &&
                    state.positions!.isNotEmpty)
                  return badges.Badge(
                      badgeContent: Text(
                        state.positions!.length.toString(),
                        style: TextStyle(fontSize: 8),
                      ),
                      child: Icon(Icons.shopping_basket_outlined));
                else
                  return Icon(Icons.shopping_basket_outlined);
              },
            ),
            label: "Корзина"),
        BottomNavigationBarItem(icon: Icon(Icons.history), label: "История"),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: "Профиль"),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(child: screens[_selectedIndex]),
        bottomNavigationBar: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(30),
                topLeft: Radius.circular(30),
              ),
              boxShadow: [
                BoxShadow(
                    color: Colors.white24, spreadRadius: 0, blurRadius: 10),
              ],
            ),
            child: Material(
                elevation: 0.0,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                  topRight: Radius.circular(30),
                  topLeft: Radius.circular(30),
                )),
                child: buildBottomNavigationBar())));
  }
}
