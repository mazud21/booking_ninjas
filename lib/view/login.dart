import 'package:booking_ninjas/theme/colors_texts_widget.dart';
import 'package:booking_ninjas/view/forgot_password.dart';
import 'package:booking_ninjas/view/password_reset.dart';
import 'package:booking_ninjas/view/signup.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Login extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color.fromRGBO(255, 255, 255, 0.0),
        leading: InkWell(
            onTap: () => Get.back(),
            child: const Icon(Icons.arrow_back_ios, color: Colors.black45,)),
      ),
      body: FormLogin(),
    );
  }
}

class FormLogin extends StatefulWidget {

  @override
  State<FormLogin> createState() => _FormLoginState();
}

class _FormLoginState extends State<FormLogin> {

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const Spacer(),
            Align(
              alignment: Alignment.center,
              child: Text('Welcome back!', style: TextCustom().textLargeHeading()),
              ),
            const SizedBox(
              height: 24,
            ),
            TextFormField(
                decoration: InputDecoration(
                  labelText: "Email Address",
                  border: BorderCustom().outlineForm(),
                )
            ),
            const SizedBox(
              height: 12,
            ),
            TextFormField(
                decoration: InputDecoration(
                  labelText: "Password",
                  border: BorderCustom().outlineForm(),
                )
            ),
            const SizedBox(
              height: 24,
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                  style: ButtonCustom().elevatedGreen(),
                  onPressed: () => Get.to(Login()),
                  child: Text('Login', style: TextCustom().textButton(PalletColors.text_white),)
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Forgot Password?', style: TextCustom().textFormCaption(PalletColors.text_black),),
                TextButton(
                    onPressed: () => Get.to(ForgotPassword()),
                    child: Text('Reset Password', style: TextCustom().textFormCaption(PalletColors.text_blue),)
                )
              ],
            ),
            const Spacer(),
            Align(
              alignment: Alignment.center,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Not Registered', style: TextCustom().textFormCaption(PalletColors.text_black)),
                  TextButton(
                      onPressed: () => Get.to(SignUp()),
                      child: Text('Create Account', style: TextCustom().textFormCaption(PalletColors.text_blue))
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
