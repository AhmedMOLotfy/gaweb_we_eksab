import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:gawebWeEksab/main.dart';

bool isChanged = false;

class AddAnswer extends StatefulWidget {
  final String name;
  final String answer;
  final String id;
  AddAnswer({
    this.name,
    this.answer,
    this.id,
  });

  @override
  _AddAnswerState createState() => _AddAnswerState();
}

class _AddAnswerState extends State<AddAnswer> {
  @override
  Widget build(BuildContext context) {
    // var myUsers = FirebaseFirestore.instance
    //     .collection("UserAnswer")
    //     .doc(widget.id)
    //     .collection("MyFuckAnswer")
    //     .where("name", isEqualTo: fuck);
    CollectionReference users = FirebaseFirestore.instance
        .collection('UserAnswer')
        .doc(widget.id)
        .collection('MyFuckAnswer');

    Future<void> addUser() {
      return users.add({
        'email': email,
        'name': widget.name, // John Doe
        'answer': widget.answer, // Stokes and Sons
        'time': DateTime.now().toString(),
        'isAnswered': true // 42
      }).then((value) {
        print("User Added");
        setState(() {
          isChanged = true;
        });
      }).catchError((error) => print("Failed to add user: $error"));
    }

    return Column(
      children: [
        FlatButton(
          minWidth: 20,
          color: Colors.white,
          onPressed: () {
            addUser();
          },
          child: isChanged == false ? Icon(Icons.send) : Icon(Icons.check),
        ),
      ],
    );
  }
}
