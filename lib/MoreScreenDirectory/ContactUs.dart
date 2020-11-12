import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_admob/firebase_admob.dart';
import 'package:flutter/material.dart';
import 'package:gawebWeEksab/admanager.dart';

var reference = FirebaseFirestore.instance.collection("MoreScreen");

class ContactUs extends StatefulWidget {
  @override
  _ContactUsState createState() => _ContactUsState();
}

class _ContactUsState extends State<ContactUs> {
  // InterstitialAd _interstitialAd;
  // void _loadInterstitialAd() {
  //   _interstitialAd.load();
  // }

  Future<void> initAdMob() {
    return FirebaseAdMob.instance.initialize(appId: AdManager.appId);
  }

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
            'اتصل بنا',
            style: TextStyle(color: Colors.black),
          ),
        ),
        body: StreamBuilder<QuerySnapshot>(
          stream: reference.snapshots(),
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.hasData) {
              return Column(
                children: snapshot.data.docs.map((DocumentSnapshot document) {
                  return Column(
                    children: [
                      Card(
                          margin: EdgeInsets.symmetric(
                              vertical: 10.0, horizontal: 25.0),
                          child: ListTile(
                            leading: Icon(
                              Icons.phone,
                              color: Colors.teal,
                            ),
                            title: Text(
                              document.data()['phone'],
                              style: TextStyle(
                                color: Colors.teal.shade900,
                                fontSize: 20.0,
                              ),
                            ),
                          )),
                      Card(
                          margin: EdgeInsets.symmetric(
                              vertical: 10.0, horizontal: 25.0),
                          child: ListTile(
                            leading: Icon(
                              Icons.email,
                              color: Colors.teal,
                            ),
                            title: Text(
                              document.data()['email'],
                              style: TextStyle(
                                fontSize: 20.0,
                                color: Colors.teal.shade900,
                              ),
                            ),
                          ))
                    ],
                  );
                }).toList(),
              );
            } else {
              return CircularProgressIndicator();
            }
          },
        ));
  }
}
