import 'dart:developer';

import 'package:booking_ninjas/theme/colors_texts_widget.dart';
import 'package:booking_ninjas/view/decline_task.dart';
import 'package:booking_ninjas/widgets/appbar_custom.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../network/fetch_data.dart';
import 'detail_new_task.dart';

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
        width: double.maxFinite,
        alignment: Alignment.center,
        padding: const EdgeInsets.all(10),
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            CupertinoSlidingSegmentedControl<int>(
              thumbColor: CupertinoColors.white,
              groupValue: groupValue,
              children: const {
                0: Text(
                  'Assigned Task',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                1: Text(
                  'Unassign Task',
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
              padding: const EdgeInsets.only(top: 40),
              child: groupValue == 0 ? ListAssignedTask() : ListUnassignedTask(),
            ),
          ],
        ),
      ),
    );
  }
}

class ListAssignedTask extends StatefulWidget {
  @override
  _ListAssignedTaskState createState() => _ListAssignedTaskState();
}

class _ListAssignedTaskState extends State<ListAssignedTask> {

  @override
  Widget build(BuildContext context) {
    return Container(
      child: FutureBuilder(
        future: Provider.of<FetchData>(context, listen: true).getListTaskAssign(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CupertinoActivityIndicator(
                animating: true,
                radius: 15,
              ),
            );
          }
          return Consumer<FetchData>(
            builder: (context, data, _) {
              return ListView.builder(
                /*shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),*/
                itemCount: data.dataTaskAssign.length,
                itemBuilder: (context, index) {

                  var compressCall = data.dataTaskAssign[index];

                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 16,
                      ),
                      ListTile(
                        //onTap: () => bsDetailTodayTask(context, compressCall.cleaningTask.toString(), compressCall.status.toString(), compressCall.roomUnitNumber.toString(), compressCall.roomUnitFloor.toString(), compressCall.roomUnitPropertyName.toString(), compressCall.notes.toString()),
                        leading: Image.asset('assets/images/broom.png'),
                        //title: const Text('Clean Room'),
                        title: Text('${compressCall.cleaningTask}'),
                        //subtitle: Text('Room 475, Floor 4, Building 8'),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            //Text('${_list[index].airline![0].name}, ${_list[index].airline![0].id}, Building 8'),
                            Text('${compressCall.roomUnitNumber}, Floor ${compressCall.roomUnitFloor}, ${compressCall.roomUnitPropertyName}'),
                            const SizedBox(
                              height: 16,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  width: MediaQuery.of(context).size.width * 0.25,
                                  height:
                                  MediaQuery.of(context).size.height * 0.05,
                                  child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.green,
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(16),
                                        ),
                                      ),
                                      onPressed: () {

                                        FetchData().postStatusTask(compressCall.id.toString(), compressCall.status.toString());

                                      },
                                      child: const Text('Accept')),
                                ),
                                SizedBox(
                                  width: MediaQuery.of(context).size.width * 0.25,
                                  height:
                                  MediaQuery.of(context).size.height * 0.05,
                                  child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.red,
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(16),
                                        ),
                                      ),
                                      onPressed: () => /*Get.to(Login())*/null,
                                      child: const Text('Decline')),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                          ],
                        ),
                      ),
                      const Divider(
                        height: 0.1,
                        color: Color.fromRGBO(205, 205, 205, 1.0),
                      )
                    ],
                  );
                },
              );
            },
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

class ListUnassignedTask extends StatefulWidget {
  @override
  _ListUnassignedTaskState createState() => _ListUnassignedTaskState();
}

class _ListUnassignedTaskState extends State<ListUnassignedTask> {

  @override
  Widget build(BuildContext context) {
    return Container(
      child: FutureBuilder(
        future: Provider.of<FetchData>(context, listen: true).getListTask(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CupertinoActivityIndicator(
                animating: true,
                radius: 15,
              ),
            );
          }
          return Consumer<FetchData>(
            builder: (context, data, _) {
              return ListView.builder(
                /*shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),*/
                itemCount: data.dataTaskGeneral.length,
                itemBuilder: (context, index) {

                  var compressCall = data.dataTaskGeneral[index];

                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 16,
                      ),
                      ListTile(
                        //onTap: () => bsDetailTodayTask(context, compressCall.cleaningTask.toString(), compressCall.status.toString(), compressCall.roomUnitNumber.toString(), compressCall.roomUnitFloor.toString(), compressCall.roomUnitPropertyName.toString(), compressCall.notes.toString()),
                        leading: Image.asset('assets/images/broom.png'),
                        //title: const Text('Clean Room'),
                        title: Text('${compressCall.cleaningTask}'),
                        //subtitle: Text('Room 475, Floor 4, Building 8'),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            //Text('${_list[index].airline![0].name}, ${_list[index].airline![0].id}, Building 8'),
                            Text('${compressCall.roomUnitNumber}, Floor ${compressCall.roomUnitFloor}, ${compressCall.roomUnitPropertyName}'),
                            const SizedBox(
                              height: 16,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  width: MediaQuery.of(context).size.width * 0.25,
                                  height:
                                  MediaQuery.of(context).size.height * 0.05,
                                  child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.green,
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(16),
                                        ),
                                      ),
                                      onPressed: () {

                                        FetchData().postStatusTask(compressCall.id.toString(), compressCall.status.toString());

                                      },
                                      child: const Text('Accept')),
                                ),
                                SizedBox(
                                  width: MediaQuery.of(context).size.width * 0.25,
                                  height:
                                  MediaQuery.of(context).size.height * 0.05,
                                  child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.red,
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(16),
                                        ),
                                      ),
                                      onPressed: () => /*Get.to(Login())*/null,
                                      child: const Text('Decline')),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                          ],
                        ),
                      ),
                      const Divider(
                        height: 0.1,
                        color: Color.fromRGBO(205, 205, 205, 1.0),
                      )
                    ],
                  );
                },
              );
            },
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