import 'package:booking_ninjas/view/verification_successful.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForgotPassword extends StatefulWidget {

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {

  final _formKey = GlobalKey<FormState>();

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
      body: Form(
        key: _formKey,
        child: Container(
          padding: EdgeInsets.all(32),
          child: Column(
            children: [
              Align(
                alignment: Alignment.center,
                child: Text('Forgot password',
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 32),
                ),
              ),
              SizedBox(
                height: 16,
              ),
              TextFormField(
                  decoration: InputDecoration(
                    labelText: "Enter your Email",
                    //fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: BorderSide(
                        color: Colors.white10,
                      ),
                    ),
                  )
              ),
              SizedBox(
                height: 16,
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      padding: EdgeInsets.all(16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                    onPressed: () => Get.to(VerificationSuccessful()),
                    child: Text('Reset my Password')
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}