import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:home_services/screens/splash_screen.dart';
import 'package:home_services/utils/colors.dart';
import 'package:home_services/utils/constant.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';



import 'store/appData.dart';

AppData appData = AppData();

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (context) {
        return MaterialApp(
          scrollBehavior: MyScrollBehavior(),
          debugShowCheckedModeBanner: false,
          title: appName,
          theme: ThemeData.light().copyWith(
            colorScheme: ColorScheme(
              brightness: Brightness.light,
              primary: primaryColor,
              onPrimary: whiteColor,
              secondary: secondaryColor,
              onSecondary: secondaryColor,
              error: redColor,
              onError: redColor,
              background: whiteColor,
              onBackground: whiteColor,
              surface: whiteColor,
              onSurface: blackColor,
            ),
            primaryColor: primaryColor,
            secondaryHeaderColor: whiteColor,
            iconTheme: IconThemeData(color: primaryColor),
            tabBarTheme: TabBarTheme(labelColor: Colors.black),
            listTileTheme: ListTileThemeData(iconColor: blackColor),
            brightness: Brightness.light,
            dividerColor: transparent,
            appBarTheme: AppBarTheme(
              iconTheme: IconThemeData(color: primaryColor),
              titleTextStyle: TextStyle(color: primaryColor),
              systemOverlayStyle: SystemUiOverlayStyle(statusBarIconBrightness: Brightness.dark),
            ),
            bottomNavigationBarTheme: BottomNavigationBarThemeData(
              backgroundColor: whiteColor,
              selectedItemColor: bottomSelectedColor,
              unselectedItemColor: bottomUnselectedColor,
            ),
          ),
          darkTheme: ThemeData.dark().copyWith(
            colorScheme: ColorScheme(
              brightness: Brightness.light,
              primary: Colors.black,
              onPrimary: Colors.white,
              secondary: secondaryColor,
              onSecondary: secondaryColor,
              error: redColor,
              onError: redColor,
              background: whiteColor,
              onBackground: whiteColor,
              surface: greyColor,
              onSurface: blackColor,
            ),
            primaryColor: whiteColor,
            secondaryHeaderColor: primaryColor,
            iconTheme: IconThemeData(color: whiteColor),
            brightness: Brightness.dark,
            tabBarTheme: TabBarTheme(labelColor: Colors.white),
            listTileTheme: ListTileThemeData(iconColor: whiteColor),
            dividerColor: transparent,
            dialogTheme: DialogTheme(
              backgroundColor: Colors.grey,
              titleTextStyle: TextStyle(
                color: blackColor,
                fontWeight: FontWeight.w500,
                fontSize: 18,
              ),
              contentTextStyle: TextStyle(color: Colors.black),
            ),
            expansionTileTheme: ExpansionTileThemeData(iconColor: whiteColor, textColor: whiteColor),
            bottomNavigationBarTheme: BottomNavigationBarThemeData(
              backgroundColor: Colors.black,
              selectedItemColor: Colors.white,
              unselectedItemColor: Colors.grey.shade500,
            ),
            appBarTheme: AppBarTheme(
              iconTheme: IconThemeData(color: whiteColor),
              titleTextStyle: TextStyle(color: whiteColor),
              systemOverlayStyle: SystemUiOverlayStyle(statusBarIconBrightness: Brightness.light),
            ),
          ),
          themeMode: appData.mode,
          home: SplashScreen(),
        );
      },
    );
  }
}

class MyScrollBehavior extends MaterialScrollBehavior {
  @override
  Set<PointerDeviceKind> get dragDevices => {
    PointerDeviceKind.mouse,
    PointerDeviceKind.touch,
    PointerDeviceKind.stylus,
    PointerDeviceKind.trackpad,
  };
}
