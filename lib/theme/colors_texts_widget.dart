import 'dart:ui';

import 'package:flutter/material.dart';

class PalletColors {
  ///LayoutColor
  static const layout_soft_orange = const Color(0xFDB04829);

  ///ButtonColor
  static const btn_white = const Color.fromRGBO(255, 255, 255, 1.0);
  static const btn_red = const Color(0xFFBC2929);
  static const btn_soft_red = const Color.fromRGBO(255,186,186, 1);
  static const btn_green = const Color(0xFF089716);
  static const btn_deep_blue = const Color(0xFF1A74C3);
  static const btn_orange = const Color.fromRGBO(255, 255, 255, 1.0);
  static const btn_soft_grey = const Color(0xFFF2F2F7);

  ///ChipColor
  static const chip_orange = const Color(0xFFF8BC76);
  static const chip_green = const Color(0xFF57C068);
  static const chip_red = const Color(0xFFEB8888);
  static const chip_soft_blue = const Color(0x72BCF826);

  ///TextColor
  static const text_white = const Color.fromRGBO(255, 255, 255, 1.0);
  static const text_soft_grey = const Color.fromRGBO(60, 60, 67, 0.6);
  static const text_blue = const Color(0xFF72BCF8);
  static const text_red = const Color(0xFFbc2929);
}

class TextCustom {
  late TextStyle ts;

  headline1() {
    ts = const TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold);
    return ts;
  }

  headline2() {
    ts = const TextStyle(
        fontWeight: FontWeight.w700, fontSize: 20, color: Colors.black);
    return ts;
  }

  headline3(Color c) {
    ts = TextStyle(color: c, fontSize: 14);
    return ts;
  }

  headline4() {
    ts = const TextStyle(
        fontWeight: FontWeight.w600, fontSize: 16, color: Colors.black);
    return ts;
  }

  headline5() {
    ts = const TextStyle(fontSize: 16, color: Colors.black);
    return ts;
  }

  headline6() {
    ts = const TextStyle(fontSize: 16, color: Colors.black);
    return ts;
  }

  caption() {
    ts = const TextStyle(color: Colors.black, fontSize: 14);
    return ts;
  }

  subtitle2() {
    ts = const TextStyle(color: Colors.black, fontSize: 14);
    return ts;
  }

  bodyText2() {
    ts = const TextStyle(color: Colors.black, fontSize: 14);
    return ts;
  }

  bodyText3() {
    ts = const TextStyle(fontSize: 18, color: Colors.black);
    return ts;
  }
}

class ButtonCustom{

  late final ButtonStyle style;

  elevatedGreen(){

    style = ElevatedButton.styleFrom(
      elevation: 0,
      backgroundColor: PalletColors.btn_green,
      padding: EdgeInsets.all(16),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
    );

    return style;
  }

  elevatedRed(){

    style = ElevatedButton.styleFrom(
      elevation: 0,
      backgroundColor: PalletColors.btn_red,
      padding: EdgeInsets.all(16),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
    );

    return style;
  }

  elevatedRedSoft(){

    style = ElevatedButton.styleFrom(
      elevation: 0,
      backgroundColor: PalletColors.btn_soft_red,
      padding: EdgeInsets.all(16),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
    );

    return style;
  }

  elevatedGrey(){

    style = ElevatedButton.styleFrom(
      elevation: 0,
      backgroundColor: PalletColors.btn_soft_grey,
      padding: EdgeInsets.all(16),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
    );

    return style;
  }

}
