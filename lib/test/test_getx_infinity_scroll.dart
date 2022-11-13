import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyHomePage extends StatelessWidget {
  String title;

  MyHomePage({
    required this.title,
  });

  HomePageController homePageController = Get.put(HomePageController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: GetBuilder(
        init: homePageController,
        builder: (value) => ListView.builder(
          controller: value.controller,
          itemCount: value.list.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                color: Colors.red,
                height: 100,
                child: Center(
                  child: Text(value.list[index].name),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class Model {
  String name;

  Model({
    required this.name,
  });
}

class HomePageController extends GetxController {
  List<Model> list = [];
  ScrollController controller = ScrollController();
  int listLength = 6;

  void onInit() {
    generateList();
    addItems();
    super.onInit();
  }

  addItems() async {
    controller.addListener(() {
      if (controller.position.maxScrollExtent == controller.position.pixels) {
        for (int i = 0; i < 2; i++) {
          listLength++;
          list.add(Model(name: (listLength).toString()));
          update();
        }
      }
    });
  }

  generateList() {
    list = List.generate(
        listLength, (index) => Model(name: (index + 1).toString()));
  }
}