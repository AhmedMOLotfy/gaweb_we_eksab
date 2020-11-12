import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gawebWeEksab/AboutArticles/ArticlesScreen.dart';
import 'package:gawebWeEksab/AboutQuestions/QuestionScreen.dart';
import 'package:gawebWeEksab/Classes/UserData.dart';
import 'package:gawebWeEksab/MoreScreenDirectory/MoreScreen.dart';
import 'package:gawebWeEksab/main.dart';
//
// BannerAd _bannerAd;
// void _loadBannerAd() {
//   _bannerAd
//     ..load()
//     ..show(anchorType: AnchorType.top);
// }

var idPrize;
var fuck;
var fuckBalance;

class QuestionScreen extends StatefulWidget {
  @override
  _QuestionScreenState createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen>
    with TickerProviderStateMixin {
  List<Widget> _list = [
    Text('اسئلة'),
    Text('مقالات'),
    Text('المزيد'),
  ];
  TabController _controller;
  int _selectedIndex = 0;

  // InterstitialAd _interstitialAd;
  // void _loadInterstitialAd() {
  //   _interstitialAd.load();
  // }
  //
  // Future<void> initAdMob() {
  //   return FirebaseAdMob.instance.initialize(appId: AdManager.appId);
  // }

  @override
  void initState() {
    // initAdMob();
    // // _bannerAd = BannerAd(
    // //   adUnitId: AdManager.bannerAdUnitId,
    // //   size: AdSize.banner,
    // // );
    // //
    // // _loadBannerAd();
    // // _bannerAd.show();
    // _interstitialAd = InterstitialAd(
    //   adUnitId: "ca-app-pub-7666672247610328/8131964283",
    // );
    // _interstitialAd
    //   ..load()
    //   ..show(
    //     anchorType: AnchorType.bottom,
    //     anchorOffset: 0.0,
    //     horizontalCenterOffset: 0.0,
    //   );
    //
    // _loadInterstitialAd();
    // _interstitialAd.show();
    setState(() {
      userEmail = email;
    });
    _controller = TabController(length: _list.length, vsync: this);
    _controller.addListener(() {
      setState(() {
        _selectedIndex = _controller.length;
      });
      print(
        "_selectedIndex" + _selectedIndex.toString(),
      );
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primaryColor: Color(0xFFC7EDE6)),
      home: Scaffold(
        appBar: AppBar(
          leading: Padding(
            padding: const EdgeInsets.all(5.0),
            child: MyFuckWidget(),
          ),
          backgroundColor: Color(0xFFC7EDE6),
          title: Text(
            'جاوب و اكسب',
            style: TextStyle(fontSize: 22, color: Colors.black),
          ),
          centerTitle: true,
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
            QuestionsScreen(),
            ArticlesScreen(),
            MoreScreen(),
          ],
        ),
      ),
    );
  }
}

class MyFuckWidget extends StatefulWidget {
  @override
  _MyFuckWidgetState createState() => _MyFuckWidgetState();
}

class _MyFuckWidgetState extends State<MyFuckWidget> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: MyFire.str.snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          print('error');
        }

        if (snapshot.hasData) {
          return ListView(
              children: snapshot.data.docs.map((DocumentSnapshot document) {
            idPrize = document.data()['id'];
            fuckBalance = document.data()['balance'];
            fuck =
                "${document.data()['firstName']} ${document.data()['lastName']}";
            return Text(" ${document.data()['firstName']}");
          }).toList());
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
