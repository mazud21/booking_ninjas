import 'dart:async';
import 'package:booking_ninjas/view/account_pages/login.dart';
import 'package:booking_ninjas/view/dashboard.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  late String username, password, email, version = '';
  bool isLoggedIn = false;
  final splashDelay = 3;

  @override
  void initState() {
    super.initState();
    _loadWidget();

  }

  checkLogIn() async {
    SharedPreferences prefs =await SharedPreferences.getInstance();
    var session_id =prefs.getString("session_id");

    debugPrint("TEST_USERID: $session_id");

    if (session_id ==''|| session_id == null ||session_id.isEmpty) {
      Get.off(Login());
    } else {
      Get.off(Dashboard());
    }
  }

  getVersion() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();

    version = packageInfo.version;

  }

  _loadWidget() async {
    var _duration = Duration(seconds: splashDelay);
    //return Timer(_duration, navigationPage);
    return Timer(_duration,(){
      getVersion();
      checkLogIn();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: InkWell(
        child: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Expanded(
                  flex: 7,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Image.asset(
                        'assets/images/company_logo.png',
                        height: 300,
                        width: 300,
                      ),
                      const Padding(
                        padding: EdgeInsets.only(top: 10.0),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    children: <Widget>[
                      const CupertinoActivityIndicator(
                        radius: 20,
                        animating: true,
                      ),
                      Container(
                        height: 10,
                      ),
                      Center(
                        child: Text("Versi $version", style: TextStyle(fontWeight: FontWeight.w600),),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}