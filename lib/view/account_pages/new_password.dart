import 'package:booking_ninjas/view/account_pages/password_update_successful.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../theme/colors_texts_widget.dart';

class NewPassword extends StatelessWidget {

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
      body: FormNewPassword(),
    );
  }
}

class FormNewPassword extends StatefulWidget {

  @override
  State<FormNewPassword> createState() => _FormNewPasswordState();
}

class _FormNewPasswordState extends State<FormNewPassword> {

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Text('Create new password',
                style: TextCustom().textLargeHeading(),
              ),
            ),
            const SizedBox(
              height: 24,
            ),
            TextFormField(
                decoration: InputDecoration(
                  labelText: "Old Password",
                  //fillColor: Colors.white,
                  border: BorderCustom().outlineForm(),
                )
            ),
            const SizedBox(
              height: 12,
            ),
            TextFormField(
                decoration: InputDecoration(
                  labelText: "New Password",
                  //fillColor: Colors.white,
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
                  onPressed: () => Get.to(PasswordUpdateSuccessful()),
                  child: Text('Update Password', style: TextCustom().textButton(PalletColors.text_white),)
              ),
            ),
          ],
        ),
      ),
    );
  }
}
