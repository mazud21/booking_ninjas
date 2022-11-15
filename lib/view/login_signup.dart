import 'package:booking_ninjas/theme/colors_texts_widget.dart';
import 'package:booking_ninjas/view/login.dart';
import 'package:booking_ninjas/view/signup.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginSignUp extends StatefulWidget {

  @override
  State<LoginSignUp> createState() => _LoginSignUpState();
}

class _LoginSignUpState extends State<LoginSignUp> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(top: Get.height*0.2),
        padding: const EdgeInsets.all(16),
        child: ListView(
          children: [
            Image.asset('assets/images/hgi_logo_color_hr1.png'),
            ElevatedButton(
              style: ButtonCustom().elevatedGreen(),
                onPressed: () => Get.to(Login()),
                child: Text('Login', style: TextCustom().textButton(PalletColors.text_white),)
            ),
            const SizedBox(
              height: 16,
            ),
            Center(
              child: Text('or continue with', style: TextCustom().textFootnote(PalletColors.text_soft_grey)),
            ),
            const SizedBox(
              height: 16,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Image.asset('assets/images/google.png', width: 50, height: 50,),
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Image.asset('assets/images/fb.png', width: 50, height: 50,),
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Image.asset('assets/images/twitter.png', width: 50, height: 50,),
                ),
              ],
            ),
            const SizedBox(
              height: 32,
            ),
            ElevatedButton(
                style: ButtonCustom().elevatedSoftGreen(),
                onPressed: () => Get.to(SignUp()),
                child: Text('Create account',  style: TextCustom().textButton(PalletColors.text_green),)
            ),
          ],
        ),
      ),
    );
  }

}
