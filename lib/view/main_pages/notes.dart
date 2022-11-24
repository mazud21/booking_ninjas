import 'package:booking_ninjas/theme/colors_texts_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Notes extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          // Add your onPressed code here!
        },
        label: const Text('New note'),
        icon: const Icon(Icons.add),
        backgroundColor: Colors.blue,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8)
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(16),
        child: Column(
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
              height: Get.height*0.65,
                child: ListNotes()
            )
          ],
        ),
      ),
    );
  }
}

class ListNotes extends StatefulWidget {
  @override
  State<ListNotes> createState() => _ListNotesState();
}

class _ListNotesState extends State<ListNotes> {
  bool all = true, sharedWithMe = false, iShared = false;
  int groupValueNotes = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: Get.height * 0.05,
            child: CupertinoSlidingSegmentedControl<int>(
              thumbColor: CupertinoColors.white,
              groupValue: groupValueNotes,
              children: {
                0: Text('All'),
                1: Text('Shared with me'),
                2: Text('I shared'),
              },
              onValueChanged: (value) {
                setState(() {
                  groupValueNotes = value!;
                });
              },
            ),
          ),
          SizedBox(
            height: Get.height * 0.5,
            child: Padding(
              padding: EdgeInsets.only(top: 50),
              child: groupValueNotes == 0
                  ? ListAllNotes()
                  : groupValueNotes == 1
                      ? ListSharedWithMe()
                      : ListIShared(),
            ),
          )
        ],
      ),
    );
  }
}

class EmptyNotes extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset('assets/images/notes.png'),
        Text(
          'All your personal and shared notes will be displayed here',
          style: TextCustom().textFootnote(PalletColors.text_soft_grey),
        )
      ],
    );
  }
}

class ListAllNotes extends StatefulWidget {
  @override
  State<ListAllNotes> createState() => _ListAllNotesState();
}

class _ListAllNotesState extends State<ListAllNotes> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: 3,
        itemBuilder: (context, index) {
          return Card(
            child: Text('All'),
          );
        },
      ),
    );
  }
}

class ListSharedWithMe extends StatefulWidget {
  const ListSharedWithMe({Key? key}) : super(key: key);

  @override
  State<ListSharedWithMe> createState() => _ListSharedWithMeState();
}

class _ListSharedWithMeState extends State<ListSharedWithMe> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: 3,
        itemBuilder: (context, index) {
          return Card(
            child: Text('Shared with me'),
          );
        },
      ),
    );
  }
}

class ListIShared extends StatefulWidget {
  const ListIShared({Key? key}) : super(key: key);

  @override
  State<ListIShared> createState() => _ListISharedState();
}

class _ListISharedState extends State<ListIShared> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: 3,
        itemBuilder: (context, index) {
          return Card(
            child: Text('I Shared'),
          );
        },
      ),
    );
  }
}
