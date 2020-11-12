import 'package:animations/animations.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gawebWeEksab/AboutArticles/ArticlesDetailsScreen.dart';
import 'package:gawebWeEksab/Classes/ArticlesListClass.dart';
import 'package:gawebWeEksab/ForgetPassword.dart';

class ArticlesScreen extends StatefulWidget {
  @override
  _ArticlesScreenState createState() => _ArticlesScreenState();
}

class _ArticlesScreenState extends State<ArticlesScreen> {
  // BannerAd _bannerAd;
  // void _loadBannerAd(){
  //   _bannerAd.load();
  // }
  @override
  void initState() {
    initAdMob();
    // _bannerAd = BannerAd(adUnitId: "ca-app-pub-7666672247610328/6930934389", size: AdSize.banner);
    // _bannerAd..load()..show(
    //     anchorType: AnchorType.top
    // );
    // _loadBannerAd();
    // _bannerAd.show();
    // print(fuck);
    ArticlesListClass.articlelistFire = FirebaseFirestore.instance
        .collection('Articles')
        .orderBy('time', descending: true);
    super.initState();
  }
  // @override
  // void dispose() {
  //   _bannerAd.dispose();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: ArticlesListClass.articlelistFire.snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          print('error');
        }
        if (snapshot.hasData) {
          return ListView(
              children: snapshot.data.docs.map((DocumentSnapshot document) {
            return Column(
              children: [
                OpenContainer(
                  closedBuilder:
                      (BuildContext context, void Function() action) {
                    return Column(
                      children: [
                        ListTile(
                          leading: Icon(Icons.launch),
                          title: Text(
                            document.data()['title'],
                            textDirection: TextDirection.rtl,
                          ),
                          subtitle: Text('${document.data()['Tarekh']}'),
                        ),
                        Divider(
                          height: 12,
                        )
                      ],
                    );
                  },
                  openBuilder: (BuildContext context,
                      void Function({Object returnValue}) action) {
                    return ArticlesDetailsScreen(
                      id: document.data()['id'].toString(),
                    );
                  },
                  useRootNavigator: true,
                  closedColor: Colors.white,
                  transitionDuration: Duration(milliseconds: 700),
                ),
              ],
            );
          }).toList());
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}

//
// class AddUser extends StatelessWidget {
//   final String title;
//   final String time;
//
//   AddUser({
//     this.title,
//     this.time,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     CollectionReference users =
//         FirebaseFirestore.instance.collection('questions');
//     Future<void> addUser() {
//       return users
//           .add({
//             'title': title, // John Doe
//             'time': DateTime.now().toString(), // Stokes and Sons
//           })
//           .then((value) => print("User Added"))
//           .catchError((error) => print("Failed to add user: $error"));
//     }
//
//     return FlatButton(
//       onPressed: addUser,
//       child: Text(
//         "Add User",
//       ),
//     );
//   }
// }
