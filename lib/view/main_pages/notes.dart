import 'package:booking_ninjas/theme/colors_texts_widget.dart';
import 'package:booking_ninjas/view/main_pages/tasks.dart';
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
          bsAddNote(context);
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
                      borderSide: const BorderSide(color: Colors.white10),
                    ),
                    prefixIcon: const Icon(Icons.search),
                    suffixIcon: InkWell(
                      onTap: () => '',
                      child: const Icon(Icons.mic),
                    ))),
            SizedBox(
              height: 16,
            ),
            SizedBox(
              height: Get.height*0.67,
                child: ListNotes()
            )
          ],
        ),
      ),
    );
  }

  bsAddNote(BuildContext context){
    AlertDialog(
      title: Stack(
        children: const [
          Positioned(
            top: 16,
              child: Text('New note'),
          ),
          Positioned(
            right: 8,
              top: 8,
              child: Icon(Icons.close)
          )
        ],
      ),
      content: const AddNote(),
    );
  }

}

class AddNote extends StatelessWidget {
  const AddNote({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          TextFormField(
            maxLines: 10,
            style: BorderCustom().outlineForm(),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              shape: ButtonCustom().elevatedGreen()
            ),
              onPressed: () {

              },
              child: const Text('Save')
          )
        ],
      ),
    );
  }
}


class ListNotes extends StatefulWidget {
  @override
  State<ListNotes> createState() => _ListNotesState();
}

class _ListNotesState extends State<ListNotes> {

  @override
  Widget build(BuildContext context) {
    return ListAllNotes();
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

  late int value = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: 6,
        itemBuilder: (context, index) {
          return Card(
            child: Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Nov 22, 2022, 06:30 AM', style: TextCustom().textFootnote(PalletColors.text_soft_grey),),
                  Row(
                    children: [
                      Radio(
                        value: index,
                        groupValue: value,
                        onChanged: (valueSelect) {
                          setState(() {
                            value = valueSelect!;
                          });
                        },
                      ),
                      Text('Sit amet quam vehicula elementum '),
                    ],
                  ),
                  Text('Nulla porttitor accumsan tincidu '),
                  Text('Nulla porttitor accumsan tincidu '),
                  Text('Nulla porttitor accumsan tincidu '),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}