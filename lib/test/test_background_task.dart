import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';

class StopWatch extends StatefulWidget {
  @override
  _StopWatchState createState() => _StopWatchState();
}

class _StopWatchState extends State<StopWatch> {
  final _isHours = true;

  final StopWatchTimer _stopWatchTimer = StopWatchTimer(
    isLapHours: true,
    onChange: (value) => print('onChange $value'),
    onChangeRawSecond: (value) => print('onChangeRawSecond $value'),
    onChangeRawMinute: (value) => print('onChangeRawMinute $value'),
  );

  final _scrollController = ScrollController();

  late SharedPreferences prefs;

  @override
  void initState() {
    super.initState();

    loadTime();

    _stopWatchTimer.rawTime.listen((value) =>
        print('rawTime $value ${StopWatchTimer.getDisplayTime(value)}'));
    _stopWatchTimer.minuteTime.listen((value) => print('minuteTime $value'));
    _stopWatchTimer.secondTime.listen((value) => print('secondTime $value'));
    _stopWatchTimer.records.listen((value) => print('records $value'));

    /// Can be set preset time. This case is "00:01.23".
    // _stopWatchTimer.setPresetTime(mSec: 1234);
  }

  saveTime() async {
    //Insert
    prefs = await SharedPreferences.getInstance();
    prefs.setInt('time', DateTime.now().millisecondsSinceEpoch);
  }

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

    print('CHECK_TIME: $a');

    if(a == 0){

    } else {
      _stopWatchTimer.setPresetSecondTime(a);
      _stopWatchTimer.onExecute.add(StopWatchExecute.start);
    }

  }

  @override
  void dispose() async {
    super.dispose();
    await _stopWatchTimer.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    print('Current state = $state');
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              /// Display stop watch time
              Padding(
                padding: const EdgeInsets.only(bottom: 0),
                child: StreamBuilder<int>(
                  stream: _stopWatchTimer.rawTime,
                  initialData: _stopWatchTimer.rawTime.value,
                  builder: (context, snap) {
                    final value = snap.data;
                    final displayTime =
                        StopWatchTimer.getDisplayTime(value!, milliSecond: false);
                    return Column(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(8),
                          child: Text(
                            displayTime,
                            style: const TextStyle(
                                fontSize: 40,
                                fontFamily: 'Helvetica',
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),

              /// Button
              Padding(
                padding: const EdgeInsets.all(2),
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(bottom: 0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 4),
                            child: ElevatedButton(
                              onPressed: () async {
                                _stopWatchTimer.onExecute
                                    .add(StopWatchExecute.start);
                                saveTime();
                              },
                              child: const Text(
                                'Start',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 4),
                            child: ElevatedButton(
                              onPressed: () async {
                                _stopWatchTimer.onExecute
                                    .add(StopWatchExecute.stop);
                                prefs.remove('time');
                              },
                              child: const Text(
                                'Stop',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 4),
                            child: ElevatedButton(
                              onPressed: () async {
                                _stopWatchTimer.onExecute
                                    .add(StopWatchExecute.reset);
                              },
                              child: const Text(
                                'Reset',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
