
import 'dart:developer';

import 'package:booking_ninjas/models/flightModel.dart';
import 'package:booking_ninjas/network/fetch_data.dart';
import 'package:booking_ninjas/theme/colors_texts_widget.dart';
import 'package:booking_ninjas/view/current_task.dart';
import 'package:booking_ninjas/view/dashboard.dart';
import 'package:booking_ninjas/view/detail_new_task.dart';
import 'package:booking_ninjas/view/detail_today_tasks_all.dart';
import 'package:booking_ninjas/view/new_task_all.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';

import '../../widgets/completed_task.dart';
import '../account_pages/login.dart';

class Tasks extends StatefulWidget {
  @override
  _TasksState createState() => _TasksState();
}

class _TasksState extends State<Tasks> {

  late SharedPreferences prefs;
  late String activeTask;
  ValueNotifier<bool> _switchValue = ValueNotifier<bool>(false);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    Future.delayed(Duration(seconds: 1), () {
      checkTaskAvailable();

    });

  }

  checkTaskAvailable() async {
    prefs = await SharedPreferences.getInstance();
    activeTask = prefs.getString('task')!;

    if(activeTask == 'inActive'){
      setState(() {

      });
      _switchValue = ValueNotifier<bool>(false);
    } else {
      setState(() {

      });
      _switchValue = ValueNotifier<bool>(true);
    }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ValueListenableBuilder(
          valueListenable: _switchValue,
          builder: (context, value, child) {
            return  Container(
              padding: const EdgeInsets.all(16),
              child: ListView(
                children: [
                  Card1(),
                  Card2(switchValue: value),
                  Card3(switchValue: _switchValue),
                ],
              ),
            );
          },
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
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Today\'s tasks',
                  style: TextCustom().heading2(),
                ),
                TextButton(
                  onPressed: () => bsDetailTodayTaskAll(context),
                  child: const Text('See All'),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Assigned by supervisor'),
                TextButton(
                  onPressed: () => null,
                  child: Text('0'),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Accepted from tasks'),
                TextButton(
                  onPressed: () => null,
                  child: Text('0'),
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  bsDetailTodayTaskAll(BuildContext context) {
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

  late bool switchValue;

  Card2({required this.switchValue});

  @override
  State<Card2> createState() => _Card2State();
}

class _Card2State extends State<Card2> {

  late SharedPreferences prefs;

  String activeTask = '';

  bool visibleOpen = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    Future.delayed(Duration(seconds: 5), () {
      checkTaskAvailable();

    });
  }


  checkTaskAvailable() async {
    prefs = await SharedPreferences.getInstance();
    activeTask = prefs.getString('task')!;

    log('CHECK_VALUE_TASK: $activeTask');

    if(widget.switchValue){
      setState(() {

      });

    }

  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Current task', style: TextCustom().heading2(),),
                Visibility(
                  visible: widget.switchValue,
                  child: TextButton(
                  onPressed: () => Get.to(CurrentTask()),
                    child: const Text('Open'),
                  ),
                )
              ],
            ),
            widget.switchValue ? const ActiveTask() : noTask,
            //activeTask == 'active' ? ActiveTask() : noTask
          ],
        ),
      ),
    );
  }
  
  Widget noTask = const Align(
    alignment: Alignment.center,
    child: Padding(
      padding: EdgeInsets.only(top: 16),
        child: Text('You don’t have a current task, please accept one to start working', style: TextStyle(fontSize: 16), textAlign: TextAlign.center,)
    ),
  );
}

class Card3 extends StatefulWidget {

  late ValueNotifier<bool> switchValue;

  Card3({required this.switchValue});

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
                  Text('New tasks', style: TextCustom().heading2(),),
                  TextButton(
                    onPressed: () => bsNewTaskAll(context),
                    child: Text('See All'),
                  ),
                ],
              ),
            ),
            FutureBuilder(
              future: Provider.of<FetchData>(context, listen: true).getListFlight(),
                builder: (context, snapshot) {
                  if(snapshot.connectionState == ConnectionState.waiting){
                    return const CupertinoActivityIndicator(
                      radius: 15,
                      animating: true,
                    );
                  } else if(snapshot.data == null){
                    setState(() {
                      _seeAll3 = false;
                    });
                    return SizedBox(
                      height: Get.height*0.2,
                      child: Center(child: const Text('Task is no available now')),
                    );
                  } else {
                    return SizedBox(
                      height: Get.height*0.48,
                      child: ListInfinityTask(flightModel: snapshot.data, switchValue: widget.switchValue,),
                    );
                  }
                },
            )
          ],
        ),
      ),
    );
  }

  bsNewTaskAll(BuildContext context) {
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

class ListInfinityTask extends StatefulWidget {
  late ValueNotifier<bool> switchValue;
  final flightModel;

  ListInfinityTask({required this.switchValue, required this.flightModel});

  @override
  State<ListInfinityTask> createState() => _ListInfinityTaskState();
}

class _ListInfinityTaskState extends State<ListInfinityTask> {

  late SharedPreferences prefs;
  late String actTask;

  late List<Data> _list;

  activeTask() async {
    prefs = await SharedPreferences.getInstance();
    prefs.setString('task', 'active');
  }

  checkTaskAvailable() async {
    prefs = await SharedPreferences.getInstance();
    actTask = prefs.getString('task')!;

    if(actTask == 'inActive'){
      widget.switchValue.value = false;
    }

  }

  saveTime() async {
    //Insert
    prefs = await SharedPreferences.getInstance();
    prefs.setInt('time', DateTime.now().millisecondsSinceEpoch);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    checkTaskAvailable();

    _list = widget.flightModel.data!.cast<Data>();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemCount: 3,
        itemBuilder: (context, index) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 16,
              ),
              ListTile(
                onTap: () => bsDetailTodayTask(context),
                leading: Image.asset('assets/images/broom.png'),
                title: Text('Clean Room'),
                //title: Text('${_list[index].name}'),
                //subtitle: Text('Room 475, Floor 4, Building 8'),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //Text('${_list[index].airline![0].name}, ${_list[index].airline![0].id}, Building 8'),
                    Text('Room 475, Floor 4, Building 8'),
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
                                activeTask();
                                saveTime();

                                widget.switchValue.value = true;

                              },
                              child: Text('Accept')),
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
                              child: Text('Decline')),
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
      )
    );
  }

  bsDetailTodayTask(BuildContext context) {
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

}


