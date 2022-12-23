import 'dart:developer';

import 'package:booking_ninjas/theme/colors_texts_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../view/notifications.dart';

class AppBarCustom {

  getAppBarCustom(int selectedIndex) {
    return AppBar(
      centerTitle: true,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text(setTitle(selectedIndex), style: TextCustom().heading1(),)
        ],
      ),
      elevation: 0,
      backgroundColor: Colors.transparent,
      actions: [
        Padding(padding: const EdgeInsets.all(16), child: MyAppBarIcon())
      ],
    );
  }

  setTitle(int index){
    late String title;

    if(index == 0){
      title = 'Tasks';
    } else if(index == 1){
      title = 'Notes';
    } else if(index == 2){
      title = 'History';
    } else {
      title = 'Profile';
    }

    log('TITLE: $title');

    return title;

  }

  getSubAppBarCustom(String title) {
    return CupertinoNavigationBar(
      backgroundColor: PalletColors.btn_soft_grey,
      middle: Text(title),
      border: Border.all(width: 0.5,color: PalletColors.text_soft_grey),
    );
  }

  getBSAppBarCustom(String title) {
    return AppBar(
      title: Text(title, style: TextCustom().textTextBold(PalletColors.text_black),),
      elevation: 1,
      leadingWidth: Get.width*0.3,
      leading: InkWell(
        onTap: () => Get.back(),
        child: Padding(
          padding: EdgeInsets.all(4),
          child: Row(
            children: const [
              SizedBox(
                width: 16,
              ),
              Icon(Icons.arrow_back_ios, color: Colors.blue,),
              Text('Back', style: TextStyle(color: Colors.blue),),
            ],
          ),
        ),
      ),
      actions: const [
        Padding(
            padding: EdgeInsets.all(20),
            child: Text('Save', style: TextStyle(color: Colors.blue)))
      ],
      backgroundColor: const Color.fromRGBO(249, 249, 249, 0.94),
    );
  }

  getCupertinoNavBar(String title){
    return CupertinoNavigationBar(
      backgroundColor: PalletColors.btn_soft_grey,
      middle: Text(title),
      border: Border.all(width: 0.5,color: PalletColors.text_soft_grey),
    );
  }
}

class MyAppBarIcon extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => bsNotifications(context),
      child: Container(
        width: 30,
        height: 30,
        child: Stack(
          children: [
            Icon(
              Icons.notifications,
              color: Colors.black,
              size: 30,
            ),
            Container(
              width: 30,
              height: 30,
              alignment: Alignment.topRight,
              margin: EdgeInsets.only(top: 5),
              child: Container(
                width: 15,
                height: 15,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color(0xffc32c37),
                    border: Border.all(color: Colors.white, width: 1)),
                child: Padding(
                  padding: const EdgeInsets.all(0.0),
                  child: Center(
                    child: Text(
                      /*_counter.toString()*/
                      '3',
                      style: TextStyle(fontSize: 10, color: Colors.white),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  bsNotifications(BuildContext context){
    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        builder: (context) {
          return FractionallySizedBox(
            heightFactor: 0.9,
            child: Notifications(),
          );
        });
  }
}
