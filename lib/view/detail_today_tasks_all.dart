import 'dart:developer';

import 'package:booking_ninjas/theme/colors_texts_widget.dart';
import 'package:booking_ninjas/view/decline_task.dart';
import 'package:booking_ninjas/widgets/appbar_custom.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DetailTodayTasksAll extends StatefulWidget {
  @override
  _DetailTodayTasksAllState createState() => _DetailTodayTasksAllState();
}

class _DetailTodayTasksAllState extends State<DetailTodayTasksAll> {
  bool assignSpv = true, assignTasks = false;
  int groupValue = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarCustom().getSubAppBarCustom('Today\'s task'),
      body: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(10),
        child: Stack(
          children: [
            CupertinoSlidingSegmentedControl<int>(
              thumbColor: CupertinoColors.white,
              groupValue: groupValue,
              children: const {
                0: Text(
                  'Assigned by supervisor',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                1: Text(
                  'Accepted from tasks',
                  style: TextStyle(fontWeight: FontWeight.bold),
                )
              },
              onValueChanged: (value) {
                setState(() {
                  groupValue = value!;
                });
              },
            ),
            Padding(
              padding: const EdgeInsets.only(top: 50),
              child: groupValue == 0 ? ListSpv() : ListSpv(),
            ),
          ],
        ),
      ),
    );
  }
}

class ListSpv extends StatefulWidget {
  @override
  _ListSpvState createState() => _ListSpvState();
}

class _ListSpvState extends State<ListSpv> {
  List items = List<String>.generate(20, (i) => 'Item ${i + 1}');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          return SizedBox(
            child: Card(
              child: Padding(
                padding: EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                            padding: EdgeInsets.only(right: 16),
                            child: Image.asset('assets/images/broom.png')),
                        Flexible(
                            child: Text(
                          'Clean room, replace linen, Clean room, replace linen',
                          style: TextCustom().textText(PalletColors.text_black),
                        )),
                      ],
                    ),
                    ListTile(
                      leading: ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child: Container(
                            padding: EdgeInsets.all(8),
                            color: Colors.blue,
                            child: Icon(
                              Icons.vpn_key,
                              color: Colors.white,
                              size: Get.width * 0.05,
                            )),
                      ),
                      title: Text('Room 326'),
                      subtitle: Text('Floor 3, Building 8'),
                      //dense: true,
                    ),
                    Divider(
                      height: 0.1,
                      color: Color.fromRGBO(205, 205, 205, 1.0),
                    ),
                    Padding(
                        padding: EdgeInsets.fromLTRB(32, 8, 0, 16),
                        child: Text(
                          'Est. time 30 min',
                          style: TextCustom()
                              .textFootnote(PalletColors.text_soft_grey),
                        )),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: Dismissible(
                        confirmDismiss: (direction) async {
                          log('GET_DISMISS');
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text(
                              'Task from supervisor has been started',
                              style: TextStyle(color: Colors.black),
                            ),
                            backgroundColor: Colors.white,
                          ));
                          return null;
                        },
                        // Each Dismissible must contain a Key. Keys allow Flutter to
                        // uniquely identify widgets.
                        key: Key(items.toString()),
                        // Provide a function that tells the app
                        // what to do after an item has been swiped away.
                        // Show a red background as the item is swiped away.
                        //background: Container(color: Colors.green),
                        child: Container(
                          decoration: ShapeDecoration(
                            color: Colors.green,
                            shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(16)),
                            ),
                          ),
                          child: const ListTile(
                            leading: Icon(
                              CupertinoIcons.chevron_right_2,
                              color: Colors.white,
                            ),
                            //tileColor: Colors.green,
                            title: Text("Swipe to start",
                                style: TextStyle(color: Colors.white)),
                          ),
                        ),
                        onDismissed: (direction) {
                          log('GET_DISMISS');
                        },
                      ),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        style: ButtonCustom().elevatedRedSoft(),
                          onPressed: () => dialogDeclineTask(context),
                          child: Text('Cancel', style: TextCustom().textButton(PalletColors.text_red),),
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  dialogDeclineTask(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: PalletColors.btn_white,
          title: const Align(
            alignment: Alignment.center,
            child: Text('Why do you want to decline this task?'),
          ),
          content: Declinetask(),
        );
      },
    );
  }

}

class ListTask extends StatefulWidget {
  @override
  _ListTaskState createState() => _ListTaskState();
}

class _ListTaskState extends State<ListTask> {
  List items = List<String>.generate(20, (i) => 'Item ${i + 1}');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          return SizedBox(
            height: 200,
            child: Card(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image.asset('assets/images/broom.png'),
                      Flexible(
                          child: Text(
                              'Clean room, replace linen, Clean room, replace linen')),
                    ],
                  ),
                  ListTile(
                    leading: ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: Container(
                          padding: EdgeInsets.all(8),
                          color: Colors.blue,
                          child: Icon(
                            Icons.vpn_key,
                            color: Colors.white,
                          )),
                    ),
                    title: Text('Room 326'),
                    subtitle: Text('Floor 3, Building 8'),
                    //dense: true,
                  ),
                  Divider(
                    height: 0.1,
                    color: Color.fromRGBO(205, 205, 205, 1.0),
                  ),
                  Text('Est. time 30 min'),
                  Dismissible(
                    confirmDismiss: (direction) async {
                      return null;
                    },
                    // Each Dismissible must contain a Key. Keys allow Flutter to
                    // uniquely identify widgets.
                    key: Key(items.toString()),
                    // Provide a function that tells the app
                    // what to do after an item has been swiped away.
                    // Show a red background as the item is swiped away.
                    background: Container(color: Colors.red),
                    child: ListTile(
                      title: Text(items.toString()),
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
