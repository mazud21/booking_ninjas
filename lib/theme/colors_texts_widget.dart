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
  static const btn_soft_green = const Color(0x8876EE82);
  static const btn_deep_blue = const Color(0xFF1A74C3);
  static const btn_orange = const Color.fromRGBO(255, 255, 255, 1.0);
  static const btn_soft_grey = const Color(0xFFF2F2F7);

  ///ChipColor
  static const chip_orange = const Color(0xFFF8BC76);
  static const chip_green = const Color(0xFF57C068);
  static const chip_red = const Color(0xFFEB8888);
  static const chip_soft_blue = const Color(0x72BCF826);

  ///TextColor
  static const text_black = const Color.fromRGBO(41, 44, 56, 1);
  static const text_white = const Color.fromRGBO(255, 255, 255, 1.0);
  static const text_soft_grey = const Color.fromRGBO(60, 60, 67, 0.6);
  static const text_blue = const Color(0xFF2196F3);
  static const text_red = const Color(0xFFbc2929);
  static const text_green = const Color(0xff089716);
}

class TextCustom {
  late TextStyle ts;

  textLargeHeading() {
    ts = const TextStyle(fontSize: 28, color: PalletColors.text_black, fontWeight: FontWeight.bold);
    return ts;
  }

  textButton(Color c) {
    ts = TextStyle(fontSize: 17, color: c, fontWeight: FontWeight.w600);
    return ts;
  }

  textFormCaption(Color c) {
    ts = TextStyle(fontSize: 12, color: c);
    return ts;
  }

  textFootnote(Color c) {
    ts = TextStyle(fontSize: 13, color: c);
    return ts;
  }

  textText(Color c) {
    ts = TextStyle(fontSize: 17, color: c,);
    return ts;
  }

  textTextBold(Color c) {
    ts = TextStyle(fontSize: 17, color: c, fontWeight: FontWeight.bold);
    return ts;
  }

  heading1() {
    ts = const TextStyle(fontSize: 18, color: PalletColors.text_black, fontWeight: FontWeight.bold);
    return ts;
  }

  heading1Blue() {
    ts = const TextStyle(fontSize: 20, color: PalletColors.text_blue, fontWeight: FontWeight.bold);
    return ts;
  }

  heading2() {
    ts = const TextStyle(fontSize: 17, color: PalletColors.text_black, fontWeight: FontWeight.w600);
    return ts;
  }

  heading2Color(Color c) {
    ts = TextStyle(fontSize: 17, color: c, fontWeight: FontWeight.w600);
    return ts;
  }

  title1() {
    ts = const TextStyle(fontSize: 20, color: PalletColors.text_black,);
    return ts;
  }

  title2() {
    ts = const TextStyle(fontSize: 22, color: PalletColors.text_black,);
    return ts;
  }

  textDescription() {
    ts = const TextStyle(fontSize: 15, color: PalletColors.text_black,);
    return ts;
  }

  textMenu() {
    ts = const TextStyle(fontSize: 11.5, color: PalletColors.text_black, fontWeight: FontWeight.w500);
    return ts;
  }

  textMenuGrey() {
    ts = const TextStyle(fontSize: 11.5, color: PalletColors.text_soft_grey, fontWeight: FontWeight.w500);
    return ts;
  }

}

class ButtonCustom{

  late final ButtonStyle style;

  elevatedGreen(){

    style = ElevatedButton.styleFrom(
      elevation: 0,
      backgroundColor: PalletColors.btn_green,
      padding: const EdgeInsets.all(16),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
    );

    return style;
  }

  elevatedSoftGreen(){

    style = ElevatedButton.styleFrom(
      elevation: 0,
      backgroundColor: PalletColors.btn_soft_green,
      padding: const EdgeInsets.all(16),
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

class BorderCustom{
  late OutlineInputBorder ol;

  outlineForm() {
    ol = OutlineInputBorder(
      borderRadius: BorderRadius.circular(16),
      borderSide: const BorderSide(
        color: PalletColors.btn_soft_grey,
      ),
    );

    return ol;
  }

}
