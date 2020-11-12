import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:gawebWeEksab/MoreScreenDirectory/AccoutData.dart';
import 'package:gawebWeEksab/MoreScreenDirectory/BalanceScreen.dart';
import 'package:gawebWeEksab/MoreScreenDirectory/ContactUs.dart';
import 'package:gawebWeEksab/MoreScreenDirectory/notification_center.dart';
import 'package:gawebWeEksab/MoreScreenDirectory/whatisApp.dart';
import 'package:gawebWeEksab/main.dart';
import 'package:share/share.dart';

class MoreScreen extends StatefulWidget {
  @override
  _MoreScreenState createState() => _MoreScreenState();
}

class _MoreScreenState extends State<MoreScreen> {
  // InterstitialAd _interstitialAd;
  // void _loadInterstitialAd() {
  //   _interstitialAd.load();
  // }
  //
  // BannerAd _bannerAd;
  // void _loadBannerAd() {
  //   _bannerAd.load();
  // }
  //
  // Future<void> initAdMob() {
  //   return FirebaseAdMob.instance.initialize(appId: AdManager.appId);
  // }

  @override
  void initState() {
    // initAdMob();
    // _bannerAd = BannerAd(
    //     adUnitId: "ca-app-pub-7666672247610328/1263018192",
    //     size: AdSize.banner);
    // _bannerAd
    //   ..load()
    //   ..show(anchorType: AnchorType.top);
    // _loadBannerAd();
    // _bannerAd.show();
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
    //myGoal();

    super.initState();
  }

  //var firstCamera;
  //myGoal() async {
  //WidgetsFlutterBinding.ensureInitialized();
  // final cameras = await availableCameras();
  //firstCamera = cameras[1];
  //}

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        ListTiles(
          iconData: Icons.attach_money,
          text: 'رصيدي',
          myWidget: BalanceScreen(),
        ),
        Divider(
          height: 3,
        ),
        ListTiles(
          iconData: Icons.person,
          text: 'حسابي',
          myWidget: AccountScreen(),
        ),
        SizedBox(
          height: 20,
        ),
        Divider(
          height: 3,
        ),
        ListTiles(
          iconData: Icons.info,
          text: 'ما هو تطبيق جاوب و اكسب',
          myWidget: WhatIsApp(),
        ),
        Divider(
          height: 3,
        ),
        ListTiles(
          iconData: Icons.phone,
          text: 'تواصل معنا',
          myWidget: ContactUs(),
        ),
        Divider(
          height: 3,
        ),
        Container(
          color: Colors.white,
          child: ListTile(
            onTap: () {
              Share.share(
                  "https://play.google.com/store/apps/details?id=com.mibeutyapp.gawebWeEksab "
                  "(تطبيق جاوب و اكسب (الكسب المادي مقابل القراءة و الاطلاع و المعرفة");

            },
            leading: Icon(Icons.share),
            trailing: Text("مشاركة"),
          ),
        ),
        Divider(
          height: 3,
        ),
        ListTiles(
          iconData: Icons.notifications,
          text: "مركز الاشعارات",
          myWidget: NotificationCenter(),
        ),
        SizedBox(
          height: 50,
        ),
        GestureDetector(
          child: ListTiles(
            iconData: Icons.logout,
            text: 'تسجيل خروج',
            myWidget: LoginScreen(),
          ),
        ),
        SizedBox(
          height: 100,
        ),
      ],
    );
  }
}

class ListTiles extends StatelessWidget {
  final IconData iconData;
  final String text;
  final Widget myWidget;

  ListTiles({@required this.iconData, @required this.text, this.myWidget});

  @override
  Widget build(BuildContext context) {
    return OpenContainer(
      closedBuilder: (BuildContext context, void Function() action) {
        return Padding(
          padding: EdgeInsets.only(bottom: 8.0),
          child: Container(
            color: Colors.white,
            child: ListTile(
              leading: Icon(iconData),
              trailing: Text(text),
            ),
          ),
        );
      },
      openBuilder:
          (BuildContext context, void Function({Object returnValue}) action) {
        return myWidget;
      },
      useRootNavigator: true,
      closedColor: Colors.white,
      transitionDuration: Duration(milliseconds: 700),
    );
  }
}
