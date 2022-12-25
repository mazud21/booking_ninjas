import 'package:booking_ninjas/widgets/appbar_custom.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../theme/colors_texts_widget.dart';

class Notifications extends StatefulWidget {

  @override
  _NotificationsState createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CupertinoNavigationBar(
        backgroundColor: PalletColors.btn_soft_grey,
        middle: Text('Notifications'),
        trailing: Text('Settings', style: TextStyle(color: PalletColors.text_blue),),
        border: Border.all(width: 0.5,color: PalletColors.text_soft_grey),
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
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return ListTile(
                      leading: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Container(
                          color: const Color(0xFFAF52DE),
                          child: const Icon(Icons.check),
                        ),
                      ),
                      title: const Text('Supervisor 1 assigned you a task'),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text('2h ago'),
                          Divider(
                  color: Colors.grey,
                  height: 0.1,
                )
                        ],
                      ),
                    );
                  },
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('YESTERDAY'),
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return ListTile(
                      leading: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Container(
                          color: const Color(0xFFAF52DE),
                          child: const Icon(Icons.check),
                        ),
                      ),
                      title: const Text('Task 1 was canceled by admin'),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text('2h ago'),
                          Divider(
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

  bsNotifSetting(BuildContext context){
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
      appBar: AppBar(
        title: const Text('Settings'),
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
