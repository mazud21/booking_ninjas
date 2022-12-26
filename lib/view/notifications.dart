import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../theme/colors_texts_widget.dart';

class Notifications extends StatefulWidget {
  @override
  _NotificationsState createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  final List _listNotif = [
    {
      'title': 'Task 1 was cancelled by Admin',
      'time': '19:00',
      'image': 'https://cdn0.iconfinder.com/data/icons/social-messaging-ui-color-shapes/128/alert-circle-orange-512.png',
      'status': '-',
    },
    {
      'title': 'Room 312 needs cleaning',
      'time': '14:30',
      'image': 'https://www.eurotrendusahome.com/wp-content/uploads/2018/08/killian_D2-250x250.png',
      'status': '-',
    },
    {
      'title': 'Task 4 was cancelled by Admin',
      'time': '11:00',
      'image': 'https://www.eurotrendusahome.com/wp-content/uploads/2018/02/kirkbed_XL-250x250.png',
      'status': '-',
    },
    {
      'title': 'Supervisor 1 assigned you a task',
      'time': '08:00',
      'image': 'https://cf.shopee.co.id/file/75b9b3450686d81cf9797b0eaf96d5ea',
      'status': 'Accepted',
    },
  ];

  bool _visibleOptions = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CupertinoNavigationBar(
        backgroundColor: PalletColors.btn_soft_grey,
        middle: const Text('Notifications'),
        trailing: InkWell(
            onTap: () => bsNotifSetting(context),
            child: const Text(
              'Settings',
              style: TextStyle(color: PalletColors.text_blue),
            )),
        border: Border.all(width: 0.5, color: PalletColors.text_soft_grey),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('TODAY'),
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: 1,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        setState(() {
                          _visibleOptions = !_visibleOptions;

                        });
                      },
                      child: ListTile(
                        contentPadding: const EdgeInsets.all(8),
                        tileColor: _visibleOptions ? PalletColors.btn_soft_grey : Colors.transparent,
                        leading: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Container(
                            width: 40,
                            color: const Color(0xFFAF52DE),
                            child: const Padding(
                              padding: EdgeInsets.all(8),
                                child: Icon(Icons.check, color: PalletColors.text_white,)),
                          ),
                        ),
                        title: Text(
                          'Supervisor 1 assigned you a task',
                          style:
                              TextCustom().textTextBold(PalletColors.text_black),
                        ),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text('2h ago'),
                            Visibility(
                              visible: _visibleOptions,
                              child: Row(
                                children: [
                                  ElevatedButton(
                                      style: ButtonCustom().elevatedGreen(),
                                      onPressed: () {},
                                      child: const Padding(
                                          padding: EdgeInsets.fromLTRB(8, 0, 8, 0),
                                          child: Text(
                                            'Accept',
                                            style: TextStyle(
                                                color: PalletColors.text_white),
                                          ))),
                                  const SizedBox(
                                    width: 16,
                                  ),
                                  ElevatedButton(
                                      style: ButtonCustom().elevatedRed(),
                                      onPressed: () {},
                                      child: const Padding(
                                          padding: EdgeInsets.fromLTRB(8, 0, 8, 0),
                                          child: Text(
                                            'Decline',
                                            style: TextStyle(
                                                color: PalletColors.text_white),
                                          ))),
                                ],
                              ),
                            ),
                            const Divider(
                              color: Colors.grey,
                              height: 0.1,
                            )
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
            const SizedBox(
              height: 16,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('YESTERDAY'),
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: _listNotif.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      contentPadding: const EdgeInsets.all(8),
                      leading: SizedBox(
                        width: 40,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(100),
                          child: Image.network(_listNotif[index]['image']),
                        ),
                      ),
                      title: Text(_listNotif[index]['title'], style: TextCustom().textTextBold(PalletColors.text_black)),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(_listNotif[index]['time']),
                          const SizedBox(
                            height: 8,
                          ),
                          Text(_listNotif[index]['status']),
                          const Divider(
                            color: Colors.grey,
                            height: 0.1,
                          )
                        ],
                      ),
                    );
                  },
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  bsNotifSetting(BuildContext context) {
    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        builder: (context) {
          return FractionallySizedBox(
            heightFactor: 0.9,
            child: NotifSetting(),
          );
        });
  }
}

class NotifSetting extends StatefulWidget {
  @override
  _NotifSettingState createState() => _NotifSettingState();
}

class _NotifSettingState extends State<NotifSetting> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CupertinoNavigationBar(
        middle: Text('Settings'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(4),
              child: Row(
                children: [
                  const Text('Allow notifications'),
                  const Spacer(),
                  CupertinoSwitch(
                    value: _obscureText,
                    onChanged: (value) {
                      setState(() {
                        _obscureText = !_obscureText;
                      });
                    },
                  )
                ],
              ),
            ),
            const Divider(
              height: 0.1,
              color: Colors.grey,
            ),
            Padding(
              padding: const EdgeInsets.all(4),
              child: Row(
                children: [
                  const Text('Sound'),
                  const Spacer(),
                  CupertinoSwitch(
                    value: _obscureText,
                    onChanged: (value) {
                      setState(() {
                        _obscureText = !_obscureText;
                      });
                    },
                  )
                ],
              ),
            ),
            const Divider(
              height: 0.1,
              color: Colors.grey,
            ),
            const SizedBox(
              height: 20,
            ),
            const Text('ALERTS'),
            Padding(
              padding: const EdgeInsets.all(4),
              child: Row(
                children: [
                  const Text('Show on Locak Screen'),
                  const Spacer(),
                  CupertinoSwitch(
                    value: _obscureText,
                    onChanged: (value) {
                      setState(() {
                        _obscureText = !_obscureText;
                      });
                    },
                  )
                ],
              ),
            ),
            const Divider(
              height: 0.1,
              color: Colors.grey,
            ),
            Padding(
              padding: const EdgeInsets.all(4),
              child: Row(
                children: [
                  const Text('Show in History'),
                  const Spacer(),
                  CupertinoSwitch(
                    value: _obscureText,
                    onChanged: (value) {
                      setState(() {
                        _obscureText = !_obscureText;
                      });
                    },
                  )
                ],
              ),
            ),
            const Divider(
              height: 0.1,
              color: Colors.grey,
            ),
            Padding(
              padding: const EdgeInsets.all(4),
              child: Row(
                children: [
                  const Text('Show as Banners'),
                  const Spacer(),
                  CupertinoSwitch(
                    value: _obscureText,
                    onChanged: (value) {
                      setState(() {
                        _obscureText = !_obscureText;
                      });
                    },
                  )
                ],
              ),
            ),
            const Divider(
              height: 0.1,
              color: Colors.grey,
            ),
          ],
        ),
      ),
    );
  }
}
