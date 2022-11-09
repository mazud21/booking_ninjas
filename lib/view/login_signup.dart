import 'package:booking_ninjas/view/login.dart';
import 'package:booking_ninjas/view/signup.dart';
import 'package:flutter/cupertino.dart';
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
        padding: EdgeInsets.all(16),
        child: ListView(
          children: [
            Image.asset('assets/images/hgi_logo_color_hr1.png'),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                padding: EdgeInsets.all(16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
              ),
                onPressed: () => Get.to(Login()),
                child: Text('Login')
            ),
            SizedBox(
              height: 16,
            ),
            const Center(
              child: Text('or continue with'),
            ),
            SizedBox(
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
            SizedBox(
              height: 32,
            ),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromRGBO(8, 151, 22, 0.15),
                  padding: EdgeInsets.all(16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                ),
                onPressed: () => Get.to(SignUp()),
                child: const Text('Create account', style: TextStyle(color: Color.fromRGBO(8, 151, 22, 1)
                ),)
            ),
          ],
        ),
      ),
    );
  }

}
