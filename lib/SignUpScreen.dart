import 'package:firebase_admob/firebase_admob.dart';
import 'package:flutter/material.dart';
import 'package:gawebWeEksab/FirebaseFirestore.dart';
import 'package:gawebWeEksab/admanager.dart';

bool isCorrect = false;
final _formKey = GlobalKey<FormState>();

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  InterstitialAd _interstitialAd;
  void _loadInterstitialAd() {
    _interstitialAd.load();
  }

  Future<void> initAdMob() {
    return FirebaseAdMob.instance.initialize(appId: AdManager.appId);
  }

  @override
  void initState() {
    initAdMob();
    _interstitialAd = InterstitialAd(
      adUnitId: AdManager.interstitialAdUnitId,
    );
    _interstitialAd
      ..load()
      ..show(
        anchorType: AnchorType.bottom,
        anchorOffset: 0.0,
        horizontalCenterOffset: 0.0,
      );

    _loadInterstitialAd();
    _interstitialAd.show();
    super.initState();
  }

  String firstName;
  String lastName;
  String telephoneNumber;
  String email;
  String password;
  String gender;
  String city;
  String firstName1;
  String lastName1;
  String telephoneNumber1;
  String email1;
  String password1;
  String gender1;
  String city1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFC7EDE6),
      body: Form(
        key: _formKey,
        child: ListView(
          children: [
            Container(
              margin: EdgeInsets.only(top: 25),
              child: Hero(
                tag: 'MyHero',
                child: Image(
                  image: AssetImage('images/Photo_.png'),
                  height: 180,
                ),
              ),
            ),
            Center(
              child: Hero(
                tag: 'MySign',
                child: Text(
                  'Sign Up',
                  style: TextStyle(fontFamily: 'Pacifico', fontSize: 30),
                ),
              ),
            ),
            Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Container(
                    color: Color(0xFFC7EDE6),
                  ),
                ),
                Expanded(
                  flex: 13,
                  child: Container(
                    margin: EdgeInsets.only(top: 30),
                    width: 180,
                    height: 70,
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.8),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: TextFormField(
                      textAlign: TextAlign.center,
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Please enter some text';
                        }
                        return null;
                      },
                      onChanged: (val) {
                        setState(() {
                          isCorrect = false;
                          firstName = val;
                        });
                      },
                      onEditingComplete: () {},
                      decoration: InputDecoration(
                        hintText: 'ادخل الاسم الاول',
                        labelStyle: TextStyle(color: Colors.black),
                        enabledBorder: InputBorder.none,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    color: Color(0xFFC7EDE6),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Container(
                    color: Color(0xFFC7EDE6),
                  ),
                ),
                Expanded(
                  flex: 13,
                  child: Container(
                    margin: EdgeInsets.only(top: 30),
                    width: 180,
                    height: 70,
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.8),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: TextFormField(
                      textAlign: TextAlign.center,
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Please enter some text';
                        }
                        return null;
                      },
                      onChanged: (val) {
                        setState(() {
                          isCorrect = false;
                          lastName = val;
                        });
                      },
                      onEditingComplete: () {},
                      decoration: InputDecoration(
                        hintText: 'ادخل الاسم الثاني',
                        labelStyle: TextStyle(color: Colors.black),
                        enabledBorder: InputBorder.none,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    color: Color(0xFFC7EDE6),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Container(
                    color: Color(0xFFC7EDE6),
                  ),
                ),
                Expanded(
                  flex: 13,
                  child: Container(
                    margin: EdgeInsets.only(top: 30),
                    width: 180,
                    height: 70,
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.8),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: TextFormField(
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Please enter some text';
                        }
                        return null;
                      },
                      onChanged: (val) {
                        setState(() {
                          isCorrect = false;
                          telephoneNumber = val;
                        });
                      },
                      textAlign: TextAlign.center,
                      onEditingComplete: () {},
                      decoration: InputDecoration(
                        hintText: 'ادخل رقم الهاتف',
                        labelStyle: TextStyle(color: Colors.black),
                        enabledBorder: InputBorder.none,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    color: Color(0xFFC7EDE6),
                  ),
                ),
              ],
            ),

            Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Container(
                    color: Color(0xFFC7EDE6),
                  ),
                ),
                Expanded(
                  flex: 13,
                  child: Container(
                    margin: EdgeInsets.only(top: 30),
                    width: 180,
                    height: 70,
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.8),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: TextFormField(
                      textAlign: TextAlign.center,
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Please enter some text';
                        }
                        return null;
                      },
                      onChanged: (val) {
                        setState(() {
                          isCorrect = false;
                          gender = val;
                        });
                      },
                      onEditingComplete: () {},
                      decoration: InputDecoration(
                        hintText: 'ذكر ام انثي',
                        labelStyle: TextStyle(color: Colors.black),
                        enabledBorder: InputBorder.none,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    color: Color(0xFFC7EDE6),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Container(
                    color: Color(0xFFC7EDE6),
                  ),
                ),
                Expanded(
                  flex: 13,
                  child: Container(
                    margin: EdgeInsets.only(
                      top: 30,
                    ),
                    width: 180,
                    height: 70,
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.8),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: TextFormField(
                      textAlign: TextAlign.center,
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Please enter some text';
                        }
                        return null;
                      },
                      onChanged: (val) {
                        setState(() {
                          isCorrect = false;
                          city = val;
                        });
                      },
                      onEditingComplete: () {},
                      decoration: InputDecoration(
                        hintText: 'ادخل المدينة',
                        labelStyle: TextStyle(color: Colors.black),
                        enabledBorder: InputBorder.none,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    color: Color(0xFFC7EDE6),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Container(
                    color: Color(0xFFC7EDE6),
                  ),
                ),
                Expanded(
                  flex: 13,
                  child: Container(
                    margin: EdgeInsets.only(top: 30),
                    width: 180,
                    height: 70,
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.8),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: TextFormField(
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Please enter some text';
                        }
                        return null;
                      },
                      onChanged: (val) {
                        setState(() {
                          isCorrect = false;
                          email = val;
                        });
                      },
                      textAlign: TextAlign.center,
                      onEditingComplete: () {},
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        hintText: 'ادخل البريد الالكتروني',
                        labelStyle: TextStyle(color: Colors.black),
                        enabledBorder: InputBorder.none,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    color: Color(0xFFC7EDE6),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Container(
                    color: Color(0xFFC7EDE6),
                  ),
                ),
                Expanded(
                  flex: 13,
                  child: Container(
                    margin: EdgeInsets.only(top: 30),
                    width: 180,
                    height: 70,
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.8),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: TextFormField(
                      textAlign: TextAlign.center,
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Please enter some text';
                        }
                        return null;
                      },
                      obscureText: true,
                      onChanged: (val) {
                        setState(() {
                          isCorrect = false;
                          password = val;
                        });
                      },
                      onEditingComplete: () {},
                      decoration: InputDecoration(
                        hintText: 'كلمة المرور (اقل حاجة 7 حروف)',
                        labelStyle: TextStyle(color: Colors.black),
                        enabledBorder: InputBorder.none,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    color: Color(0xFFC7EDE6),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(
                  right: 20, left: 20, bottom: 20, top: 30),
              child: Container(
                color: Colors.white,
                child: Column(
                  children: [
                    AddUser(
                      firstName: firstName,
                      lastName: lastName,
                      telephoneNumber: telephoneNumber,
                      email: email,
                      password: password,
                      gender: gender,
                      city: city,
                    ),
                  ],
                ),
              ),
            ),
            //final user = _auth.createUserWithEmailAndPassword(
            //                         email: email1, password: password1);
            //                     user.then((value) => Navigator.push(context,
            //                             MaterialPageRoute(builder: (context) {
            //                           return LoginScreen();
            //                         })));
            //**************//
            // Padding(
            //   padding: const EdgeInsets.only(bottom: 22.0),
            //   child: Row(
            //     children: [
            //       Expanded(
            //         flex: 2,
            //         child: Container(
            //           color: Colors.white,
            //         ),
            //       ),
            //       Expanded(
            //         flex: 5,
            //         child: Container(
            //           child: Center(
            //             child: FlatButton(
            //               onPressed: () async {
            //                 Navigator.push(
            //                   context,
            //                   MaterialPageRoute(
            //                     builder: (context) {
            //                       return GetUserName(collectionId);
            //                     },
            //                   ),
            //                 );
            //               },
            //               child: Text('Navigate'),
            //             ),
            //           ),
            //           height: 30,
            //           color: Colors.white,
            //         ),
            //       ),
            //       Expanded(
            //         flex: 2,
            //         child: Container(
            //           color: Colors.white,
            //         ),
            //       ),
            //     ],
            //   ),
            // ),
            SizedBox(
              height: 580,
            ),
          ],
        ),
      ),
    );
  }
}
