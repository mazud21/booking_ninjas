import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_advanced_segment/flutter_advanced_segment.dart';

class DetailTodaytasks extends StatefulWidget {

  @override
  _DetailTodaytasksState createState() => _DetailTodaytasksState();
}

class _DetailTodaytasksState extends State<DetailTodaytasks> {

  bool assignSpv = true, assignTasks = false;
  final _controller = AdvancedSegmentController('all');
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
              Text('spv')
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
