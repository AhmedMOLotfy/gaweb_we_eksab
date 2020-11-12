import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_admob/firebase_admob.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gawebWeEksab/Classes/ArticleDetailsClass.dart';
import 'package:gawebWeEksab/admanager.dart';

class ArticlesDetailsScreen extends StatefulWidget {
  final String id;

  ArticlesDetailsScreen({this.id});
  @override
  _ArticlesDetailsScreenState createState() => _ArticlesDetailsScreenState();
}

class _ArticlesDetailsScreenState extends State<ArticlesDetailsScreen> {
  // BannerAd _bannerAd;
  // void _loadBannerAd(){
  //   _bannerAd.load();
  // }
  // InterstitialAd _interstitialAd;
  // void _loadInterstitialAd() {
  //   _interstitialAd.load();
  // }

  Future<void> initAdMob() {
    return FirebaseAdMob.instance.initialize(appId: AdManager.appId);
  }

  @override
  void initState() {
    ArticleDetailsClass.articleDetails = FirebaseFirestore.instance
        .collection('Articles')
        .doc(widget.id)
        .collection('Details');
    // initAdMob();
    // _interstitialAd = InterstitialAd(
    //   adUnitId: "ca-app-pub-7666672247610328/5195326676",
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
    // _bannerAd = BannerAd(adUnitId: "ca-app-pub-7666672247610328/6930934389", size: AdSize.banner);
    // _bannerAd..load()..show(
    //     anchorType: AnchorType.top
    // );
    // _loadBannerAd();
    // _bannerAd.show();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFC7EDE6),
        centerTitle: true,
        title: Text(
          'مقالنا اليوم',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: ArticleDetailsClass.articleDetails.snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            print('error');
          }

          if (snapshot.hasData) {
            return ListView(
                children: snapshot.data.docs.map((DocumentSnapshot document) {
              print('Very Good');
              return Column(
                children: [
                  Image.network(document.data()['url']),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(10, 12, 5, 25),
                    child: Text(
                      document.data()['Article'],
                      style: TextStyle(fontSize: 17),
                      softWrap: true,
                      textDirection: TextDirection.rtl,
                    ),
                  ),
                  Text('مع تحياتي '),
                  SizedBox(
                    height: 90,
                  )
                ],
              );
            }).toList());
          } else {
            return CircularProgressIndicator();
          }
        },
      ),
    );
  }
}
