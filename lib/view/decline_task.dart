import 'package:booking_ninjas/theme/colors_texts_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Declinetask extends StatefulWidget {
  @override
  _DeclinetaskState createState() => _DeclinetaskState();
}

class _DeclinetaskState extends State<Declinetask> {

  late String _title;
  late bool _checked0 = false, _checked1 = false, _checked2 = false, _checked3 = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        CheckboxListTile(
          value: _checked0,
          onChanged: (bool? value) {
            setState(() {
              _checked0 = value!;
            });
            _title = 'Not my speciality';
          },
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10)),
          side: const BorderSide(
            color: Colors.transparent, //your desire colour here
          ),
          title: const Text('Not my speciality'),
        ),
        CheckboxListTile(
          value: _checked1,
          onChanged: (bool? value) {
            setState(() {
              _checked1 = value!;
            });
            _title = 'Don\'t have enough time';
          },
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10)),
          side: const BorderSide(
            color: Colors.transparent, //your desire colour here
          ),
          title: const Text('Don\'t have enough time'),
        ),
        CheckboxListTile(
          value: _checked2,
          onChanged: (bool? value) {
            setState(() {
              _checked2 = value!;
            });
            _title = 'It\'s too far from me';
          },
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10)),
          side: const BorderSide(
            color: Colors.transparent, //your desire colour here
          ),
          title: const Text('It\'s too far from me'),
        ),
        CheckboxListTile(
          value: _checked3,
          onChanged: (bool? value) {
            setState(() {
              _checked3 = value!;
            });
            _title = 'Other';
          },
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10)),
          side: const BorderSide(
            color: Colors.transparent, //your desire colour here
          ),
          title: const Text('Other'),
        ),
        const SizedBox(
          height: 16,
        ),
        ElevatedButton(
          style: ButtonCustom().elevatedRedSoft(),
          onPressed: () => Get.back(),
          child: Text('Cancel', style: TextCustom().textButton(PalletColors.text_red)),
        )
      ],
    );
  }
}
