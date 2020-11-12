import 'package:flutter/material.dart';
import 'package:gawebWeEksab/PrivateNotify.dart';
import 'package:gawebWeEksab/PublicNotification.dart';

class NotificationCenter extends StatefulWidget {
  @override
  _NotificationCenterState createState() => _NotificationCenterState();
}

class _NotificationCenterState extends State<NotificationCenter>
    with TickerProviderStateMixin {
  List<Widget> _list = [
    Text("الاشعارات العامة"),
    Text("الاشعارات الخاصة"),
  ];
  TabController _controller;
  int _selectedIndex = 0;
  @override
  void initState() {
    _controller = TabController(
      length: _list.length,
      vsync: this,
    );
    _controller.addListener(() {
      setState(() {
        _selectedIndex = _controller.length;
        print(_selectedIndex.toString());
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primaryColor: Color(0xFFC7EDE6)),
      home: Scaffold(
        appBar: AppBar(
          leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(Icons.keyboard_arrow_left),
          ),
          backgroundColor: Color(0xFFC7EDE6),
          centerTitle: true,
          title: Text("مركز الاشعارات"),
          bottom: TabBar(
            labelPadding: EdgeInsets.only(
              bottom: 10,
            ),
            tabs: _list,
            controller: _controller,
          ),
        ),
        body: TabBarView(
          controller: _controller,
          children: [
            PublicNotification(),
            PrivateNotification(),
          ],
        ),
      ),
    );
  }
}
