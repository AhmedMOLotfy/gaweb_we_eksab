import 'dart:ui';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gawebWeEksab/ForgetPassword.dart';
import 'package:gawebWeEksab/MainPage.dart';
import 'package:gawebWeEksab/SignUpScreen.dart';
import 'package:gawebWeEksab/constants.dart';
import 'package:gawebWeEksab/loadingWidget.dart';

var userEmail;
bool isSubmitted = true;
var correctEmail = true;
var correctPassword = true;
var email, password;
final Future<FirebaseApp> _initialization = Firebase.initializeApp();
// Future<UserCredential> signInWithFacebook() async {
//   final LoginResult result = await FacebookAuth.instance.login();
//   final FacebookAuthCredential facebookAuthCredential =
//       FacebookAuthProvider.credential(result.accessToken.token);
//
//   return await FirebaseAuth.instance
//       .signInWithCredential(facebookAuthCredential);
// }

Future<void> main() async {
  runApp(App());
}

@override
class App extends StatelessWidget {
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _initialization,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return MyApp();
        } else {
          return myWidget(context);
        }
      },
    );
  }
}

class MyApp extends StatefulWidget {
//  final CameraDescription camera;

  //const MyApp({Key key, this.camera}) : super(key: key);
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging();

  @override
  void initState() {
    _firebaseMessaging.requestNotificationPermissions();
    _firebaseMessaging.configure(
      onMessage: (Map<String, dynamic> message) async {
        print("onMessage: $message");
      },
      onLaunch: (Map<String, dynamic> message) async {
        print("onLaunch: $message");
      },
      onResume: (Map<String, dynamic> message) async {
        print("onResume: $message");
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LoginScreen(),
    );
  }
}

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFC7EDE6),
      body: Center(
        child: isSubmitted == true
            ? ListView(
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 25),
                    child: Hero(
                      tag: 'MyHero',
                      child: Image(
                        image: AssetImage(
                          'images/Photo_.png',
                        ),
                        height: 150,
                      ),
                    ),
                  ),
                  Center(
                    child: Hero(
                      tag: 'MySign',
                      child: Text(
                        'Sign In',
                        style: TextStyle(
                          fontFamily: 'Pacifico',
                          fontSize: 30,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                      top: 25,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: facebook,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          height: 55,
                          child: Row(
                            children: [
                              Container(
                                child: Icon(
                                  FontAwesomeIcons.facebookF,
                                  color: Colors.white,
                                ),
                              ),
                              Container(
                                child: Text(
                                  'تسجيل الدخول بفيس بوك ',
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: twitter,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          height: 55,
                          child: Row(
                            children: [
                              Container(
                                child: Icon(
                                  FontAwesomeIcons.twitter,
                                  color: Colors.white,
                                ),
                              ),
                              Container(
                                child: Text(
                                  'تسجيل الدخول بتويتر ',
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 25),
                        child: Text(
                          'او',
                          style: TextStyle(fontSize: 25),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                            margin: EdgeInsets.only(top: 20),
                            width: 370,
                            height: 65,
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.8),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: ListTile(
                              trailing: Icon(Icons.email),
                              title: TextFormField(
                                textAlign: TextAlign.center,
                                textDirection: TextDirection.rtl,
                                validator: (value) {
                                  if (value.isEmpty) {
                                    return 'ادخل بريدك الالكتروني';
                                  }
                                  return null;
                                },
                                keyboardType: TextInputType.emailAddress,
                                onChanged: (val) {
                                  setState(() {
                                    email = val;
                                  });
                                },
                                decoration: InputDecoration(
                                  //icon: Icon(Icons.email),
                                  hintText: 'ادخل بريدك الالكتروني',
                                  //  labelText: 'البريد الالكتروني',
                                  labelStyle: TextStyle(color: Colors.black),
                                  enabledBorder: InputBorder.none,
                                ),
                              ),
                            )),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          margin: EdgeInsets.only(top: 30),
                          width: 370,
                          height: 65,
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.8),
                            // color: Colors.orange[500],
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: ListTile(
                            trailing: Icon(Icons.lock),
                            title: TextFormField(
                              textAlign: TextAlign.center,
                              //textDirection: TextDirection.rtl,
                              validator: (value) {
                                if (value.isEmpty) {
                                  return 'اكتب الباسورد لو سمحت';
                                }
                                return null;
                              },
                              onChanged: (val) {
                                setState(() {
                                  password = val;
                                });
                              },
                              obscureText: true,
                              decoration: InputDecoration(
                                // icon: Icon(Icons.lock_outline),
                                hintText: 'ادخل كلمة المرور',
                                // labelText: 'كلمة المرور',
                                labelStyle: TextStyle(
                                  color: Colors.black,
                                ),
                                enabledBorder: InputBorder.none,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  correctEmail == false
                      ? Text(
                          "ايميل غلط",
                          style: TextStyle(color: Colors.red),
                        )
                      : Container(),
                  correctPassword == false
                      ? Text(
                          "الباسورد غلط. حاول تاني او اعمل فقد كلمة مرور",
                          style: TextStyle(color: Colors.red),
                        )
                      : Container(),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return ForgetPassword();
                      }));
                    },
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(0, 8, 20, 0),
                      child: Align(
                        alignment: Alignment.topRight,
                        child: Text(
                          'هل نسيت كلمة السر ؟',
                          style:
                              TextStyle(decoration: TextDecoration.underline),
                        ),
                      ),
                    ),
                  ),
                  Column(
                    children: [
                      Container(
                        width: 370,
                        height: 45,
                        color: Colors.white,
                        child: FlatButton(
                          onPressed: () async {
                            setState(() {
                              userEmail = email;
                            });
                            //if (_formKey.currentState.validate()) {
                            try {
                              setState(() {
                                isSubmitted = false;
                              });
                              UserCredential userCredential = await FirebaseAuth
                                  .instance
                                  .signInWithEmailAndPassword(
                                      email: email, password: password);
                              userCredential.user.uid.isNotEmpty
                                  ? Navigator.push(context,
                                      MaterialPageRoute(builder: (context) {
                                      return QuestionScreen();
                                    }))

                                  // ignore: unnecessary_statements
                                  : null;
                              setState(() {
                                isSubmitted = true;
                              });
                            } on FirebaseAuthException catch (e) {
                              setState(() {
                                isSubmitted = true;
                              });
                              if (e.code == 'user-not-found') {
                                setState(() {
                                  isSubmitted = true;
                                });
                                setState(() {
                                  correctEmail = false;
                                });
                              } else {
                                setState(() {
                                  isSubmitted = true;
                                });
                                setState(() {
                                  correctPassword = false;
                                });
                              }
                            }

                            // user.catchError((e) {
                            //   print(e);
                            //   setState(() {
                            //     correct = false;
                            //   });
                            // });
                            // }
                          },
                          child: Text('تسجيل الدخول'),
                        ),
                      ),
                    ],
                  ),
                  // AddUser(
                  //   // fullName: DataUpload.fullName,
                  //   // company: DataUpload.company,
                  //   // age: DataUpload.age,
                  //   firstName: num1,
                  //   lastName: num2,
                  //   telephoneNumber: DataUpload.age,
                  // ),

                  GestureDetector(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return SignUp();
                      }));
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'سجل الان',
                          style:
                              TextStyle(decoration: TextDecoration.underline),
                        ),
                        SizedBox(
                          width: 7,
                        ),
                        Text(
                          'ليس لديك حساب؟',
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 580,
                  ),
                ],
              )
            : CircularProgressIndicator(),
      ),
    );
  }
}

//Navigator.push()
