import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Notifications extends StatefulWidget {

  @override
  _NotificationsState createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notifications'),
        actions: [
          InkWell(
            onTap: () => bsNotifSetting(context),
            child: Text('Setting'),
          )
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: ListView(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('TODAY'),
                ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return ListTile(
                      leading: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Container(
                          color: Color(0xFFAF52DE),
                          child: Icon(Icons.check),
                        ),
                      ),
                      title: Text('Supervisor 1 assigned you a task'),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
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
                Text('YESTERDAY'),
                ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return ListTile(
                      leading: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Container(
                          color: Color(0xFFAF52DE),
                          child: Icon(Icons.check),
                        ),
                      ),
                      title: Text('Task 1 was canceled by admin'),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
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
        title: Text('Settings'),
      ),
      body: Padding(
          padding: EdgeInsets.all(16),
        child: ListView(
          children: [
            Padding(
              padding: EdgeInsets.all(4),
              child: Row(
                children: [
                  Text('Allow notifications'),
                  Spacer(),
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
            Divider(
              height: 0.1,
              color: Colors.grey,
            ),
            Padding(
              padding: EdgeInsets.all(4),
              child: Row(
                children: [
                  Text('Sound'),
                  Spacer(),
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
            Divider(
              height: 0.1,
              color: Colors.grey,
            ),
            SizedBox(
              height: 20,
            ),
            Text('ALERTS'),
            Padding(
              padding: EdgeInsets.all(4),
              child: Row(
                children: [
                  Text('Show on Locak Screen'),
                  Spacer(),
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
            Divider(
              height: 0.1,
              color: Colors.grey,
            ),
            Padding(
              padding: EdgeInsets.all(4),
              child: Row(
                children: [
                  Text('Show in History'),
                  Spacer(),
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
            Divider(
              height: 0.1,
              color: Colors.grey,
            ),
            Padding(
              padding: EdgeInsets.all(4),
              child: Row(
                children: [
                  Text('Show as Banners'),
                  Spacer(),
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
            Divider(
              height: 0.1,
              color: Colors.grey,
            ),
          ],
        ),
      ),
    );
  }
}
