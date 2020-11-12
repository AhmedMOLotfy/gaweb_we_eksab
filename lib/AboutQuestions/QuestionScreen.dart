import 'package:animations/animations.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gawebWeEksab/AboutQuestions/InsideQuestion.dart';
import 'package:gawebWeEksab/Classes/QuestuionListClass.dart';
import 'package:gawebWeEksab/ForgetPassword.dart';

class QuestionsScreen extends StatefulWidget {
  @override
  _QuestionsScreenState createState() => _QuestionsScreenState();
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  // BannerAd _bannerAd;
  // void _loadBannerAd() {
  //   _bannerAd.load();
  // }

  @override
  void initState() {
    initAdMob();
    // _bannerAd = BannerAd(
    //     adUnitId: "ca-app-pub-7666672247610328/4367693686",
    //     size: AdSize.banner);
    // _bannerAd
    //   ..load()
    //   ..show(anchorType: AnchorType.top);
    // _loadBannerAd();
    // _bannerAd.show();
    MyQuestionFire.quiSfIRE = FirebaseFirestore.instance
        .collection('questions')
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
      stream: MyQuestionFire.quiSfIRE.snapshots(),
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
                    if (document.data()['showquestion'] == true) {
                      return Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(
                              bottom: 8.0,
                              left: 10,
                              right: 10,
                            ),
                            child: Container(
                              color: Colors.white,
                              child: ListTile(
                                leading: Icon(
                                  Icons.question_answer,
                                ),
                                trailing: Text(
                                  document.data()['title'],
                                ),
                                subtitle: Text(
                                  '${document.data()['date']}',
                                ),
                              ),
                            ),
                          ),
                          Divider(
                            height: 5,
                          ),
                        ],
                      );
                    } else {
                      return Container();
                    }
                  },
                  openBuilder: (BuildContext context,
                      void Function({Object returnValue}) action) {
                    return InQuestionScreen(
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
    //Text(document.data()['title']),
    // ListTile(
    //   leading: Icon(FontAwesomeIcons.award),
    //   title: Text(''),
    // ),
    // CollectionReference users =
    //     FirebaseFirestore.instance.collection('questions');
    //
    // return StreamBuilder<QuerySnapshot>(
    //   stream: users.snapshots(),
    //   builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
    //     if (snapshot.hasError) {
    //       return Text('Something went wrong');
    //     }
    //
    //     if (snapshot.connectionState == ConnectionState.waiting) {
    //       return Text("Loading");
    //     }
    //
    //     return new ListView(
    //       children: snapshot.data.docs.map((DocumentSnapshot document) {
    //         return new ListTile(
    //           title: new Text(
    //             document.data()['title'],
    //           ),
    //           //  subtitle: new Text(document.data()['company']),
    //         );
    //       }).toList(),
    //     );
    //   },
    // );
  }
}

// //***************************************************//
// Widget _buildContext() {
//   return ExpansionTile(
//     title: Text(
//       "كم كان عمر هتلر عندما حكم المانيا و كيف حكمها و سيطر علي اوروبا تصقح المزيد",
//       textAlign: TextAlign.right,
//       style: TextStyle(fontSize: 24.0),
//     ),
//     children: <Widget>[
//       Row(
//         mainAxisAlignment: MainAxisAlignment.start,
//         children: <Widget>[
//           Padding(
//             padding: const EdgeInsets.all(14.0),
//             child: IconButton(
//               icon: Icon(Icons.launch),
//               onPressed: () async {
//                 if (await canLaunch(url)) {
//                   await launch(url);
//                 } else {
//                   throw 'Could not launch $url';
//                 }
//               },
//             ),
//           ),
//         ],
//       ),
//     ],
//   );
// }
//***************************************************//
// Padding(
//   padding: const EdgeInsets.all(8.0),
//   child: Container(
//     color: Colors.white.withOpacity(0.7),
//     child: Row(
//       children: [
//         Column(
//           children: [
//             Text(
//               'كم كان عمر هتلر عندما حكم المانيا؟',
//               softWrap: true,
//               style: TextStyle(
//                 fontSize: 18,
//               ),
//             ),
//           ],
//         ),
//         SizedBox(
//           width: 50,
//         ),
//         Text(
//           'سؤال مفتوح',
//           softWrap: true,
//           style: TextStyle(
//             fontSize: 18,
//           ),
//         ),
//       ],
//     ),
//   ),
// ),
