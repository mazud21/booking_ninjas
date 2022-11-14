import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Declinetask extends StatefulWidget {

  @override
  _DeclinetaskState createState() => _DeclinetaskState();
}

class _DeclinetaskState extends State<Declinetask> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: ListView(
          children: [
            Text('Not my speciality'),
            Text('Don\'t have enough time'),
            Text('It\'s too far from me'),
            Text('Other'),
          ],
        ),
      ),
    );
  }
}
