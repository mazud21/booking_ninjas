import 'package:booking_ninjas/view/login.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../theme/colors_texts_widget.dart';

class PasswordUpdateSuccessful extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color.fromRGBO(255, 255, 255, 0.0),
        leading: InkWell(
            onTap: () => Get.back(),
            child: Icon(Icons.arrow_back_ios, color: Colors.black45,)),
      ),
      body: Container(
        padding: const EdgeInsets.all(32),
        child: Column(
          children: [
            Align(
              alignment: Alignment.center,
              child: Text('Password update successful',
                style: TextCustom().textLargeHeading(),
              ),
            ),
            const SizedBox(
              height: 24,
            ),
            Text('We’ve succesfully verified your email and an account with us has been created for you.',
            style: TextCustom().textFootnote(PalletColors.text_black)),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    padding: const EdgeInsets.all(16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                  onPressed: () => Get.to(Login()),
                  child: Text('Let\'s start!', style: TextCustom().textButton(PalletColors.text_white))
              ),
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}