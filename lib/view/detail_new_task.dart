import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DetailNewTask extends StatefulWidget {

  @override
  _DetailNewTaskState createState() => _DetailNewTaskState();
}

class _DetailNewTaskState extends State<DetailNewTask> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Text('Back'),
        title: Text('New task'),
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Clean room'),
            Chip(
              label: Text('In progress'),
              padding: EdgeInsets.fromLTRB(8, 8, 12, 10),
              backgroundColor: Colors.orange,
              deleteIcon: Icon(Icons.keyboard_arrow_down),
              onDeleted: () {
              },
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Room'),
                    Text('Room 326')
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Floor'),
                    Text('Floor 3')
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Building/unit'),
                    Text('Building 8')
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 16,
            ),
            Text('Notes'),
            Text('Pay special attention to the bathroom'),
            Text('Est. time'),
            Text('30 min'),
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
          ],
        ),
      ),
    );
  }
}
