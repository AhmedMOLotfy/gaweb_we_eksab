import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_admob/firebase_admob.dart';
import 'package:flutter/material.dart';
import 'package:gawebWeEksab/Classes/UserData.dart';
import 'package:gawebWeEksab/admanager.dart';
import 'package:gawebWeEksab/main.dart';

class AccountScreen extends StatefulWidget {
  @override
  _AccountScreenState createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  // InterstitialAd _interstitialAd;
  // void _loadInterstitialAd() {
  //   _interstitialAd.load();
  // }

  Future<void> initAdMob() {
    return FirebaseAdMob.instance.initialize(appId: AdManager.appId);
  }

  @override
  void initState() {
    initAdMob();
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
    MyFire.str = FirebaseFirestore.instance
        .collection('Users')
        .where('email', isEqualTo: userEmail);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFC7EDE6),
        centerTitle: true,
        title: Text(
          'بيانات المستخدم',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: MyFire.str.snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            print('error');
          }

          if (snapshot.hasData) {
            print("done");
            return ListView(
                children: snapshot.data.docs.map((DocumentSnapshot document) {
              return new Column(
                children: [
                  ListTile(
                    leading: Text('First Name'),
                    title: Text("${document.data()['firstName']}"),
                  ),
                  ListTile(
                    leading: Text('lastName'),
                    title: Text("${document.data()['lastName']}"),
                  ),
                  ListTile(
                    leading: Text('phone number'),
                    title: Text(document.data()['telephoneNumber']),
                  ),
                  ListTile(
                    leading: Text('email'),
                    title: Text(document.data()['email']),
                  ),
                  ListTile(
                    leading: Text('Password'),
                    title: Text('${document.data()['password']}'),
                  ),
                  ListTile(
                    leading: Text('id'),
                    title: Text(document.data()['id']),
                  ),
                  ListTile(
                    leading: Text('الرصيد'),
                    title: Text(document.data()['balance'].toString()),
                  ),
                  ListTile(
                    leading: Text('الرصيد'),
                    title: Text(document.data()['balance'].toString()),
                  ),
                  Column(
                    children: [
                      document.data()['message'] == null ?
                        Text("") : Text("${document.data()['message']}")
                
                    ],
                  )
                ],
              );
            }).toList());
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
