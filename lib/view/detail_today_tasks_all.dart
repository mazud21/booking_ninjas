import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
      appBar: AppBar(),
      body: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.all(10),
        child: Stack(
          children: [
            CupertinoSlidingSegmentedControl<int>(
              thumbColor: CupertinoColors.white,
              groupValue: groupValue,
              children: {
                0: Text('Assigned by supervisor'),
                1: Text('Accepted from tasks')
              },
              onValueChanged: (value){
                setState(() {
                  groupValue = value;
                });
              },
            ),
            Padding(
              padding: EdgeInsets.only(top: 50),
              child: groupValue == 0 ? ListSpv() : listTask,
            ),
          ],
        ),
      ),
    );
  }

  Widget listTask = ListView.builder(
    itemCount: 4,
    itemBuilder: (context, index) {
      return SizedBox(
        height: 200,
        child: Card(
          child: Column(
            children: [
              Text('task')
            ],
          ),
        ),
      );
    },
  );

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
            height: 200,
            child: Card(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image.asset('assets/images/broom.png'),
                      Flexible(child: Text('Clean room, replace linen, Clean room, replace linen')),
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
                  Divider(
                    height: 0.1,
                    color: Color.fromRGBO(205, 205, 205, 1.0),
                  ),
                  Text('Est. time 30 min'),
                  Dismissible(
                    confirmDismiss: (direction) async {
                      log('GET_DISMISS');
                      Scaffold.of(context).showSnackBar(SnackBar(content: Text('Hello',), backgroundColor: Colors.white,));
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
                      title: Text("Swipe to start"),
                    ),
                    onDismissed: (direction) {
                      log('GET_DISMISS');
                    },
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
                      Flexible(child: Text('Clean room, replace linen, Clean room, replace linen')),
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