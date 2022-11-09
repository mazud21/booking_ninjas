import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VerificationSuccessful extends StatefulWidget {
  const VerificationSuccessful({Key? key}) : super(key: key);

  @override
  State<VerificationSuccessful> createState() => _VerificationSuccessfulState();
}

class _VerificationSuccessfulState extends State<VerificationSuccessful> {
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
      body: Container(
        padding: EdgeInsets.all(32),
        child: Column(
          children: [
            Spacer(),
            Align(
              alignment: Alignment.center,
              child: Text('Verification successful',
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 26),
              ),
            ),
            SizedBox(
              height: 16,
            ),
            Text('We’ve succesfully verified your email and an account with us has been created for you.'),
            Spacer(),
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
                  onPressed: () => Get.to('/'),
                  child: Text('Let\'s start!')
              ),
            ),
            Spacer(),
          ],
        ),
      ),
    );
  }
}