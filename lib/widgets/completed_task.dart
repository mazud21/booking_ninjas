import 'package:booking_ninjas/theme/colors_texts_widget.dart';
import 'package:booking_ninjas/view/dashboard.dart';
import 'package:booking_ninjas/view/main_pages/history.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';

class CompletedTask extends StatefulWidget {
  @override
  State<CompletedTask> createState() => _CompletedTaskState();
}

class _CompletedTaskState extends State<CompletedTask> {

  late SharedPreferences prefs;

  final StopWatchTimer _stopWatchTimer = StopWatchTimer(
    isLapHours: true,
    onChange: (value) => print('onChange $value'),
    onChangeRawSecond: (value) => print('onChangeRawSecond $value'),
    onChangeRawMinute: (value) => print('onChangeRawMinute $value'),
  );

  inActiveTask() async {
    prefs = await SharedPreferences.getInstance();
    prefs.setString('task', 'inActive');
  }

  stopTaskTime() async {
    prefs = await SharedPreferences.getInstance();
    prefs.remove('time');
  }

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
                  onPressed: () {
                    inActiveTask();
                    stopTaskTime();
                    _stopWatchTimer.onExecute.add(StopWatchExecute.stop);
                    Get.offAll(Dashboard());
                  },
                  child: Text('Mark as completed')),
              SizedBox(
                height: 16,
              ),
              ElevatedButton(
                  style: ButtonCustom().elevatedRedSoft(),
                  onPressed: () {},
                  child: Text(
                    'Cancel'),
                  ),
            ],
          ),
        ),
      ),
    );
  }
}
