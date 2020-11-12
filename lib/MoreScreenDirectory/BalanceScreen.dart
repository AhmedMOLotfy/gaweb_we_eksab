import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_admob/firebase_admob.dart';
import 'package:flutter/material.dart';
import 'package:gawebWeEksab/Classes/UpdateDataClass.dart';
import 'package:gawebWeEksab/Classes/UserData.dart';
import 'package:gawebWeEksab/MainPage.dart';
import 'package:gawebWeEksab/admanager.dart';
import 'package:gawebWeEksab/main.dart';
var _controllerPhone = TextEditingController();
var _controllerBalance = TextEditingController();
bool isPressedBalance = false;
var phonePrize;
var selectedMoney;
var myMoney;
class BalanceScreen extends StatefulWidget {
  @override
  _BalanceScreenState createState() => _BalanceScreenState();
}

class _BalanceScreenState extends State<BalanceScreen> {
  CollectionReference _collectionReference = FirebaseFirestore.instance.collection("MoreScreen");
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
          "الرصيد",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Center(
        child: ListView(
          children: [
            SizedBox(
              height: 22,
            ),
            Center(
              child: Text(
                'رصيدك الحالي',
                style: TextStyle(
                    color: Colors.black, fontSize: 26, fontFamily: 'ReemKufi'),
              ),
            ),
            StreamBuilder<QuerySnapshot>(
                stream: MyFire.str.snapshots(),
                builder: (BuildContext context,
                    AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (snapshot.hasError) {
                    print('error');
                  }

                  if (snapshot.hasData) {
                    print("done");
                    return Column(
                        children:
                            snapshot.data.docs.map((DocumentSnapshot document) {
                      return Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 22.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text('جنيه مصري'),
                                Text(
                                  " ${document.data()['balance']} ",
                                  style: TextStyle(fontSize: 18),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(22.0),
                            child: Container(
                              color: Color(0xFFC7EDE6).withOpacity(0.5),
                              width: double.infinity,
                              height: 270,
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    right: 8.0, left: 8.0),
                                child: Column(
                                  children: [
                                    Text(
                                        'اشترك في خدمة فودافون او اورانج او اتصالات كاش لاستلام الجائزة',
                                      style: TextStyle(
                                        fontFamily: "Lalezar",
                                        fontSize: 15,
                                      ),
                                    ),
                                    Container(
                                        margin: EdgeInsets.only(top: 20),
                                        width: 370,
                                        height: 65,
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(12),
                                        ),
                                        child: ListTile(
                                          title: TextFormField(
                                            textAlign: TextAlign.center,
                                            controller: _controllerPhone,
                                            textDirection: TextDirection.rtl,
                                            onChanged: (val) {
                                              setState(() {
                                                phonePrize = val;
                                              });
                                            },

                                            decoration: InputDecoration(

                                              hintText: 'ادخل رقم الهاتف',
                                              labelStyle: TextStyle(
                                                  color: Colors.black),
                                              enabledBorder: InputBorder.none,
                                            ),
                                          ),
                                        )),
                                    Container(
                                      margin: EdgeInsets.only(top: 30),
                                      width: 370,
                                      height: 65,
                                      decoration: BoxDecoration(
                                        color: Colors.white.withOpacity(0.8),
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                      child: ListTile(
                                        title: TextFormField(

                                          onChanged: (val) {
                                            setState(() {
                                              selectedMoney = val;
                                              myMoney = int.parse(selectedMoney);
                                            });
                                          },
                                          controller: _controllerBalance,
                                          textAlign: TextAlign.center,
                                          decoration: InputDecoration(


                                            hintText:
                                                'ادخل المبلغ المراد تحويله',
                                            labelStyle: TextStyle(
                                              color: Colors.black,
                                            ),
                                            enabledBorder: InputBorder.none,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top:8.0),
                                      child: StreamBuilder<QuerySnapshot>(
                                        stream: _collectionReference.snapshots(),
                                        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
                                          if(snapshot.hasError){
                                            return Text("Error");
                                          }
                                          if(snapshot.hasData){
                                            return Column(
                                              children: snapshot.data.docs.map((DocumentSnapshot document) {
                                                return Text("${document.data()['balance']}",style: TextStyle(fontFamily: "Lalezar"),);
                                              }).toList(),
                                            );
                                          }
                                          else{
                                            return CircularProgressIndicator();
                                          }

                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      );
                    }).toList());
                  } else {
                    return CircularProgressIndicator();
                  }
                }),
            GetPrize(),
            SizedBox(
              height: 580,
            ),
          ],
        ),
      ),
    );
  }
}

class GetPrize extends StatefulWidget {
  @override
  _GetPrizeState createState() => _GetPrizeState();
}

class _GetPrizeState extends State<GetPrize> {
  UpdateData updateData = UpdateData();
  @override
  Widget build(BuildContext context) {
    CollectionReference getPrize =
        FirebaseFirestore.instance.collection("UserGetPrize");
    Future<void> getUserPrize() {
      return getPrize
          .add({
            "phonePrize": phonePrize,
            "selectedMoney": selectedMoney,
            "fuck": fuck,
            "id": idPrize
          })
          .whenComplete(() => print("Success"))
          .catchError((e) {
            print("Fuck Error");
          });
    }

    return Padding(
      padding: const EdgeInsets.all(22.0),
      child: FlatButton(
          color: Color(0xFFC7EDE6).withOpacity(0.55),
          minWidth: double.infinity,
          onPressed: (){
            _controllerBalance.clear();
            _controllerPhone.clear();
            getUserPrize();
            updateData.updateBalance(fuckBalance);
            setState(() {
              isPressedBalance = true;
            });
          },
          child: isPressedBalance == false ? Text("سحب الجائزة") : Text("ستصلك الجائزة خلال ساعات"))  ,
    );
  }
}
