import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:gawebWeEksab/AddUserAnswer.dart';
import 'package:gawebWeEksab/Classes/MyTimeToOff.dart';
import 'package:gawebWeEksab/Classes/QuestionClass.dart';
import 'package:gawebWeEksab/Classes/TimeToStop.dart';
import 'package:gawebWeEksab/MainPage.dart';

var answer;
var fuckAnswer;

class InQuestionScreen extends StatefulWidget {
  final String id;

  InQuestionScreen({this.id});
  @override
  _InQuestionScreenState createState() => _InQuestionScreenState();
}

class _InQuestionScreenState extends State<InQuestionScreen> {
  // BannerAd _bannerAd;
  // void _loadBannerAd(){
  //   _bannerAd.load();
  // }
  @override
  void initState() {
    // initAdMob();
    //
    // _bannerAd = BannerAd(adUnitId: "ca-app-pub-7666672247610328/4367693686", size: AdSize.banner);
    // _bannerAd..load()..show(
    //     anchorType: AnchorType.top
    // );
    // _loadBannerAd();
    // _bannerAd.show();
    Inquestion.inQues = FirebaseFirestore.instance
        .collection('questions')
        .doc(widget.id)
        .collection('questionDetails');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Color(0xFFC7EDE6),
        centerTitle: true,
        title: Text(
          'جاوب دلوقتي',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: Inquestion.inQues.snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            print('error');
          }
          if (snapshot.hasData) {
            return ListView(
                children: snapshot.data.docs.map(
              (DocumentSnapshot document) {
                return Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 40),
                                child: Icon(
                                  Icons.looks_two_outlined,
                                  size: 60,
                                ),
                              ),
                              Text('المركز الثاني'),
                              Text("${document.data()['secondPrize']}"),
                              document.data()['showWinners'] == true ?  Text('${document.data()['2nd winner']}') : Container()
                            ],
                          ),
                          SizedBox(
                            width: 30,
                          ),
                          Column(
                            children: [
                              Icon(
                                Icons.looks_one_outlined,
                                size: 60,
                              ),
                              Text('المركز الاول'),
                              Text(
                                document.data()['firstPrize'].toString(),
                              ),
                              document.data()['showWinners'] == true ?  Text('${document.data()['1st winner']}') : Container()
                            ],
                          ),
                          SizedBox(
                            width: 30,
                          ),
                          Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 48),
                                child: Icon(
                                  Icons.looks_3_outlined,
                                  size: 60,
                                ),
                              ),
                              Text('المركز الثالث'),
                              Text('${document.data()['thirdPrize']}'),
                              document.data()['showWinners'] == true ?  Text('${document.data()['3rd winner']}') : Container()
                            ],
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 12.0, bottom: 22),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "سؤال النهاردة",
                            style:
                                TextStyle(fontSize: 22, fontFamily: 'ReemKufi'),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: Color(0xFFC7EDE6).withOpacity(0.3),
                        ),
                        child: Text(
                          '${document.data()['question']}',
                          style: TextStyle(fontSize: 28),
                          softWrap: true,
                          textDirection: TextDirection.rtl,
                        ),
                      ),
                    ),
                    // Column(
                    //   children: [
                    //     StreamBuilder<QuerySnapshot>(
                    //       stream: users.snapshots(),
                    //       builder: (BuildContext context,
                    //           AsyncSnapshot<QuerySnapshot> snapshot) {
                    //         if (snapshot.hasData) {
                    //           print("has ");
                    //           //return Text('abc');
                    //           return Column(
                    //             children: snapshot.data.docs
                    //                 .map((DocumentSnapshot document) {
                    //               return Column(
                    //                 children: [
                    //                   Text("${document.data()['name']}")
                    //                 ],
                    //               );
                    //             }).toList(),
                    //           );
                    //         }
                    //         if (snapshot.connectionState ==
                    //             ConnectionState.active) {
                    //           print("returned one value at least");
                    //           return Text("returned one value at least");
                    //         }
                    //         if (snapshot.connectionState ==
                    //             ConnectionState.done) {
                    //           print("Successful");
                    //           return Text("Successful");
                    //         } else {
                    //           return CircularProgressIndicator();
                    //         }
                    //       },
                    //     ),
                    //   ],
                    // ),
                    document.data()['showAnswer'] == false ?  document.data()['showenField'] == true
                        ? Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: Container(
                                  margin: EdgeInsets.only(top: 20),
                                  width: 280,
                                  height: 70,
                                  decoration: BoxDecoration(
                                    color: Color(0xFFC7EDE6).withOpacity(0.2),
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: isChanged == false
                                      ? TextFormField(
                                          keyboardType:
                                              TextInputType.emailAddress,
                                          onChanged: (val) {
                                            setState(() {
                                              answer = val;
                                            });
                                          },
                                          decoration: InputDecoration(
                                            icon: Icon(Icons.question_answer),
                                            hintText: 'Enter Your Answer',
                                            labelText: 'Answer',
                                            labelStyle:
                                                TextStyle(color: Colors.black),
                                            enabledBorder: InputBorder.none,
                                          ),
                                        )
                                      : document.data()['showAnswer'] == false ? Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(
                                            'لقد اجبت من فضلك انتظر الاجابة الصحيحة',
                                            style: TextStyle(fontSize: 18),
                                          ),
                                        ): Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      '${document.data()['answer']} الاجابة الصحيحة :',
                                      style: TextStyle(fontSize: 18),
                                    ),
                                  ),
                                ),
                              ),
                              AddAnswer(
                                name: fuck,
                                answer: answer,
                                id: widget.id,
                              ),
                            ],
                          )
                        : Text(
                            'لقد اجبت من فضلك انتظر الاجابة الصحية',
                            style:
                                TextStyle(color: Colors.black87, fontSize: 25),
                          ): Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        '${document.data()['answer']} الاجابة الصحيحة ',
                        style: TextStyle(fontSize: 18),
                      ),
                    ),

                    TimeToDeactivate(
                      id: widget.id,
                    ),
                    SizedBox(
                      height: 580,
                    ),
                  ],
                );
              },
            ).toList());
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
} //looks_one

