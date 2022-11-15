import 'package:booking_ninjas/view/problems.dart';
import 'package:booking_ninjas/widgets/completed_task.dart';
import 'package:booking_ninjas/widgets/report_problem.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../theme/colors_texts_widget.dart';
import '../widgets/stopwatch.dart';

class CurrentTask extends StatefulWidget {
  final int getSecond;

  const CurrentTask({required this.getSecond});

  @override
  State<CurrentTask> createState() => _CurrentTaskState();
}

class _CurrentTaskState extends State<CurrentTask> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Current task'),
        leadingWidth: Get.width*0.25,
        leading: InkWell(
          onTap: () => Get.back(),
          child: Padding(
            padding: EdgeInsets.all(4),
            child: Row(
              children: const [
                SizedBox(
                  width: 16,
                ),
                Icon(Icons.arrow_back_ios, color: Colors.blue,),
                Text('Back', style: TextStyle(color: Colors.blue),)
              ],
            ),
          ),
        ),
        backgroundColor: const Color.fromRGBO(249, 249, 249, 0.94),
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            Text('ndjfnhsjldikbnhskdjfnbskdjfhlsidjfnblsidfjbnsdifbhjfbldsfjkshbdkfjh'),
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
            Text('Tasks'),
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: 2,
              itemBuilder: (context, index) {
                return Row(
                  children: [
                    Icon(Icons.check),
                    Text('Bathroom cleaning'),
                  ],
                );
              },
            ),
            Text('Notes'),
            Text('Pay special attention to the bathroom'),
            Text('Notes'),
            FlutterStopWatch(counterGet: widget.getSecond),
            Text('Est. time 30 min'),
            Container(
              width: double.infinity,
              height: Get.height*0.2,
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                  color: Color.fromRGBO(253, 176, 72, 0.16),
                borderRadius: BorderRadius.circular(8)
              ),
              child: Text('Personal notes'),
            ),
            Row(
              children: [
                Text('3 problems reported',),
                Spacer(),
                TextButton(
                  onPressed: () => bsProblemsList(context),
                  child: Text('Open'),
                )
              ],
            ),
            SizedBox(
              width: Get.width*0.55,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    elevation: 0,
                    primary: Color.fromRGBO(
                        242, 242, 247, 1),
                    padding: EdgeInsets.all(16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                  onPressed: () => bsReportProblem(context),
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
              width: Get.width*0.55,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    elevation: 0,
                    primary: Color.fromRGBO(44, 44, 46, 1),
                    padding: EdgeInsets.all(16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                  onPressed: () => dialogTakePhotos(context),
                  child: Text('Take photos', style: TextStyle(color: Colors.white),
                  )
              ),
            ),
          ],
        ),
      ),
    );
  }

  bsReportProblem(BuildContext context){
    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        builder: (context) {
          return FractionallySizedBox(
            heightFactor: 0.9,
            child: ReportProblem(),
          );
        });
  }

  bsProblemsList(BuildContext context){
    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        builder: (context) {
          return FractionallySizedBox(
            heightFactor: 0.9,
            child: Problems(),
          );
        });
  }

  dialogTakePhotos(BuildContext context){
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Align(
              alignment: Alignment.center,
              child: Text('Please take photos of the completed task'),
            ),
            content: SizedBox(
              height: Get.height*0.6,
              child: CompletedTask(),
            ),
          );
        },
    );
  }

}
