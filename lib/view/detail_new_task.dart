import 'package:booking_ninjas/theme/colors_texts_widget.dart';
import 'package:booking_ninjas/widgets/appbar_custom.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DetailNewTask extends StatefulWidget {

  late ValueNotifier<bool> switchValue;
  late BuildContext context;

  DetailNewTask({required this.switchValue, required this.context});

  @override
  _DetailNewTaskState createState() => _DetailNewTaskState();
}

class _DetailNewTaskState extends State<DetailNewTask> {

  late SharedPreferences prefs;
  late String actTask;

  activeTask() async {
    prefs = await SharedPreferences.getInstance();
    prefs.setString('task', 'active');
  }

  checkTaskAvailable() async {
    prefs = await SharedPreferences.getInstance();
    actTask = prefs.getString('task')!;

    if(actTask == 'inActive'){
      widget.switchValue.value = false;
    }

  }

  saveTime() async {
    //Insert
    prefs = await SharedPreferences.getInstance();
    prefs.setInt('time', DateTime.now().millisecondsSinceEpoch);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    checkTaskAvailable();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarCustom().getCupertinoNavBar('New Task'),
      body: Container(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Clean room', style: TextCustom().heading2(),),
            const SizedBox(height: 16),
            Chip(
              label: Text('In progress', style: TextCustom().textFootnote(PalletColors.text_white),),
              padding: const EdgeInsets.fromLTRB(8, 8, 12, 10),
              backgroundColor: Colors.orange,
              deleteIcon: const Icon(Icons.keyboard_arrow_down, color: PalletColors.text_white, size: 18,),
              onDeleted: () {
              },
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Room', style: TextCustom().textMenuGrey(),),
                    Text('Room 326')
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Floor', style: TextCustom().textMenuGrey(),),
                    Text('Floor 3')
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Building/unit', style: TextCustom().textMenuGrey(),),
                    Text('Building 8')
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 16,
            ),
            Text('Notes', style: TextCustom().textMenuGrey(),),
            Text('Pay special attention to the bathroom'),
            SizedBox(
              height: 16,
            ),
            Text('Est. time', style: TextCustom().textMenuGrey(),),
            Text('30 min'),
            SizedBox(
              height: 32,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width*0.25,
                  height: MediaQuery.of(context).size.height*0.05,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.green,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),
                      onPressed: () {
                        activeTask();
                        saveTime();

                        widget.switchValue.value = true;

                        Get.back();
                      },
                      child: Text('Accept')
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width*0.25,
                  height: MediaQuery.of(context).size.height*0.05,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.red,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),
                      onPressed: () => /*Get.to(Login())*/null,
                      child: Text('Decline')
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
