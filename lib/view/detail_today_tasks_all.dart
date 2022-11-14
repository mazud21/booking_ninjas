import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swipe_button/flutter_swipe_button.dart';

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
                  groupValue = value!;
                });
              },
            ),
            Padding(
              padding: EdgeInsets.only(top: 50),
              child: groupValue == 0 ? listSpv : listTask,
            ),
          ],
        ),
      ),
    );
  }

  Widget listSpv = ListView.builder(
    itemCount: 4,
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
              SwipeButton(
                borderRadius: BorderRadius.circular(8),
                activeTrackColor: Colors.amber,
                height: 60,
                child: Text(
                  "Swipe to ...",
                  style: TextStyle(
                    color: Colors.red,
                  ),
                ),
                onSwipe: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text("Swipped"),
                      backgroundColor: Colors.green,
                    ),
                  );
                },
              )
            ],
          ),
        ),
      );
    },
  );

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
