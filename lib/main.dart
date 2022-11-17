import 'package:booking_ninjas/route/routes.dart';
import 'package:booking_ninjas/theme/colors_texts_widget.dart';
import 'package:booking_ninjas/view/dashboard.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          primarySwatch: Colors.blue,
          /*textTheme: GoogleFonts.notoSansTextTheme(
          Theme.of(context).textTheme
        )*/
          fontFamily: 'SF Pro Text',
          dividerColor: Colors.transparent,
          bottomNavigationBarTheme: const BottomNavigationBarThemeData(
            showUnselectedLabels: true,
              unselectedItemColor: PalletColors.text_soft_grey,
              selectedItemColor: PalletColors.text_blue)),
      //initialRoute: '/tasks',
      getPages: Routes.routes,
      home: Dashboard(),
    );
  }
}
