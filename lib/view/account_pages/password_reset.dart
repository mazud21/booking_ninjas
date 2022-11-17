import 'package:booking_ninjas/theme/colors_texts_widget.dart';
import 'package:booking_ninjas/view/account_pages/new_password.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'password_update_successful.dart';

class PasswordReset extends StatelessWidget {

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
      body: FormPasswordReset(),
    );
  }
}

class FormPasswordReset extends StatefulWidget {

  @override
  State<FormPasswordReset> createState() => _FormPasswordResetState();
}

class _FormPasswordResetState extends State<FormPasswordReset> {

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Container(
        padding: EdgeInsets.all(32),
        child: Column(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Text('Password reset',
                style: TextCustom().textLargeHeading(),
              ),
            ),
            const SizedBox(
              height: 24,
            ),
            Text('We’ll need to verify your account and email. A six digit verification code was sent to your john.doe@company.com ',
                style: TextCustom().textFootnote(PalletColors.text_black)),
            const SizedBox(
              height: 24,
            ),
            Align(
                alignment: Alignment.centerLeft,
                child: Text('Enter Verification Code', style: TextCustom().textFootnote(PalletColors.text_black),)),
            const SizedBox(
              height: 8,
            ),
            TextFormField(
                decoration: InputDecoration(
                  labelText: "Verification Code",
                  //fillColor: Colors.white,
                  border: BorderCustom().outlineForm(),
                )
            ),
            const SizedBox(
              height: 16,
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                  style: ButtonCustom().elevatedGreen(),
                  onPressed: () => Get.to(NewPassword()),
                  child: Text('Verify Account', style: TextCustom().textButton(PalletColors.text_white),)
              ),
            ),
          ],
        ),
      ),
    );
  }
}


