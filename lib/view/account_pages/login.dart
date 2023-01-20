import 'dart:developer';

import 'package:booking_ninjas/network/endpoint.dart';
import 'package:booking_ninjas/theme/colors_texts_widget.dart';
import 'package:booking_ninjas/view/account_pages/forgot_password.dart';
import 'package:booking_ninjas/view/account_pages/signup.dart';
import 'package:booking_ninjas/view/dashboard.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:form_validator/form_validator.dart';
import 'package:get/get.dart' hide Response;
import 'package:shared_preferences/shared_preferences.dart';

class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color.fromRGBO(255, 255, 255, 0.0),
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

  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  bool _obscureText = true;

  late Response response;
  var dio = Dio();

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
              child:
              Text('Welcome back!', style: TextCustom().textLargeHeading()),
            ),
            const SizedBox(
              height: 24,
            ),
            TextFormField(
              controller: email,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                labelText: "Email Address",
                border: BorderCustom().outlineForm(),
              ),
              validator: ValidationBuilder().email().build(),
            ),
            const SizedBox(
              height: 12,
            ),
            TextFormField(
                controller: password,
                keyboardType: TextInputType.visiblePassword,
                obscureText: _obscureText,
                validator: ValidationBuilder().required().build(),
                decoration: InputDecoration(
                  labelText: "Password",
                  suffixIcon: InkWell(
                    onTap: _toggle,
                    child: Icon(
                      _obscureText
                          ? CupertinoIcons.eye_slash
                          : CupertinoIcons.eye,
                      color: PalletColors.btn_green,
                    ),
                  ),
                  border: BorderCustom().outlineForm(),
                )),
            const SizedBox(
              height: 24,
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                  style: ButtonCustom().elevatedGreen(),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      //EasyLoading.show(status: 'loading...');
                      getLogin(email.text, password.text);
                    } else {

                    }
                  },
                  child: Text(
                    'Login',
                    style: TextCustom().textButton(PalletColors.text_white),
                  )),
            ),
            const SizedBox(
              height: 12,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Forgot Password?',
                  style: TextCustom().textFormCaption(PalletColors.text_black),
                ),
                TextButton(
                    onPressed: () => Get.to(ForgotPassword()),
                    child: Text(
                      'Reset Password',
                      style:
                      TextCustom().textFormCaption(PalletColors.text_blue),
                    ))
              ],
            ),
            const Spacer(),
            Align(
              alignment: Alignment.center,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Not Registered',
                      style: TextCustom()
                          .textFormCaption(PalletColors.text_black)),
                  TextButton(
                      onPressed: () => Get.to(SignUp()),
                      child: Text('Create Account',
                          style: TextCustom()
                              .textFormCaption(PalletColors.text_blue)))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  getLogin(String email, String password) async {
    response = await dio.get(Endpoint.LOGIN_URL, queryParameters: {
      'username':  /*'test-wjjmdlr20nya@example.com'*/  email,
      'password':  /*'fuznjIgv4ye^g'*/  password,
      'is_test': 'true'
    });
    log('CHECK_LOGIN: $email $password ${response.data.toString()} ${Endpoint.LOGIN_URL}');

    var sessionId = response.data['session_id'].toString();
    var orgUrl = response.data['org_url'].toString();
    var status = response.data['status'].toString();
    var contactId = response.data['contact_id'].toString();

    if (status == '1') {

      //setSession.createTest(sessionId);
      //setSession().getTest();

      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString("session_id", sessionId);
      prefs.setString("org_url", orgUrl);
      prefs.setString("status", status);
      prefs.setString("contact_id", contactId);

      EasyLoading.dismiss();

      Get.off(const Dashboard());

    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('The email or password you entered incorrect'),
          backgroundColor: PalletColors.btn_red,
        ),
      );
      EasyLoading.dismiss();
    }
  }
    //setSession.createTest(email);
    //setSession().getTest();

    //Get.off(const Dashboard());


  String? validateEmail(String? value) {
    String pattern =
        r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]"
        r"{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]"
        r"{0,253}[a-zA-Z0-9])?)*$";
    RegExp regex = RegExp(pattern);
    if (value == null || value.isEmpty || !regex.hasMatch(value)) {
      return 'Enter a valid email address';
    } else {
      return null;
    }
  }
}