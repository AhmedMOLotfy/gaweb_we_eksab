import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gawebWeEksab/MoreScreenDirectory/ContactUs.dart';

class WhatIsApp extends StatefulWidget {
  @override
  _WhatIsAppState createState() => _WhatIsAppState();
}

class _WhatIsAppState extends State<WhatIsApp> {
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
    // _interstitialAd = InterstitialAd(
    //   adUnitId: "ca-app-pub-7666672247610328/4241337656",
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

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFC7EDE6),
        centerTitle: true,
        title: Text(
          'جاوب و اكسب',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: reference.snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasData) {
            return Column(
              children: snapshot.data.docs.map((DocumentSnapshot document) {
                return Padding(
                  padding: const EdgeInsets.all(22.0),
                  child: Text(
                    document.data()['whatisApp'],
                    style: TextStyle(fontSize: 22),
                    textAlign: TextAlign.end,
                    softWrap: true,
                  ),
                );
              }).toList(),
            );
          } else {
            return CircularProgressIndicator();
          }
        },
      ),
    );
  }
}
