import 'dart:io';

import 'package:booking_ninjas/theme/colors_texts_widget.dart';
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
      appBar: AppBar(
        title: Text('Report a problem'),
        elevation: 1,
        leadingWidth: Get.width*0.3,
        leading: InkWell(
          onTap: () => Get.back(),
          child: Padding(
            padding: EdgeInsets.all(4),
            child: Row(
              children: const [
                SizedBox(
                  width: 16,
                ),
                Icon(Icons.arrow_back_ios, color: Colors.blue,),
                Text('Back', style: TextStyle(color: Colors.blue),),
              ],
            ),
          ),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.all(16),
              child: Text('Save', style: TextStyle(color: Colors.blue)))
        ],
        backgroundColor: const Color.fromRGBO(249, 249, 249, 0.94),
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            Row(
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
            Divider(
              height: 1,
              color: PalletColors.btn_soft_grey,
            ),
            Text('Describe a maintenance issue'),
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
                    SizedBox(
                      height: 16,
                    ),
                    SizedBox(
                      width: Get.width*0.55,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            elevation: 0,
                            primary: Color.fromRGBO(
                                242, 242, 247, 1),
                            padding: EdgeInsets.all(16),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16),
                            ),
                          ),
                          onPressed: () => null,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
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

  void pickImage(ImageSource imageSource) async {
    var image = await ImagePicker().pickImage(source: imageSource, imageQuality: 5);
    if (image == null) {
      return null;
    }
    setState(() {

      _image = File(image.path);
    });
  }

}