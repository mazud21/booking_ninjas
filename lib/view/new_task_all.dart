import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NewTaskAll extends StatefulWidget {

  @override
  _NewTaskAllState createState() => _NewTaskAllState();
}

class _NewTaskAllState extends State<NewTaskAll> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Text('Back'),
        title: Text('New Task'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: ListView.builder(
          itemCount: 4,
          itemBuilder: (context, index) {
            return Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8)
              ),
              child: Padding(
                padding: EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 16,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Image.asset('asset/images/broom.png'),
                        Flexible(child: Text('Clean room, replace linen, Clean room, replace linen')),
                      ],
                    ),
                    ListTile(
                      leading: ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child: Container(
                            padding: EdgeInsets.all(8),
                            color: Colors.blue,
                            child: Icon(Icons.vpn_key, color: Colors.white,)),
                      ),
                      title: Text('Room 326'),
                      subtitle: Text('Floor 3, Building 8'),
                      //dense: true,
                    ),
                    Divider(
                      height: 0.1,
                      color: Color.fromRGBO(205, 205, 205, 1.0),
                    ),
                    Text('Est. time 30 min'),
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
                                      primary: Colors.green,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(16),
                                      ),
                                    ),
                                    onPressed: () => /*Get.to(Login())*/null,
                                    child: Text('Accept')
                                ),
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width*0.25,
                                height: MediaQuery.of(context).size.height*0.05,
                                child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      primary: Colors.red,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(16),
                                      ),
                                    ),
                                    onPressed: () => /*Get.to(Login())*/null,
                                    child: Text('Decline')
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
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
        ),
      ),
    );
  }
}
