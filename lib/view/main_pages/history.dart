import 'dart:developer';

import 'package:booking_ninjas/theme/colors_texts_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class History extends StatefulWidget {
  @override
  State<History> createState() => _HistoryState();
}

class _HistoryState extends State<History> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(16),
        child: ListView(
          scrollDirection: Axis.vertical,
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
                    child: InkWell(
                      onTap: () => bsFilterSearch(context),
                      child: Chip(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8)),
                        backgroundColor: Colors.blue,
                        label: Icon(Icons.home),
                        padding: EdgeInsets.all(8),
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
                    width: Get.width * 0.7,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 5,
                      itemBuilder: (context, index) {
                        return Container(
                          margin: EdgeInsets.all(4),
                          child: Chip(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8)),
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
            SizedBox(
              height: Get.height * 0.7,
              child: ListView.builder(
                itemCount: 7,
                itemBuilder: (context, index) {
                  return Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16)),
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.fromLTRB(16, 8, 16, 0),
                          child: Row(
                            children: [
                              Text(
                                'July 22, 2022, 06:30 AM',
                                style: TextStyle(color: Colors.grey),
                              ),
                              Spacer(),
                              Chip(label: Text('data'))
                            ],
                          ),
                        ),
                        ExpansionTile(
                          title: Row(
                            children: [
                              Icon(Icons.home),
                              SizedBox(
                                width: 16,
                              ),
                              Text('Clean room, replace linen')
                            ],
                          ),
                          children: <Widget>[
                            ListTile(
                              leading: ClipRRect(
                                borderRadius: BorderRadius.circular(100),
                                child: Container(
                                    padding: EdgeInsets.all(8),
                                    color: Colors.blue,
                                    child: Icon(
                                      Icons.location_pin,
                                      color: Colors.white,
                                    )),
                              ),
                              title: Text(
                                'Room 326',
                              ),
                              subtitle: Text('Floor 3, Building 8'),
                              //dense: true,
                            ),
                            Padding(
                              padding: EdgeInsets.fromLTRB(16, 0, 0, 16),
                              child: Column(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.fromLTRB(16, 8, 16, 8),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text('Assigned by'),
                                        Text('Supervisor 1')
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(left: 8),
                                    child: Divider(
                                      height: 0.1,
                                      thickness: 0.5,
                                      color: Colors.grey,
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.fromLTRB(16, 8, 16, 8),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text('Completion'),
                                        Text('30 min')
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(left: 8),
                                    child: Divider(
                                      height: 0.1,
                                      thickness: 0.5,
                                      color: Colors.grey,
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.fromLTRB(16, 8, 16, 8),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
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
        appBar: AppBar(
          leading: Text('Clear'),
          title: Text('Filters'),
          actions: [
            Text('Done'),
          ],
          elevation: 1,
        ),
        body: ListView(
          children: [
            Card(
              elevation: 8,
              margin: EdgeInsets.all(16),
              child: Padding(
                padding: EdgeInsets.fromLTRB(16, 8, 0, 8),
                child: ListView(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  children: [
                    TextIcon(
                      text1: 'Room number',
                      text2: 'Room 362',
                    ),
                    TextIcon(
                      text1: 'Room type',
                      text2: 'Business Suite',
                    ),
                    TextIcon(
                      text1: 'Building',
                      text2: 'Select',
                    ),
                    TextIcon(
                      text1: 'Floor',
                      text2: 'Floor 3',
                    ),
                  ],
                ),
              ),
            ),
            Card(
              elevation: 8,
              margin: EdgeInsets.all(16),
              child: Padding(
                padding: EdgeInsets.fromLTRB(16, 8, 0, 8),
                child: ListView(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  children: [
                    TextIcon(
                      text1: 'Task',
                      text2: 'Cleaning',
                    ),
                    TextIcon(
                      text1: 'Assigned by',
                      text2: 'Supervisor 1',
                    ),
                  ],
                ),
              ),
            ),
            Card(
              elevation: 8,
              margin: EdgeInsets.all(16),
              child: Padding(
                padding: EdgeInsets.fromLTRB(16, 8, 0, 8),
                child: ListView(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  children: [
                    Text('Date'),
                    TextIcon(
                      text1: 'Period',
                      text2: 'Last week',
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

class TextIcon extends StatelessWidget {
  final text1, text2, value;

  const TextIcon({this.text1, this.text2, this.value});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.fromLTRB(8, 8, 0, 8),
          child: Row(
            children: [
              Text(text1),
              const Spacer(),
              SizedBox(
                child: Row(
                  children: [
                    value == 'date'
                        ? Container(
                            padding: EdgeInsets.all(6),
                            decoration: BoxDecoration(
                                color: PalletColors.btn_soft_grey,
                                borderRadius: BorderRadius.circular(8)),
                            child: Text(text2),
                          )
                        : Text(text2),
                    const Icon(Icons.chevron_right_rounded)
                  ],
                ),
              ),
            ],
          ),
        ),
        Divider(
          height: 0.1,
          color: Colors.grey,
        ),
      ],
    );
  }
}
