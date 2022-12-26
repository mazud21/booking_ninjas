import 'dart:developer';

import 'package:booking_ninjas/theme/colors_texts_widget.dart';
import 'package:booking_ninjas/widgets/appbar_custom.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class History extends StatefulWidget {
  @override
  State<History> createState() => _HistoryState();
}

class _HistoryState extends State<History> {
  late List<String> listFilters = ['Room 102','Twin', 'Cleaning', 'Floor 4', 'Last week'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
        child: ListView(
          scrollDirection: Axis.vertical,
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
              height: Get.height * 0.05,
              child: Row(
                children: <Widget>[
                  SizedBox(
                    width: Get.width * 0.2,
                    child: Container(
                      margin: const EdgeInsets.only(right: 8),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: PalletColors.chip_soft_blue,
                      ),
                      child: InkWell(
                        onTap: () => bsFilterSearch(context),
                        child: const Padding(
                            padding: EdgeInsets.all(8),
                            child: Icon(CupertinoIcons.slider_horizontal_3)),
                      ),
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
                    height: Get.height * 0.07,
                    width: Get.width * 0.7,
                    child: ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: listFilters.length,
                      itemBuilder: (context, index) {
                        if (listFilters.isEmpty) {
                          return const SizedBox();
                        } else {
                          return Container(
                            margin: const EdgeInsets.only(right: 8),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: PalletColors.chip_soft_blue,
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8),
                              child: Row(
                                children: [
                                  InkWell(
                                    onTap: () {
                                      setState(() {
                                        listFilters.removeAt(index);
                                      });
                                    },
                                    child: const Padding(
                                      padding: EdgeInsets.fromLTRB(4, 0, 8, 0),
                                        child: Icon(CupertinoIcons.clear_circled, size: 16,)),
                                  ),
                                  Text(listFilters[index], style: TextCustom().textFootnote(PalletColors.text_blue),)
                                ],
                              ),
                            ),
                          );
                        }
                      },
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            SizedBox(
              height: Get.height * 0.75,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 100),
                child: ListView.builder(
                  itemCount: 7,
                  itemBuilder: (context, index) {
                    return Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16)),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(16, 8, 16, 0),
                            child: Row(
                              children: [
                                const Text(
                                  'July 22, 2022, 06:30 AM',
                                  style: TextStyle(color: Colors.grey),
                                ),
                                const Spacer(),
                                Chip(
                                    backgroundColor: PalletColors.chip_green,
                                    label: Text(
                                      'Completed',
                                      style: TextCustom().textFootnote(
                                          PalletColors.text_white),
                                    ))
                              ],
                            ),
                          ),
                          ExpansionTile(
                            title: Row(
                              children: [
                                Image.asset('assets/images/broom.png'),
                                const SizedBox(
                                  width: 16,
                                ),
                                const Text('Clean room, replace linen')
                              ],
                            ),
                            children: <Widget>[
                              ListTile(
                                leading: ClipRRect(
                                  borderRadius: BorderRadius.circular(100),
                                  child: Container(
                                      padding: const EdgeInsets.all(8),
                                      color: Colors.blue,
                                      child: const Icon(
                                        Icons.location_pin,
                                        color: Colors.white,
                                      )),
                                ),
                                title: const Text(
                                  'Room 326',
                                ),
                                subtitle: const Text('Floor 3, Building 8'),
                                //dense: true,
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(16, 0, 0, 16),
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          16, 8, 16, 8),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: const [
                                          Text('Assigned by'),
                                          Text('Supervisor 1')
                                        ],
                                      ),
                                    ),
                                    const Padding(
                                      padding: EdgeInsets.only(left: 8),
                                      child: Divider(
                                        height: 0.1,
                                        thickness: 0.5,
                                        color: Colors.grey,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          16, 8, 16, 8),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: const [
                                          Text('Completion'),
                                          Text('30 min')
                                        ],
                                      ),
                                    ),
                                    const Padding(
                                      padding: EdgeInsets.only(left: 8),
                                      child: Divider(
                                        height: 0.1,
                                        thickness: 0.5,
                                        color: Colors.grey,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          16, 8, 16, 8),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: const [
                                          Text('Task completed'),
                                          Text('2/2')
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    );
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  bsFilterSearch(BuildContext context) {
    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(20),
          ),
        ),
        builder: (context) {
          return FractionallySizedBox(
            heightFactor: 0.9,
            child: FilterSearch(),
          );
        });
  }
}