class ActiveTask extends StatefulWidget {
  const ActiveTask({Key? key}) : super(key: key);

  @override
  State<ActiveTask> createState() => _ActiveTaskState();
}

class _ActiveTaskState extends State<ActiveTask> {

  late SharedPreferences prefs;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    loadTime();

    _stopWatchTimer.rawTime.listen((value) =>
        print('rawTime $value ${StopWatchTimer.getDisplayTime(value)}'));
    _stopWatchTimer.minuteTime.listen((value) => print('minuteTime $value'));
    _stopWatchTimer.secondTime.listen((value) => print('secondTime $value'));
    _stopWatchTimer.records.listen((value) => print('records $value'));
  }

  final StopWatchTimer _stopWatchTimer = StopWatchTimer(
    isLapHours: true,
    onChange: (value) => print('onChange $value'),
    onChangeRawSecond: (value) => print('onChangeRawSecond $value'),
    onChangeRawMinute: (value) => print('onChangeRawMinute $value'),
  );

  restoreTime() async {
    //Get
    prefs = await SharedPreferences.getInstance();
    DateTime dt = DateTime.fromMillisecondsSinceEpoch(
        (prefs.getInt('time') ?? DateTime.now().millisecondsSinceEpoch));

    DateTime dt1 = DateTime.now();
    DateTime dt2 = dt;

    Duration diff = dt1.difference(dt2);

    return diff.inSeconds;
  }

  loadTime() async {
    int a = await restoreTime();

    print('CHECK_TIMEA: $a');

    _stopWatchTimer.setPresetSecondTime(a);
    _stopWatchTimer.onExecute.add(StopWatchExecute.start);
  }

  @override
  void dispose() async {
    super.dispose();
    await _stopWatchTimer.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
                child: Text(
                    'Clean room, replace linen, Clean room, replace linen')),
            Chip(
              label: Text('In progress'),
              padding: const EdgeInsets.fromLTRB(8, 8, 12, 10),
              backgroundColor: Colors.orange,
              deleteIcon: const Icon(Icons.keyboard_arrow_down),
              onDeleted: () {},
            ),
          ],
        ),
        ListTile(
          leading: ClipRRect(
            borderRadius: BorderRadius.circular(100),
            child: Container(
                padding: EdgeInsets.all(8),
                color: Colors.blue,
                child: const Icon(
                  Icons.vpn_key,
                  color: Colors.white,
                )),
          ),
          title: Text('Room 326'),
          subtitle: Text('Floor 3, Building 8'),
          //dense: true,
        ),
        Column(
          children: [
            const Text('Time'),
            Padding(
              padding: const EdgeInsets.only(bottom: 0),
              child: StreamBuilder<int>(
                stream: _stopWatchTimer.rawTime,
                initialData: _stopWatchTimer.rawTime.value,
                builder: (context, snap) {
                  final value = snap.data;
                  final displayTime = StopWatchTimer.getDisplayTime(value!,
                      milliSecond: false);
                  return Column(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(8),
                        child: Text(
                          displayTime,
                          style: const TextStyle(
                              fontSize: 26, color: Colors.lightBlueAccent),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
            //Text('00:04:20', style: TextStyle(fontSize: 26, color: Colors.lightBlueAccent),),
            Text('Est. time 30 min'),
            const SizedBox(
              height: 26,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.55,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor:
                    const Color.fromRGBO(167, 167, 167, 0.33529411764705882),
                    padding: const EdgeInsets.all(16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                  onPressed: () => /*Get.to(Login())*/ null,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: const [
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
            const SizedBox(
              height: 16,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.6,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    padding: const EdgeInsets.all(16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                  onPressed:
                      () => dialogTakePhotos(context),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Icon(Icons.check),
                      Text('Mark as completed')
                    ],
                  )),
            ),
          ],
        )
      ],
    );
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