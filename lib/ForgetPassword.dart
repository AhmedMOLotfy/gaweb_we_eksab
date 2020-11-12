import 'package:firebase_admob/firebase_admob.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gawebWeEksab/admanager.dart';
import 'package:gawebWeEksab/main.dart';

Future<void> initAdMob() {
  return FirebaseAdMob.instance.initialize(appId: AdManager.appId);
}
String forgettenEmail;
bool isPressed = false;

class ForgetPassword extends StatefulWidget {
  @override
  _ForgetPasswordState createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  InterstitialAd _interstitialAd;
  BannerAd _bannerAd;
  void _loadInterstitialAd() {
    _interstitialAd.load();
  }
  void _loadBannerAd(){
    _bannerAd.load();
  }



  @override
  void initState() {
    initAdMob();
    _interstitialAd = InterstitialAd(
      adUnitId: "ca-app-pub-7666672247610328/4750837066",
    );
    _interstitialAd
      ..load()
      ..show(
        anchorOffset: 0.0,
        horizontalCenterOffset: 0.0,
      );

    _loadInterstitialAd();
    _interstitialAd.show();
    _bannerAd = BannerAd(adUnitId: "ca-app-pub-7666672247610328/4367693686", size: AdSize.banner);
    _bannerAd..load()..show(
      anchorType: AnchorType.top
   );
_loadBannerAd();
_bannerAd.show();
    super.initState();
  }

  @override
  void dispose() {
   _bannerAd.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFC7EDE6),
      body: ListView(
        children: [
          Hero(
            tag: 'MyHero',
            child: Image.asset('images/Photo_.png'),
          ),
          Center(
            child: Text(
              'تسجيل كلمة مرور جديدة ',
              style: TextStyle(fontFamily: 'Rakkas', fontSize: 22),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 20),
            width: 370,
            height: 70,
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.8),
              borderRadius: BorderRadius.circular(12),
            ),
            child: TextFormField(
              keyboardType: TextInputType.emailAddress,
              onChanged: (val) {
                setState(() {
                  forgettenEmail = val;
                });
              },
              decoration: InputDecoration(
                icon: Icon(Icons.email),
                hintText: 'Enter Your Email',
                labelText: 'Email',
                labelStyle: TextStyle(color: Colors.black),
                enabledBorder: InputBorder.none,
              ),
            ),
          ),
          FlatButton(
            color: Colors.white,
              onPressed: () {
                final user = FirebaseAuth.instance
                    .sendPasswordResetEmail(email: forgettenEmail);
               // UserCredential fuckUser = FirebaseAuth.instance.sendPasswordResetEmail(email: forgettenEmail);
                user.then((value) {
                  setState(() {
                    isPressed = true;
                  });
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return LoginScreen();
                  }));
                });
              },

              child: Text('اضغط ')),
          Center(
            child: Text(
              'تفقد بريدك الالكتروني لتسجيل كلمة المرور الجديدة',
              style: TextStyle(fontFamily: 'Rakkas'),
            ),
          ),
          SizedBox(
            height: 320,
          ),
        ],
      ),
    );
  }
}
