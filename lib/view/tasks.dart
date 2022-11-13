import 'dart:async';

import 'package:booking_ninjas/view/current_task.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widgets/stopwatch.dart';

class Tasks extends StatefulWidget {
  @override
  _TasksState createState() => _TasksState();
}

class _TasksState extends State<Tasks> {
  Widget myAppBarIcon() {
    return Container(
      width: 30,
      height: 30,
      child: Stack(
        children: [
          Icon(
            Icons.notifications,
            color: Colors.black,
            size: 30,
          ),
          Container(
            width: 30,
            height: 30,
            alignment: Alignment.topRight,
            margin: EdgeInsets.only(top: 5),
            child: Container(
              width: 15,
              height: 15,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color(0xffc32c37),
                  border: Border.all(color: Colors.white, width: 1)),
              child: Padding(
                padding: const EdgeInsets.all(0.0),
                child: Center(
                  child: Text(
                    /*_counter.toString()*/
                    '3',
                    style: TextStyle(fontSize: 10, color: Colors.white),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  late Timer _timer;
  int firstSecond = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    incrementSecond();
  }

  incrementSecond(){
    _timer = Timer.periodic(const Duration(seconds: 1), (Timer t) {
      setState(() {
        firstSecond++;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(CupertinoIcons.bars, color: Colors.black45),
        title: Text(
          'Tasks',
          style: TextStyle(fontWeight: FontWeight.w500, color: Colors.black45),
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
        actions: [Padding(padding: EdgeInsets.all(16), child: myAppBarIcon())],
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: ListView(
          children: [
            Card(
              child: Padding(
                padding: EdgeInsets.all(16),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Today\'s tasks $firstSecond'),
                        TextButton(
                          onPressed: () => null,
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
            ),
            Card(
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
            ),
            Card(
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
                            onPressed: () => null,
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
                              onTap: () => null,
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
            ),
          ],
        ),
      ),
    );
  }

}
