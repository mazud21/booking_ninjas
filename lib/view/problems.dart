import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Problems extends StatefulWidget {

  @override
  _ProblemsState createState() => _ProblemsState();
}

class _ProblemsState extends State<Problems> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Text('Task'),
        title: Text('Problems'),
        actions: [
          Text('Save')
        ],
      ),
      body: ListView.builder(
          itemCount: 3,
          itemBuilder: (context, index) {
            return cardProblem;
          },
      ),
    );
  }

  Widget cardProblem = Card(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(16)
    ),
    child: Padding(
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text('July 21, 2022, 08:00 AM'),
              Spacer(),
              Icon(Icons.close,color: Colors.red,)
            ],
          ),
          Row(
            children: [
              Icon(CupertinoIcons.wrench_fill),
              Text('Sink is Broken', style: TextStyle(fontSize: 26),
              ),
            ],
          ),
          Text('Bathroom'),
          Row(
            children: [
              Image.network('https://icety.org/media/0b2fe56d-a690-48e3-a241-be496662624d/modern-bathroom-2.jpg', width: 75,),
              Image.network('https://icety.org/media/0b2fe56d-a690-48e3-a241-be496662624d/modern-bathroom-2.jpg', width: 75,),
              Image.network('https://icety.org/media/0b2fe56d-a690-48e3-a241-be496662624d/modern-bathroom-2.jpg', width: 75,)
            ],
          )
        ],
      ),
    ),
  );

}