class FilterSearch extends StatefulWidget {
  @override
  _FilterSearchState createState() => _FilterSearchState();
}

class _FilterSearchState extends State<FilterSearch> {
  final DateRangePickerController _controller = DateRangePickerController();
  String _selectedDate =
      DateFormat('MMMM dd, yyyy').format(DateTime.now()).toString();

  bool _visibleDate = false;

  late List<String> listFilters = [];

  void _onSelectionChanged(DateRangePickerSelectionChangedArgs args) {
    // TODO: implement your code here

    setState(() {
      _selectedDate = DateFormat('MMMM dd, yyyy').format(args.value).toString();
    });

    log('GET_DATE: ${_selectedDate.toString()}');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CupertinoNavigationBar(
          backgroundColor: PalletColors.btn_soft_grey,
          leading: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              TextButton(
                  onPressed: () {},
                  child: const Text(
                    'Clear',
                    style: TextStyle(color: PalletColors.text_blue),
                  ))
            ],
          ),
          middle: const Text('Filters'),
          trailing: TextButton(
              onPressed: () {},
              child: const Text('Done',
                  style: TextStyle(color: PalletColors.text_blue))),
          border: Border.all(width: 0.5, color: PalletColors.text_soft_grey),
        ),
        body: ListView(
          children: [
            Card(
              elevation: 8,
              margin: const EdgeInsets.all(16),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(16, 8, 0, 8),
                child: ListView(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  children: const [
                    TextIcon(
                      text1: 'Room number',
                      text2: 'Room 362',
                      value: 'room_number',
                    ),
                    TextIcon(
                      text1: 'Room type',
                      text2: 'Business Suite',
                      value: 'room_type',
                    ),
                    TextIcon(
                      text1: 'Building',
                      text2: 'Select',
                      value: 'building',
                    ),
                    TextIcon(
                      text1: 'Floor',
                      text2: 'Floor 3',
                      value: 'floor',
                    ),
                  ],
                ),
              ),
            ),
            Card(
              elevation: 8,
              margin: const EdgeInsets.all(16),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(16, 8, 0, 8),
                child: ListView(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  children: const [
                    TextIcon(
                      text1: 'Task',
                      text2: 'Cleaning',
                      value: 'task',
                    ),
                    TextIcon(
                      text1: 'Assigned by',
                      text2: 'Supervisor 1',
                      value: 'assigned',
                    ),
                  ],
                ),
              ),
            ),
            Card(
              elevation: 8,
              margin: const EdgeInsets.all(16),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(16, 8, 0, 8),
                child: ListView(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  children: [
                    const Text('Date', style: TextStyle(fontWeight: FontWeight.bold),),
                    const TextIcon(
                      text1: 'Period',
                      text2: 'Last week',
                      value: 'period',
                    ),
                    InkWell(
                        onTap: () {
                          setState(() {
                            _visibleDate = !_visibleDate;
                          });
                        },
                        child: TextIcon(
                          text1: 'Custom',
                          text2: _selectedDate,
                          value: 'date',
                        )),
                    Visibility(
                      visible: _visibleDate,
                      child: SfDateRangePicker(
                        view: DateRangePickerView.month,
                        initialSelectedDate: DateTime.now(),
                        showTodayButton: false,
                        controller: _controller,
                        maxDate: DateTime.now(),
                        showNavigationArrow: true,
                        allowViewNavigation: true,
                        selectionColor: PalletColors.text_red,
                        todayHighlightColor: PalletColors.text_red,
                        onSelectionChanged: _onSelectionChanged,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ));
  }
}

class TextIcon extends StatefulWidget {
  final text1, text2, value;

  const TextIcon({required this.text1, required this.text2, required this.value});

  @override
  State<TextIcon> createState() => _TextIconState();
}

class _TextIconState extends State<TextIcon> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  loadSaveLocal() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var cv = prefs.getString('room_number');

    return cv;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(8, 8, 0, 8),
          child: Row(
            children: [
              Text(widget.text1),
              const Spacer(),
              SizedBox(
                child: Row(
                  children: [
                    widget.value == 'date'
                        ? Container(
                            padding: const EdgeInsets.all(6),
                            decoration: BoxDecoration(
                                color: PalletColors.btn_soft_grey,
                                borderRadius: BorderRadius.circular(8)),
                            child: Text(widget.text2),
                          )
                        : TextButton(
                            onPressed: () {

                              switch (widget.value) {
                                case 'room_number':
                                  bsShowRoom(context);
                                  break;
                                case 'room_type':
                                  bsShowType(context);
                                  break;
                                case 'building':

                                  break;
                                case 'floor':

                                  break;
                                case 'task':

                                  break;
                                case 'assigned':

                                  break;
                                case 'period':

                                  break;
                              }
                            },
                            child: Text(widget.text2)),
                    const Icon(Icons.chevron_right_rounded)
                  ],
                ),
              ),
            ],
          ),
        ),
        const Divider(
          height: 0.1,
          color: Colors.grey,
        ),
      ],
    );
  }

  bsShowRoom(BuildContext context) {
    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        barrierColor: Colors.transparent,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(20),
          ),
        ),
        builder: (context) {
          return FractionallySizedBox(
            heightFactor: 0.9,
            child: RoomNumber(),
          );
        });
  }

  bsShowType(BuildContext context) {
    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        barrierColor: Colors.transparent,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(20),
          ),
        ),
        builder: (context) {
          return FractionallySizedBox(
            heightFactor: 0.9,
            child: RoomType(),
          );
        });
  }
}

