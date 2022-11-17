import 'dart:async';

import 'package:booking_ninjas/theme/colors_texts_widget.dart';
import 'package:booking_ninjas/view/current_task.dart';
import 'package:booking_ninjas/view/detail_new_task.dart';
import 'package:booking_ninjas/view/detail_today_tasks_all.dart';
import 'package:booking_ninjas/view/new_task_all.dart';
import 'package:booking_ninjas/widgets/appbar_custom.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../widgets/stopwatch.dart';

class Tasks extends StatefulWidget {
  @override
  _TasksState createState() => _TasksState();
}

class _TasksState extends State<Tasks> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(16),
        child: ListView(
          children: [
            Card1(),
            Card2(),
            Card3(),
          ],
        ),
      ),
    );
  }

}

class Card1 extends StatefulWidget {

  @override
  State<Card1> createState() => _Card1State();
}

class _Card1State extends State<Card1> {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Today\'s tasks', style: TextCustom().heading2(),),
                TextButton(
                  onPressed: () => bsDetailTodayTaskAll(context),
                  child: Text('See All'),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Assigned by supervisor'),
                TextButton(
                  onPressed: () => null,
                  child: Text('20'),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Accepted from tasks'),
                TextButton(
                  onPressed: () => null,
                  child: Text('8'),
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  bsDetailTodayTaskAll(BuildContext context){
    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        builder: (context) {
          return FractionallySizedBox(
            heightFactor: 0.9,
            child: DetailTodayTasksAll(),
          );
        });
  }

}

class Card2 extends StatefulWidget {

  @override
  State<Card2> createState() => _Card2State();
}

class _Card2State extends State<Card2> {

  late Timer _timer;
  int firstSecond = 0;
  incrementSecond(){
    _timer = Timer.periodic(const Duration(seconds: 1), (Timer t) {
      setState(() {
        firstSecond++;
      });
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    incrementSecond();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Current task'),
                TextButton(
                  onPressed: () => Get.to(CurrentTask(getSecond: firstSecond,)),
                  child: Text('Open'),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(child: Text('Clean room, replace linen, Clean room, replace linen')),
                Chip(
                  label: Text('In progress'),
                  padding: EdgeInsets.fromLTRB(8, 8, 12, 10),
                  backgroundColor: Colors.orange,
                  deleteIcon: Icon(Icons.keyboard_arrow_down),
                  onDeleted: () {
                  },
                ),
              ],
            ),
            ListTile(
              leading: ClipRRect(
                borderRadius: BorderRadius.circular(100),
                child: Container(
                    padding: EdgeInsets.all(8),
                    color: Colors.blue,
                    child: Icon(Icons.vpn_key, color: Colors.white,)),
              ),
              title: Text('Room 326'),
              subtitle: Text('Floor 3, Building 8'),
              //dense: true,
            ),
            Column(
              children: [
                Text('Time'),
                FlutterStopWatch(counterGet: firstSecond,),
                Text('00:04:20', style: TextStyle(fontSize: 26, color: Colors.lightBlueAccent),),
                Text('Est. time 30 min'),
                SizedBox(
                  height: 26,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.55,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Color.fromRGBO(
                            167, 167, 167, 0.33529411764705882),
                        padding: EdgeInsets.all(16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),
                      onPressed: () => /*Get.to(Login())*/null,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Icon(Icons.chat,color: Colors.black,),
                          Text('Report a problem', style: TextStyle(color: Colors.black),)
                        ],
                      )
                  ),
                ),
                SizedBox(
                  height: 16,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.6,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.green,
                        padding: EdgeInsets.all(16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),
                      onPressed: () => /*Get.to(CurrentTask(getSecond: firstSecond,))*/ null,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Icon(Icons.check),
                          Text('Mark as completed')
                        ],
                      )
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class Card3 extends StatefulWidget {
  const Card3({Key? key}) : super(key: key);

  @override
  State<Card3> createState() => _Card3State();
}

class _Card3State extends State<Card3> {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: EdgeInsets.fromLTRB(16, 16, 0, 16),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(right: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('New tasks'),
                  TextButton(
                    onPressed: () => bsNewTaskAll(context),
                    child: Text('See All'),
                  ),
                ],
              ),
            ),
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: 3,
              itemBuilder: (context, index) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 16,
                    ),
                    ListTile(
                      onTap: () => bsDetailTodayTask(context),
                      leading: Image.asset('assets/images/broom.png'),
                      title: Text('Clean room'),
                      //subtitle: Text('Room 475, Floor 4, Building 8'),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Room 475, Floor 4, Building 8'),
                          SizedBox(
                            height: 16,
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
                                    onPressed: () => /*Get.to(Login())*/null,
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
                          SizedBox(
                            height: 8,
                          ),
                        ],
                      ),
                    ),
                    Divider(
                      height: 0.1,
                      color: Color.fromRGBO(205, 205, 205, 1.0),
                    )
                  ],
                );
              },
            )
          ],
        ),
      ),
    );
  }

  bsDetailTodayTask(BuildContext context){
    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        builder: (context) {
          return FractionallySizedBox(
            heightFactor: 0.9,
            child: DetailNewTask(),
          );
        });
  }

  bsNewTaskAll(BuildContext context){
    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        builder: (context) {
          return FractionallySizedBox(
            heightFactor: 0.9,
            child: NewTaskAll(),
          );
        });
  }

}