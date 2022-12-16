import 'package:booking_ninjas/theme/colors_texts_widget.dart';
import 'package:booking_ninjas/view/splashscreen.dart';
import 'package:booking_ninjas/widgets/appbar_custom.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Profile extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: EdgeInsets.all(16),
      child: ListView(
        children: [
          Row(
            children: [
              SizedBox.fromSize(
                size: Size.fromRadius(50),
                child: Stack(
                  children: [
                    ClipOval(
                      child: SizedBox.fromSize(
                        size: Size.fromRadius(50), // Image radius
                        child: Image.network(
                            'https://images.unsplash.com/photo-1438761681033-6461ffad8d80?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1470&q=80',
                            fit: BoxFit.cover),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: 8),
                      child: Align(
                          alignment: Alignment.bottomCenter,
                          child: Icon(
                            Icons.camera_alt_rounded,
                            color: PalletColors.btn_deep_blue,
                          )),
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: 16,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Anna K.',
                    style: TextCustom().heading1(),
                  ),
                  Text(
                    'email@gmail.com',
                    style:
                        TextCustom().textFootnote(PalletColors.text_soft_grey),
                  )
                ],
              ),
            ],
          ),
          SizedBox(
            height: 16,
          ),
          Text(
            'Current level',
            style: TextCustom()
                .textFootnote(PalletColors.text_soft_grey),
          ),
          Text(
            'Silver',
            style: TextCustom()
                .heading1(),
          ),
          CircularPercentIndicator(
            radius: 60,
            lineWidth: 13.0,
            animation: true,
            percent: 0.7,
            center: new Text(
              "75%",
              style:
              new TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
            ),
            footer: SizedBox(
              height: 24,
            ),
            circularStrokeCap: CircularStrokeCap.round,
            progressColor: PalletColors.btn_deep_blue,
          ),
          Card(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            elevation: 0,
            child: Padding(
              padding: EdgeInsets.all(16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Tasks Completed',
                        style: TextCustom()
                            .textFootnote(PalletColors.text_soft_grey),
                      ),
                      Text('135/150', style: TextCustom().heading1()),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Avg. time',
                        style: TextCustom()
                            .textFootnote(PalletColors.text_soft_grey),
                      ),
                      Text('15m30s', style: TextCustom().heading1()),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Rating',
                        style: TextCustom()
                            .textFootnote(PalletColors.text_soft_grey),
                      ),
                      Text('5.0', style: TextCustom().heading1()),
                    ],
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 16,
          ),
          Padding(
              padding: EdgeInsets.only(left: 16),
              child: Text(
                'SKILLS',
                style: TextCustom().textFootnote(PalletColors.text_soft_grey),
              )),
          SizedBox(
            height: 16,
          ),
          Card(
            elevation: 0,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            child: Column(
              children: [
                ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: 2,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.fromLTRB(16, 8, 0, 8),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Cleaning',
                            style: TextCustom().textText(PalletColors.text_black),
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Divider(
                            height: 0.1,
                            color: PalletColors.text_soft_grey,
                          ),
                        ],
                      ),
                    );
                  },
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(16, 8, 0, 16),
                  child: InkWell(
                    onTap: () => bsAddSkill(context),
                    child: Row(
                      children: [
                        Icon(Icons.add_box_outlined, color: PalletColors.btn_deep_blue,),
                        SizedBox(
                          width: 8,
                        ),
                        Text('Add new skill', style: TextCustom().heading2Color(PalletColors.btn_deep_blue),)
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(24, 8, 0, 0),
              child: Text('Your skills help us to select the most appropriate tasks for you.', style: TextCustom().textMenu(),)),
          SizedBox(
            height: 24,
          ),
          Card(
            elevation: 0,
            shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(16, 8, 0, 8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Update email address',
                              style: TextCustom().textText(PalletColors.text_black),
                            ),
                            Icon(Icons.chevron_right, color: PalletColors.text_soft_grey,)
                          ]
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Divider(
                        height: 0.1,
                        color: PalletColors.text_soft_grey,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(16, 8, 0, 8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Change password',
                              style: TextCustom().textText(PalletColors.text_black),
                            ),
                            Icon(Icons.chevron_right, color: PalletColors.text_soft_grey,)
                          ]
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Divider(
                        height: 0.1,
                        color: PalletColors.text_soft_grey,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(16, 8, 0, 8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Help',
                              style: TextCustom().textText(PalletColors.text_black),
                            ),
                            Icon(Icons.chevron_right, color: PalletColors.text_soft_grey,)
                          ]
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Divider(
                        height: 0.1,
                        color: PalletColors.text_soft_grey,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 32,
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(8, 8, 0, 8),
            child: InkWell(
              onTap: () async {
                SharedPreferences preferences = await SharedPreferences.getInstance();
                preferences.remove('session_id');

                Get.offAll(SplashScreen());
              },
              child: Card(
                elevation: 0,
                child: Padding(
                  padding: EdgeInsets.all(8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Log out',
                        style: TextCustom().textText(PalletColors.text_black),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    ));
  }

  bsAddSkill(BuildContext context) {
    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        builder: (context) {
          return FractionallySizedBox(
            heightFactor: 0.9,
            child: AddNewSkill(),
          );
        });
  }
}

class AddNewSkill extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarCustom().getBSAppBarCustom('Add new skill'),
      body: ListView(
        children: [
          Text('General', style: TextCustom().textFootnote(PalletColors.text_soft_grey),),
          Text('Cleaning'),
          Text('Maintenance'),
          Text('Knowledge of cleaning products'),
          Text('Ability to operate cleaning tools', style: TextCustom().textFootnote(PalletColors.text_soft_grey),),
          Text('Steam cleaner'),
          Text('Floor buffer'),
          Text('Steel scrubber'),
          Text('Window and Glass Squeegee'),
          Text('Floor cleaning machine'),
          Text('Other Skills', style: TextCustom().textFootnote(PalletColors.text_soft_grey),),
          Text('Problem solving'),
          Text('Endurance'),
          Text('Attentiveness to detail'),
        ],
      ),
    );
  }
}

