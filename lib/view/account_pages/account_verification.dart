import 'package:booking_ninjas/theme/colors_texts_widget.dart';
import 'package:booking_ninjas/view/account_pages/verification_successful.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AccountVerification extends StatelessWidget {

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
      body: Center(child: FormAccountVerification()),
    );
  }
}

class FormAccountVerification extends StatefulWidget {
  const FormAccountVerification({Key? key}) : super(key: key);

  @override
  State<FormAccountVerification> createState() => _FormAccountVerificationState();
}

class _FormAccountVerificationState extends State<FormAccountVerification> {

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Container(
        padding: const EdgeInsets.fromLTRB(32, 32, 32, 0),
        child: ListView(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Text('Account Verification',
                style: TextCustom().textLargeHeading()),
              ),
            const SizedBox(
              height: 24,
            ),
            Text('We’ll need to verify your account and email. Verification code was sent to your email john.doe@company.com', 
              style: TextCustom().textFootnote(PalletColors.text_black)),
            const SizedBox(
              height: 24,
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
                  onPressed: () => Get.to(VerificationSuccessful()),
                  child: Text('Verify Account', style: TextCustom().textButton(PalletColors.text_white),)
              ),
            ),
          ],
        ),
      ),
    );
  }
}
