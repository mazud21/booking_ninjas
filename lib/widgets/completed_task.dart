import 'package:booking_ninjas/theme/colors_texts_widget.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CompletedTask extends StatefulWidget {
  @override
  State<CompletedTask> createState() => _CompletedTaskState();
}

class _CompletedTaskState extends State<CompletedTask> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              GridView.builder(
                shrinkWrap: true,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 5.0,
                  mainAxisSpacing: 5.0,
                ),
                itemCount: 4,
                itemBuilder: (context, index) {
                  return Stack(children: [
                    Padding(
                      padding: EdgeInsets.all(16),
                      child: DottedBorder(
                        color: PalletColors.text_soft_grey,
                        strokeWidth: 2,
                        dashPattern: [6, 0, 2, 3],
                        child: Center(
                            child: Icon(
                              Icons.camera_alt_rounded,
                              color: PalletColors.text_soft_grey,
                            )),
                      ),
                    ),
                    Positioned(
                        top: 4,
                        right: 4,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(100),
                          child: Container(
                            padding: EdgeInsets.all(2),
                            color: PalletColors.btn_soft_grey,
                            child: Icon(Icons.close, size: 18,),
                          ),
                        )),
                  ]);
                },
              ),
              ElevatedButton(
                  style: ButtonCustom().elevatedGreen(),
                  onPressed: () {},
                  child: Text('Mark as completed')),
              SizedBox(
                height: 16,
              ),
              ElevatedButton(
                  style: ButtonCustom().elevatedRedSoft(),
                  onPressed: () {},
                  child: Text(
                    'Cancel',
                    style: TextCustom().headline3(PalletColors.text_red),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
