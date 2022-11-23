import 'dart:io';

import 'package:booking_ninjas/theme/colors_texts_widget.dart';
import 'package:booking_ninjas/widgets/appbar_custom.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class ReportProblem extends StatefulWidget {

  @override
  _ReportProblemState createState() => _ReportProblemState();
}

class _ReportProblemState extends State<ReportProblem> {

  final _formKey = GlobalKey<FormState>();
  late File _image;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarCustom().getBSAppBarCustom('Report a problem'),
      body: Container(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(bottom: 8),
              child: Row(
                children: [
                  Text('Category'),
                  Spacer(),
                  Row(
                    children: [
                      Text('Category'),
                      Icon(Icons.chevron_right)
                    ],
                  ),
                ],
              ),
            ),
            Divider(
              height: 1,
              color: Colors.grey,
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(0, 16, 0, 16),
              child: Align(
                alignment: Alignment.centerLeft,
                  child: Text('Describe a maintenance issue')
              ),
            ),
            Form(
              key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                        maxLines: 4,
                        decoration: InputDecoration(
                          hintText: "Describe here",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        )
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    SizedBox(
                      width: Get.width*0.55,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            elevation: 0,
                            backgroundColor: const Color.fromRGBO(
                                242, 242, 247, 1),
                            padding: EdgeInsets.all(16),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16),
                            ),
                          ),
                          onPressed: () => pickImage(),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: const [
                              Icon(Icons.camera_alt_rounded,color: Colors.black,),
                              Text('Add problem photo', style: TextStyle(color: Colors.black),)
                            ],
                          )
                      ),
                    ),
                  ]
                ),
            ),
            
          ],
        ),
      ),
    );
  }

  void pickImage() async {
    var image = await ImagePicker().pickImage(source: ImageSource.camera, imageQuality: 5);
    if (image == null) {
      return null;
    }
    setState(() {

      _image = File(image.path);
    });
  }

}