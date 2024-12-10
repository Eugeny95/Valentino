import 'package:app_version_update/app_version_update.dart';
import 'package:auth_feature/auth_feature.dart';
import 'package:auth_feature/data/auth_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:valentino/PushNotificationService/cloud_message_controller.dart';
import 'package:valentino/buisiness/all_sale_bloc/all_sales_bloc.dart';
import 'package:valentino/buisiness/auth_bloc/auth_bloc.dart';
import 'package:valentino/buisiness/available_sale_bloc/available_sales_bloc.dart';
import 'package:valentino/buisiness/basket_bloc/basket_bloc_bloc.dart';
import 'package:valentino/buisiness/history_bloc/history_bloc.dart';
import 'package:valentino/buisiness/information_message_bloc/infomation_message_bloc.dart';
import 'package:valentino/buisiness/menu_page_bloc/menu_bloc/menu_bloc.dart';
import 'package:valentino/buisiness/menu_page_bloc/select_category_bloc/bloc/select_category_bloc.dart';
import 'package:valentino/generated/l10n.dart';
import 'package:valentino/ui/all_sales_page/all_sales_screen.dart';
import 'package:valentino/ui/menu_page/menu_screen.dart';
import 'package:valentino/ui/profile_page/profile_page.dart';
import 'package:valentino/ui/profile_page/components/store_page/store_page.dart';
import 'package:valentino/ui/theme.dart';

import 'package:badges/badges.dart' as badges;

import 'ui/basket_page/basket_page.dart';

void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  //notifications
  await CloudMessage.startCloudMessageService();
  await CloudMessage.getDeviceToken();

  String? token = await CloudMessage.getDeviceToken();
  print('This is Token: ' '${token}');
  //notifications
  runApp(MyApp());
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    FlutterNativeSplash.remove();
    return MaterialApp(
      localizationsDelegates: [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [Locale('ru')],
      title: 'Valentino',
      debugShowCheckedModeBanner: false,
      theme: lightThemeData(context),
      darkTheme: darkThemeData(context),
      themeMode: ThemeMode.dark,
      initialRoute: '/',
      routes: {
        // When navigating to the "/" route, build the FirstScreen widget.
        '/main': (context) => MainScreen(),
        //'/call_screen': (context) => CallPage(),
        // When navigating to the "/second" route, build the SecondScreen widget.
      },
      home: MultiBlocProvider(
        providers: [
          BlocProvider(
              lazy: false,
              create: (context) {
                HistoryBloc historyBloc = HistoryBloc();
                historyBloc.init();
                historyBloc.add(GetHistoryOrders());
                return historyBloc;
              }),
          BlocProvider(create: (context) {
            MenuBloc menuBloc = MenuBloc();
            menuBloc.add(GetMenuEvent());
            return menuBloc;
          }),
          BlocProvider(create: (context) {
            InformationMessageBloc informationMessageBloc =
                InformationMessageBloc();
            informationMessageBloc.add(GetInformationMessageEvent());
            return informationMessageBloc;
          }),
          BlocProvider(create: (context) {
            BasketBloc basketBloc = BasketBloc();

            return basketBloc;
          }),
          BlocProvider(create: (context) {
            return SelectCategoryBloc();
          }),
          BlocProvider(
              lazy: false,
              create: (context) {
                AuthBloc authBloc = AuthBloc();
                authBloc.init();
                authBloc.add(GetUserEvent());
                return authBloc;
              }),
          BlocProvider(create: (context) {
            AllSalesBloc allSalesBloc = AllSalesBloc();

            return allSalesBloc;
          }),
          BlocProvider(create: (context) {
            AvailableSalesBloc availableSalesBloc = AvailableSalesBloc();

            return availableSalesBloc;
          }),
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
    AllSalesPage(),
    ProfilePage(),
  ];
  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    _verifyVersion();
  }

  void _verifyVersion() async {
    await AppVersionUpdate.checkForUpdates(
            appleId: '6495065080',
            playStoreId: 'com.yappa.valentino',
            country: 'ru')
        .then((result) async {
      if (result.canUpdate!) {
        // await AppVersionUpdate.showBottomSheetUpdate(context: context, appVersionResult: appVersionResult)
        // await AppVersionUpdate.showPageUpdate(context: context, appVersionResult: appVersionResult)
        // or use your own widget with information received from AppVersionResult

        //##############################################################################################
        await AppVersionUpdate.showAlertUpdate(
          appVersionResult: result,
          context: context,
          backgroundColor: Colors.grey[200],
          title: 'Версия вашего приложения устарела',
          titleTextStyle: const TextStyle(
              color: Colors.black, fontWeight: FontWeight.w600, fontSize: 22.0),
          content: 'Пожалуйста обновите приложение, для корректной работы',
          contentTextStyle: const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w400,
          ),
          updateButtonText: ' Обновить ',
          cancelButtonText: ' Отмена ',
        );

        //## AppVersionUpdate.showBottomSheetUpdate ##
        // await AppVersionUpdate.showBottomSheetUpdate(
        //   context: context,
        //   mandatory: true,
        //   appVersionResult: result,
        // );

        //## AppVersionUpdate.showPageUpdate ##

        // await AppVersionUpdate.showPageUpdate(
        //   context: context,
        //   appVersionResult: result,
        // );
      }
    });
    // TODO: implement initState
  }

  BottomNavigationBar buildBottomNavigationBar() {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      elevation: 0,
      backgroundColor: Colors.transparent,
      currentIndex: _selectedIndex,
      onTap: (value) {
        BlocProvider.of<HistoryBloc>(context).add(GetHistoryOrders());

        print('selected index');
        setState(() {
          _selectedIndex = value;

          if (_selectedIndex == 1) {
            BlocProvider.of<BasketBloc>(context).add(GetBasketPositions());
            UserData user = BlocProvider.of<AuthBloc>(context).getUser();
            BlocProvider.of<AvailableSalesBloc>(context)
                .add(GetAvailableSalesEvent(accessToken: user.accessToken));
          }
          if (_selectedIndex == 2) {
            UserData user = BlocProvider.of<AuthBloc>(context).getUser();
            BlocProvider.of<AllSalesBloc>(context)
                .add(GetAllSalesEvent(accessToken: user.accessToken));
          }
          if (_selectedIndex == 3) {
            BlocProvider.of<AuthBloc>(context).add(GetUserEvent());
            BlocProvider.of<HistoryBloc>(context).add(GetHistoryOrders());
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
        BottomNavigationBarItem(
            icon: Icon(Icons.percent_rounded), label: "Акции"),
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
