import 'package:booking_ninjas/theme/colors_texts_widget.dart';
import 'package:booking_ninjas/widgets/appbar_custom.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DetailNewTask extends StatefulWidget {
  late ValueNotifier<bool> switchValue;
  late BuildContext context;
  late String title, status, room, floor, building, notes;

  DetailNewTask(
      {required this.switchValue,
      required this.context,
      required this.title,
      required this.status,
      required this.room,
      required this.floor,
      required this.building,
      required this.notes});

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

    if (actTask == 'inActive') {
      widget.switchValue.value = false;
    }
  }

  saveTime() async {
    //Insert
    prefs = await SharedPreferences.getInstance();
    prefs.setInt('time', DateTime.now().millisecondsSinceEpoch);
  }
  
  _checkStatus(String status){
    if(status == 'Pending'){
      return PalletColors.chip_orange;
    } else if(status == 'Confirmed'){
      return PalletColors.chip_soft_blue;
    } else if(status == 'In Progress') {
      return PalletColors.btn_deep_blue;
    } else {
      return PalletColors.chip_green;
    }
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
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.title,
              style: TextCustom().heading2(),
            ),
            const SizedBox(height: 16),
            Chip(
              label: Text(
                widget.status,
                style: TextCustom().textFootnote(PalletColors.text_white),
              ),
              padding: const EdgeInsets.fromLTRB(8, 8, 12, 10),
              backgroundColor: _checkStatus(widget.status),
              deleteIcon: const Icon(
                Icons.keyboard_arrow_down,
                color: PalletColors.text_white,
                size: 18,
              ),
              onDeleted: () {},
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Room',
                      style: TextCustom().textMenuGrey(),
                    ),
                    Text(widget.room)
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Floor',
                      style: TextCustom().textMenuGrey(),
                    ),
                    Text(widget.floor)
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Building/unit',
                      style: TextCustom().textMenuGrey(),
                    ),
                    Text(widget.building)
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 16,
            ),
            Text(
              'Notes',
              style: TextCustom().textMenuGrey(),
            ),
            //const Text('Pay special attention to the bathroom'),
            Text(widget.notes == 'null' ? '-' : widget.notes),
            const SizedBox(
              height: 16,
            ),
            Text(
              'Est. time',
              style: TextCustom().textMenuGrey(),
            ),
            const Text('30 min'),
            const SizedBox(
              height: 32,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.25,
                  height: MediaQuery.of(context).size.height * 0.05,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
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
                      child: const Text('Accept')),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.25,
                  height: MediaQuery.of(context).size.height * 0.05,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),
                      onPressed: () => /*Get.to(Login())*/ null,
                      child: const Text('Decline')),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
