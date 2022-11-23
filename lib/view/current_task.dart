import 'package:booking_ninjas/view/problems.dart';
import 'package:booking_ninjas/widgets/appbar_custom.dart';
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
  bool visibleReported = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarCustom().getSubAppBarCustom('Current Task'),
      body: Container(
        padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
        child: ListView(
          children: [
            Text(
                'ndjfnhsjldikbnhskdjfnbskdjfhlsidjfnblsidfjbnsdifbhjfbldsfjkshbdkfjh',
                style: TextCustom().textText(PalletColors.text_black)),
            const SizedBox(
              height: 8,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Chip(
                label: const Text(
                  'In progress',
                  style: TextStyle(color: PalletColors.text_white),
                ),
                padding: const EdgeInsets.fromLTRB(8, 8, 12, 10),
                backgroundColor: PalletColors.chip_orange,
                deleteIcon: const Icon(
                  Icons.keyboard_arrow_down,
                  color: PalletColors.text_white,
                ),
                onDeleted: () {},
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Room', style: TextCustom().textMenuGrey()),
                    SizedBox(
                      height: 4,
                    ),
                    Text('Room 326')
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Floor', style: TextCustom().textMenuGrey()),
                    SizedBox(
                      height: 4,
                    ),
                    Text('Floor 3')
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Building/unit', style: TextCustom().textMenuGrey()),
                    SizedBox(
                      height: 4,
                    ),
                    Text('Building 8')
                  ],
                ),
              ],
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                  padding: const EdgeInsets.fromLTRB(0, 16, 0, 8),
                  child: Text(
                    'Tasks',
                    style: TextCustom().textMenuGrey(),
                  )),
            ),
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: 2,
              itemBuilder: (context, index) {
                return Row(
                  children: const [
                    Icon(Icons.check),
                    SizedBox(
                      width: 8,
                    ),
                    Text('Bathroom cleaning'),
                  ],
                );
              },
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                  padding: const EdgeInsets.fromLTRB(0, 16, 0, 8),
                  child: Text(
                    'Notes',
                    style: TextCustom().textMenuGrey(),
                  )),
            ),
            Align(
                alignment: Alignment.centerLeft,
                child: Text('Pay special attention to the bathroom')),
            Column(
              children: [
                Padding(
                    padding: EdgeInsets.fromLTRB(0, 16, 0, 0),
                    child: Text('Time', style: TextCustom().textMenu())),
                FlutterStopWatch(counterGet: widget.getSecond),
                Text(
                  'Est. time 30 min',
                  style: TextCustom().textMenuGrey(),
                ),
              ],
            ),
            Container(
              width: double.infinity,
              height: Get.height * 0.2,
              margin: EdgeInsets.only(top: 16),
              padding: EdgeInsets.fromLTRB(8, 0, 8, 8),
              decoration: BoxDecoration(
                  color: Color.fromRGBO(253, 176, 72, 0.16),
                  borderRadius: BorderRadius.circular(8)),
              child: TextFormField(
                  maxLines: 5,
                  decoration: const InputDecoration(
                      hintText: 'Personal Notes', border: InputBorder.none)),
            ),
            Visibility(
              visible: visibleReported,
              child: Row(
                children: [
                  Text(
                    '3 problems reported', style: TextCustom().textText(PalletColors.text_red),
                  ),
                  const Spacer(),
                  TextButton(
                    onPressed: () => bsProblemsList(context),
                    child: Text('Open'),
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.all( visibleReported ? 16 : 0),
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.all(8),
                    child: SizedBox(
                      width: Get.width * 0.55,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            elevation: 0,
                            primary: Color.fromRGBO(242, 242, 247, 1),
                            padding: EdgeInsets.all(16),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16),
                            ),
                          ),
                          onPressed: () => bsReportProblem(context),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Icon(
                                Icons.chat,
                                color: Colors.black,
                              ),
                              Text(
                                'Report a problem',
                                style: TextStyle(color: Colors.black),
                              )
                            ],
                          )),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8),
                    child: SizedBox(
                      width: Get.width * 0.55,
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
                          child: const Text(
                            'Take photos',
                            style: TextStyle(color: Colors.white),
                          )),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  bsReportProblem(BuildContext context) {
    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(16),
          ),
        ),
        clipBehavior: Clip.antiAliasWithSaveLayer,
        backgroundColor: Colors.white,
        builder: (context) {
          return FractionallySizedBox(
            heightFactor: 0.9,
            child: Container(child: ReportProblem()),
          );
        });
  }

  bsProblemsList(BuildContext context) {
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

  dialogTakePhotos(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Align(
            alignment: Alignment.center,
            child: Text('Please take photos of the completed task'),
          ),
          content: SizedBox(
            height: Get.height * 0.6,
            child: CompletedTask(),
          ),
        );
      },
    );
  }
}
