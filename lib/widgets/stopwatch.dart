import 'dart:async';

import 'package:booking_ninjas/theme/colors_texts_widget.dart';
import 'package:flutter/material.dart';

class FlutterStopWatch extends StatefulWidget {

  final counterGet;

  const FlutterStopWatch({this.counterGet});

  @override
  _FlutterStopWatchState createState() => _FlutterStopWatchState();
}

class _FlutterStopWatchState extends State<FlutterStopWatch> {
  bool flag = true;
  late Stream<int> timerStream;
  late StreamSubscription<int> timerSubscription;
  String hoursStr = '00';
  String minutesStr = '00';
  String secondsStr = '00';

  late StreamController<int> streamController;
  late Timer timer;
  int counter = 0;

  Stream<int> stopWatchStream() {
    Duration timerInterval = const Duration(seconds: 1);
    //int counter = 0;

    void stopTimer() {
      timer.cancel();
      counter = 0;
      streamController.close();
    }

    void tick(_) {
      counter++;
      streamController.add(counter);
      if (!flag) {
        stopTimer();
      }
    }

    void startTimer() {
      timer = Timer.periodic(timerInterval, tick);
    }

    streamController = StreamController<int>(
      onListen: startTimer,
      onCancel: stopTimer,
      onResume: startTimer,
      onPause: stopTimer,
    );

    return streamController.stream;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    counter = widget.counterGet;

    startTime();
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      "$hoursStr:$minutesStr:$secondsStr", style: TextCustom().heading1Blue(),
    );
  }

  startTime(){
    timerStream = stopWatchStream();
    timerSubscription = timerStream.listen((int newTick) {
      setState(() {
        hoursStr = ((newTick / (60 * 60)) % 60)
            .floor()
            .toString()
            .padLeft(2, '0');
        minutesStr = ((newTick / 60) % 60)
            .floor()
            .toString()
            .padLeft(2, '0');
        secondsStr = (newTick % 60).floor().toString().padLeft(2, '0');
      });
    });
  }

}