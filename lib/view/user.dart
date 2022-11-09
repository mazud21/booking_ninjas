
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/data_controller.dart';

class User extends GetView<DataController>{

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(),
      body: controller.obx((data) {
        return Center(
          child: ListView.builder(
            itemCount: data!.length,
              itemBuilder: (context, index) {
                return Card(
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage(
                      data![index]['picture']['thumbnail']
                      ),
                    ),
                    title: Text('${data[index]['name']['first']} ${data[index]['name']['first']}'),
                    subtitle: Text(data[index]['email']),
                  ),
                );
              },
          ),
        );
      }),
    );
  }

}