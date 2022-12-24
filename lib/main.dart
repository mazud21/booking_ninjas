import 'dart:developer';

import 'package:booking_ninjas/network/fetch_data.dart';
import 'package:booking_ninjas/route/routes.dart';
import 'package:booking_ninjas/theme/colors_texts_widget.dart';
import 'package:booking_ninjas/view/dashboard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';


main() async {

  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs =await SharedPreferences.getInstance();
  var userId=prefs.getString("userId");
  log('CHECK_USERID: $userId');

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(
              create: (_) => FetchData(),
          ),
        ],
      child: GetMaterialApp(
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
        home: const Dashboard(),
        builder: EasyLoading.init(),
      ),
    );
  }
}
