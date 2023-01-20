import 'package:booking_ninjas/widgets/appbar_custom.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../network/fetch_data.dart';
import '../theme/colors_texts_widget.dart';

class NewTaskAll extends StatefulWidget {

  @override
  _NewTaskAllState createState() => _NewTaskAllState();
}

class _NewTaskAllState extends State<NewTaskAll> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarCustom().getCupertinoNavBar('New tasks'),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Container(
          child: FutureBuilder(
            future: Provider.of<FetchData>(context, listen: true).getListTaskConfirm(),
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
                    itemCount: data.dataTaskConfirm.length,
                    itemBuilder: (context, index) {

                      var compressCall = data.dataTaskConfirm[index];

                      return Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8)
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Padding(
                                      padding: const EdgeInsets.only(right: 16),
                                      child: Image.asset('assets/images/broom.png')),
                                  Flexible(
                                      child: Text(
                                        '${compressCall.cleaningTask}',
                                        style: TextCustom().textText(PalletColors.text_black),
                                      )),
                                ],
                              ),
                              ListTile(
                                leading: ClipRRect(
                                  borderRadius: BorderRadius.circular(100),
                                  child: Container(
                                      padding: const EdgeInsets.all(8),
                                      color: Colors.blue,
                                      child: Icon(
                                        Icons.vpn_key,
                                        color: Colors.white,
                                        size: Get.width * 0.05,
                                      )),
                                ),
                                title: Text('${compressCall.roomUnitNumber}'),
                                subtitle: Text('Floor ${compressCall.roomUnitFloor}, Building ${compressCall.roomUnitPropertyName}'),
                                //dense: true,
                              ),
                              const Divider(
                                height: 0.1,
                                color: Color.fromRGBO(205, 205, 205, 1.0),
                              ),
                              Padding(
                                  padding: const EdgeInsets.fromLTRB(32, 8, 0, 16),
                                  child: Text(
                                    'Est. time 30 min',
                                    style: TextCustom()
                                        .textFootnote(PalletColors.text_soft_grey),
                                  )),
                              ListTile(
                                //onTap: () => null,
                                //subtitle: Text('Room 475, Floor 4, Building 8'),
                                subtitle: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                          width: MediaQuery.of(context).size.width*0.25,
                                          height: MediaQuery.of(context).size.height*0.05,
                                          child: ElevatedButton(
                                              style: ElevatedButton.styleFrom(
                                                backgroundColor: Colors.green,
                                                shape: RoundedRectangleBorder(
                                                  borderRadius: BorderRadius.circular(16),
                                                ),
                                              ),
                                              onPressed: () => /*Get.to(Login())*/null,
                                              child: const Text('Accept')
                                          ),
                                        ),
                                        SizedBox(
                                          width: MediaQuery.of(context).size.width*0.25,
                                          height: MediaQuery.of(context).size.height*0.05,
                                          child: ElevatedButton(
                                              style: ElevatedButton.styleFrom(
                                                backgroundColor: Colors.red,
                                                shape: RoundedRectangleBorder(
                                                  borderRadius: BorderRadius.circular(16),
                                                ),
                                              ),
                                              onPressed: () => /*Get.to(Login())*/null,
                                              child: const Text('Decline')
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 8,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
