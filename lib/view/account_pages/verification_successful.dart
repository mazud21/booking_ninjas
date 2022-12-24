import 'package:booking_ninjas/theme/colors_texts_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VerificationSuccessful extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color.fromRGBO(255, 255, 255, 0.0),
        leading: InkWell(
            onTap: () => Get.back(),
            child: const Icon(Icons.arrow_back_ios, color: Colors.black45,)),
      ),
      body: Container(
        padding: const EdgeInsets.all(32),
        child: Column(
          children: [
            const Spacer(),
            Align(
              alignment: Alignment.centerLeft,
              child: Text('Verification successful',
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
                  style: ButtonCustom().elevatedGreen(),
                  onPressed: () => Get.to('/'),
                  child: Text('Let\'s start!', style: TextCustom().textButton(PalletColors.text_white),)
              ),
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
  
}