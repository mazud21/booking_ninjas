import 'package:booking_ninjas/theme/colors_texts_widget.dart';
import 'package:booking_ninjas/view/account_pages/account_verification.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'login.dart';

class SignUp extends StatelessWidget {

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
      body: Center(child: FormSignUp()),
    );
  }
}

class FormSignUp extends StatefulWidget {

  @override
  State<FormSignUp> createState() => _FormSignUpState();
}

class _FormSignUpState extends State<FormSignUp> {

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Container(
        padding: const EdgeInsets.fromLTRB(32, 0, 32, 0),
        child: ListView(
          shrinkWrap: true,
          children: [
            const Spacer(),
            Align(
              alignment: Alignment.centerLeft,
              child: Text('Create an account', style: TextCustom().textLargeHeading()),
            ),
            const SizedBox(
              height: 24,
            ),
            TextFormField(
                decoration: InputDecoration(
                  labelText: "First Name",
                  border: BorderCustom().outlineForm(),
                )
            ),
            const SizedBox(
              height: 12,
            ),
            TextFormField(
                decoration: InputDecoration(
                  labelText: "Last Name",
                  border: BorderCustom().outlineForm(),
                )
            ),
            const SizedBox(
              height: 12,
            ),
            TextFormField(
                decoration: InputDecoration(
                  labelText: "Email Address",
                  border: BorderCustom().outlineForm(),
                )
            ),
            const SizedBox(
              height: 20,
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
                  onPressed: () => Get.to(AccountVerification()),
                  child: Text('Create Account', style: TextCustom().textButton(PalletColors.text_white),)
              ),
            ),
            const Spacer(),
            Align(
              alignment: Alignment.center,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Already Registered?', style: TextCustom().textFootnote(PalletColors.text_black),),
                  TextButton(
                      onPressed: () => Get.to(Login()),
                      child: Text('Log in', style: TextCustom().textFootnote(PalletColors.text_green),)
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
