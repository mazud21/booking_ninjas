import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class History extends StatefulWidget {
  @override
  State<History> createState() => _HistoryState();
}

class _HistoryState extends State<History> {
  Widget myAppBarIcon() {
    return Container(
      width: 30,
      height: 30,
      child: Stack(
        children: [
          Icon(
            Icons.notifications,
            color: Colors.black,
            size: 30,
          ),
          Container(
            width: 30,
            height: 30,
            alignment: Alignment.topRight,
            margin: EdgeInsets.only(top: 5),
            child: Container(
              width: 15,
              height: 15,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color(0xffc32c37),
                  border: Border.all(color: Colors.white, width: 1)),
              child: Padding(
                padding: const EdgeInsets.all(0.0),
                child: Center(
                  child: Text(
                    /*_counter.toString()*/
                    '1',
                    style: TextStyle(fontSize: 10),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(CupertinoIcons.bars, color: Colors.black45),
        title: Text(
          'History',
          style: TextStyle(fontWeight: FontWeight.w500, color: Colors.black45),
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
        actions: [myAppBarIcon()],
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: ListView(
          children: [
            TextFormField(
                decoration: InputDecoration(
                    labelText: "Search",
                    //fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: BorderSide(color: Colors.white10),
                    ),
                    prefixIcon: Icon(Icons.search),
                    suffixIcon: InkWell(
                      onTap: () => '',
                      child: Icon(Icons.mic),
                    ))),
            SizedBox(
              height: 16,
            ),
            SizedBox(
              height: Get.height * 0.07,
              child: Row(
                children: <Widget>[
                  SizedBox(
                    width: Get.width * 0.2,
                    child: Chip(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8)
                      ),
                      backgroundColor: Colors.blue,
                      label: Icon(Icons.home),
                      padding: EdgeInsets.all(8),
                    ),
                    /*Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.blue,
                      ),
                      child: Padding(
                          padding: EdgeInsets.all(8),
                          child: Icon(CupertinoIcons.slider_horizontal_3)),
                    ),*/
                  ),
                  SizedBox(
                    width: Get.width * 0.7,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 5,
                      itemBuilder: (context, index) {
                        return Container(
                          margin: EdgeInsets.all(4),
                          child: Chip(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8)
                            ),
                            avatar: InkWell(
                              onTap: () => null,
                              child: Icon(Icons.close),
                            ),
                            backgroundColor: Colors.blue,
                            label: Text('data '),
                            padding: EdgeInsets.all(8),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
