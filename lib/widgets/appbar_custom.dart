import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../theme/colors_texts_widget.dart';

class AppBarCustom {

  Widget myAppBarIcon() {
    return Container(
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
    );
  }

  getAppBarCustom(int selectedIndex) {



    return AppBar(
      centerTitle: true,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text(
            'Tasks $selectedIndex',
            style: TextCustom().heading1(),
          )
        ],
      ),
      elevation: 0,
      backgroundColor: Colors.transparent,
      actions: [
        Padding(padding: const EdgeInsets.all(16), child: myAppBarIcon())
      ],
    );
  }

  getSubAppBarCustom() {
    return;
  }
}