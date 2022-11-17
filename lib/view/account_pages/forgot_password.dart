import 'package:booking_ninjas/view/account_pages/password_reset.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../theme/colors_texts_widget.dart';

class ForgotPassword extends StatelessWidget {

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
      body: FormForgotPassword(),
    );
  }
}

class FormForgotPassword extends StatefulWidget {

  @override
  State<FormForgotPassword> createState() => _FormForgotPasswordState();
}

class _FormForgotPasswordState extends State<FormForgotPassword> {

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
              child: Text('Forgot password',
                style: TextCustom().textLargeHeading(),
              ),
            ),
            const SizedBox(
              height: 24,
            ),
            TextFormField(
                decoration: InputDecoration(
                  labelText: "Enter your Email",
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
                  onPressed: () => Get.to(PasswordReset()),
                  child: Text('Reset my Password', style: TextCustom().textButton(PalletColors.text_white),)
              ),
            ),
          ],
        ),
      ),
    );
  }
}
