import 'package:booking_ninjas/theme/colors_texts_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_share/flutter_share.dart';
import 'package:get/get.dart';

class Notes extends StatefulWidget {

  @override
  _NotesState createState() => _NotesState();
}

class _NotesState extends State<Notes> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /*floatingActionButton: FloatingActionButton.extended(
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
      ),*/
      resizeToAvoidBottomInset: false,
      body: Container(
        padding: const EdgeInsets.all(16),

        child: Stack(
          children: [
            Column(
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
                const SizedBox(
                  height: 16,
                ),
                SizedBox(
                    height: Get.height*0.67,
                    child: ListNotes()
                )
              ],
            ),
            Container(
              color: const Color(0x7EFFFFFF).withOpacity(0.8),
              child: Center(
                child: Text('Coming Soon...', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> bsAddNote(BuildContext context) async {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            title: Row(
              children: [
                const Spacer(),
                const Text('New note', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
                const Spacer(),
                InkWell(
                  onTap: () => Get.back(),
                    child: const Icon(Icons.close))
              ],
            ),
            content: AddNote()
        );
      },
    );
  }
}


class AddNote extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        TextFormField(
          maxLines: 10,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(),
            ),
          ),
        ),
        const SizedBox(
          height: 16,
        ),
        SizedBox(
          width: 150,
          child: ElevatedButton(
            style: ButtonCustom().elevatedGreen(),
              onPressed: () {
                Get.snackbar(
                  'Information',
                  "Your note has been created",
                  colorText: PalletColors.text_white,
                  backgroundColor: PalletColors.chip_green,
                  icon: const Icon(Icons.add_alert),

                );
              },
              child: const Text('Save', style: TextStyle(color: PalletColors.text_white, fontWeight: FontWeight.bold))
          ),
        )
      ],
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
        const Text(
          'All your personal and shared notes will be displayed here',
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

  int value = 0;

  final List listNote = [
    {
      'title': 'General Clean',
      'body': 'Domestic cleaning is a popular clean of people’s homes, often every week or fortnight. It includes basic dusting of all surfaces and items, including hidden parts like ceilings and skirting boards, and then floor cleaning through the vacuum cleaner or mopping.',
      'date': 'November 28, 2022',
    },
    {
      'title': 'Commercial Clean',
      'body': 'This can include the main desk areas and careful dusting, wiping, and floor cleaning, in addition to ancillary areas such as the kitchen area and dishwashing, and any toilet areas. Care is needed with any workers still making phone calls and Data Protection issues regarding documents and data.',
      'date': 'October 05, 2022',
    },
    {
      'title': 'Mini Clean',
      'body': 'A Mini Clean is a phrase we have come up with ourselves, mainly to encourage others to be involved with cleaning. It stemmed from working with a charity that had numerous volunteers, the idea being that after each activity each volunteer leader would carry out a very basic ‘mini clean’ themselves such as clearing away any mess, emptying bins, and a quick wipe of surfaces.',
      'date': 'December 15, 2022',
    },
    {
      'title': 'General Clean',
      'body': 'Domestic cleaning is a popular clean of people’s homes, often every week or fortnight. It includes basic dusting of all surfaces and items, including hidden parts like ceilings and skirting boards, and then floor cleaning through the vacuum cleaner or mopping.',
      'date': 'November 28, 2022',
    },
    {
      'title': 'Commercial Clean',
      'body': 'This can include the main desk areas and careful dusting, wiping, and floor cleaning, in addition to ancillary areas such as the kitchen area and dishwashing, and any toilet areas. Care is needed with any workers still making phone calls and Data Protection issues regarding documents and data.',
      'date': 'October 05, 2022',
    },
    {
      'title': 'Mini Clean',
      'body': 'A Mini Clean is a phrase we have come up with ourselves, mainly to encourage others to be involved with cleaning. It stemmed from working with a charity that had numerous volunteers, the idea being that after each activity each volunteer leader would carry out a very basic ‘mini clean’ themselves such as clearing away any mess, emptying bins, and a quick wipe of surfaces.',
      'date': 'December 15, 2022',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: listNote.length,
        itemBuilder: (context, index) {
          return Card(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('${listNote[index]['date']}, 06:30 AM'),
                  Row(
                    children: [
                      Radio(
                        value: index,
                        groupValue: value,
                        onChanged: (valueSelect) {
                          setState(() {
                            value = valueSelect!;
                            bsShareNotes(context, index);
                          });
                        },
                      ),
                      Text('${listNote[index]['title']}'),
                    ],
                  ),
                  Text('${listNote[index]['body']}'),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  bsShareNotes(BuildContext context, int i) {
    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(20),
          ),
        ),
        builder: (context) {
          return FractionallySizedBox(
            heightFactor: 0.1,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                InkWell(
                    onTap: () => share(),
                    child: const Text('Share', style: TextStyle(color: Colors.blue),)),
                const Text('Mark as Done', style: TextStyle(color: Colors.blue),),
                InkWell(
                    onTap: () {
                      setState(() {
                        _showAlertDialog(context, i);

                      });
                    },
                    child: const Text('Delete', style: TextStyle(color: Colors.blue),
                    )
                ),
              ],
            ),
          );
        });
  }

  void _showAlertDialog(BuildContext context, int i) {
    showCupertinoModalPopup<void>(
      context: context,
      builder: (BuildContext context) => CupertinoAlertDialog(
        title: const Text('Alert'),
        content: const Text('Proceed with destructive action?'),
        actions: <CupertinoDialogAction>[
          CupertinoDialogAction(
            isDefaultAction: true,
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('No'),
          ),
          CupertinoDialogAction(
            isDestructiveAction: true,
            onPressed: () {
              Navigator.pop(context);
              setState(() {
                listNote.removeAt(i);
              });

            },
            child: const Text('Yes'),
          ),
        ],
      ),
    );
  }


  Future<void> share() async {
    await FlutterShare.share(
        title: 'Example share',
        text: 'Example share text',
        linkUrl: 'https://flutter.dev/',
        chooserTitle: 'Example Chooser Title');
  }

}

class ShareNotes extends StatefulWidget {



  @override
  _ShareNotesState createState() => _ShareNotesState();
}

class _ShareNotesState extends State<ShareNotes> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        InkWell(
            onTap: () => share(),
            child: const Text('Share', style: TextStyle(color: Colors.blue),)),
        const Text('Mark as Done', style: TextStyle(color: Colors.blue),),
        const Text('Delete', style: TextStyle(color: Colors.blue),),
      ],
    );
  }

  Future<void> share() async {
    await FlutterShare.share(
        title: 'Example share',
        text: 'Example share text',
        linkUrl: 'https://flutter.dev/',
        chooserTitle: 'Example Chooser Title');
  }

}