class UserFuckingAnswer extends StatefulWidget {
  final String id;
  UserFuckingAnswer({this.id});
  @override
  _UserFuckingAnswerState createState() => _UserFuckingAnswerState();
}

class _UserFuckingAnswerState extends State<UserFuckingAnswer> {
  @override
  void initState() {
    UserAnswers.answer = FirebaseFirestore.instance
        .collection('UserAnswer')
        .doc(widget.id)
        .collection('MyFuckAnswer')
        .orderBy("time", descending: false);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: UserAnswers.answer.snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          print('error');
        }
        if (snapshot.hasData) {
          return Column(
              children: snapshot.data.docs.map((DocumentSnapshot document) {
            return Container(
                padding: const EdgeInsets.all(32),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text('${document.data()['name']}'),
                        Icon(Icons.person),
                      ],
                    ),
                    SizedBox(
                      height: 6,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text('${document.data()['answer']}'),
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          '${document.data()['time']}',
                        ),
                      ],
                    ),
                  ],
                ));
          }).toList());
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}

class TimeToDeactivate extends StatefulWidget {
  final String id;
  TimeToDeactivate({this.id});
  @override
  _TimeToDeactivateState createState() => _TimeToDeactivateState();
}

class _TimeToDeactivateState extends State<TimeToDeactivate> {
  @override
  void initState() {
    DarkTime.off = FirebaseFirestore.instance
        .collection("questions")
        .where("id", isEqualTo: widget.id);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: DarkTime.off.snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            print('Fucking Error');
          }
          if (snapshot.hasData) {
            return Column(
              children: snapshot.data.docs.map((DocumentSnapshot document) {
                return document.data()['showen'] == true
                    ? Column(
                        children: [
                          UserFuckingAnswer(
                            id: widget.id,
                          ),
                          //Text('${document.data()['showen']}'),
                          //Text('${widget.id}')
                        ],
                      )
                    : Container();
                // if () {
                //   return UserFuckingAnswer(
                //     id: widget.id,
                //   );
                // } else {
                //   return Text('مع تحياتي');
                // }
              }).toList(),
            );
          } else {
            return CircularProgressIndicator();
          }
        });
  }
}
