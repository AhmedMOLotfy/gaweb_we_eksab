import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gawebWeEksab/main.dart';
import 'package:random_string/random_string.dart';

bool circleProgress = false;
bool isUsedEmail = false;
bool isWeekPassword = false;
var collectionId = randomAlphaNumeric(16);

class AddUser extends StatefulWidget {
  final String firstName;
  final String lastName;
  final String telephoneNumber;
  final String email;
  final String password;
  final String gender;
  final String city;
  AddUser({
    this.firstName,
    this.lastName,
    this.telephoneNumber,
    this.email,
    this.password,
    this.gender,
    this.city,
  });

  @override
  _AddUserState createState() => _AddUserState();
}

class _AddUserState extends State<AddUser> {
  @override
  Widget build(BuildContext context) {
    DocumentReference users =
        FirebaseFirestore.instance.collection('Users').doc(collectionId);

    Future<void> addUser() {
      return users
          .set({
            'firstName': widget.firstName,
            'lastName': widget.lastName,
            'telephoneNumber': widget.telephoneNumber,
            'email': widget.email,
            'password': widget.password,
            'gender': widget.gender,
            'city': widget.city,
            'id': collectionId,
            'balance': 0
          })
          .then((value) => print("User Added"))
          .catchError((error) => print("Failed to add user: $error"));
    }

    return FlatButton(
        minWidth: 330,
        onPressed: () async {
          setState(() {
            circleProgress = true;
          });
          addUser();
          try {
            UserCredential userCredential =
                await FirebaseAuth.instance.createUserWithEmailAndPassword(
              email: widget.email,
              password: widget.password,
            );
            userCredential.user.uid.isNotEmpty
                ? Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return LoginScreen();
                  }))
                : Container(
                    child: Text("Something is Error"),
                  );
            setState(() {
              circleProgress = false;
            });
          } on FirebaseAuthException catch (e) {
            if (e.code == 'weak-password') {
              setState(() {
                isWeekPassword = true;
              });
              print('The password provided is too weak.');
            } else if (e.code == 'email-already-in-use') {
              setState(() {
                isUsedEmail = true;
              });
              print('The account already exists for that email.');
            }
          } catch (e) {
            print(e);
          }
        },
        child: Column(
          children: [
            circleProgress == false
                ? Text(
                    //users.id,
                    'التسجيل',
                  )
                : Text("please , wait"),
            isWeekPassword ? Text("password is week") : Container(),
            isUsedEmail ? Text("Email is already in use") : Container(),
          ],
        ));
  }
}

//Future<void> addData(userData) async {
//     Firestore.instance.collection("users").add(userData).catchError((e) {
//       print(e);
//     });
//   }