class RoomNumber extends StatefulWidget {
  @override
  State<RoomNumber> createState() => _RoomNumberState();
}

class _RoomNumberState extends State<RoomNumber> {

  late int value = 0;
  List<String> listRoomNumber = ['Room 101','Room 102','Room 103','Room 104','Room 105','Room 106','Room 107','Room 108','Room 109','Room 110','Room 111','Room 112'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarCustom().getCupertinoNavBar('Rooom number'),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(8, 0, 0, 0),
        child: ListView.builder(
          itemCount: listRoomNumber.length,
          itemBuilder: (context, index) {
            return RadioListTile(
              value: index,
              groupValue: value,
              controlAffinity: ListTileControlAffinity.trailing,
              shape: const Border(
                bottom: BorderSide(
                  
                  color: PalletColors.text_soft_grey
                ),
              ),
              onChanged: (valueSelect) async {
                setState(() {
                  value = valueSelect!;
                });

                SharedPreferences prefs = await SharedPreferences.getInstance();
                prefs.setString('room_number', listRoomNumber[index]);
                var cv = prefs.getString('room_number');

                log('CHECK_GET $cv');
              },
              title: Text(listRoomNumber[index]),
            );
          },
        ),
      ),
    );
  }
}

class RoomType extends StatefulWidget {
  @override
  State<RoomType> createState() => _RoomTypeState();
}

class _RoomTypeState extends State<RoomType> {
  late int value = 0;

  List<String> listRoomtType = ['Single','Twin','Double','Triple','Quad','King','Queen','Suite','Business Suite','Studio','Deluxe','Penthouse'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarCustom().getCupertinoNavBar('Rooom type'),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(8, 0, 0, 0),
        child: ListView.builder(
          itemCount: listRoomtType.length,
          itemBuilder: (context, index) {
            return RadioListTile(
              value: index,
              groupValue: value,
              controlAffinity: ListTileControlAffinity.trailing,
              shape: const Border(
                bottom: BorderSide(

                    color: PalletColors.text_soft_grey
                ),
              ),
              onChanged: (valueSelect) {
                setState(() {
                  value = valueSelect!;
                });
                log('CHECK_VALUE $value ${listRoomtType[index]}');
              },
              title: Text(listRoomtType[index]),
            );
          },
        ),
      ),
    );
  }
}
