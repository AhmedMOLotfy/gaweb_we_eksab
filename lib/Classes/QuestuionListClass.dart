import 'package:cloud_firestore/cloud_firestore.dart';

class MyQuestionFire {
  static var quiSfIRE = FirebaseFirestore.instance
      .collection('questions')
      .orderBy('time', descending: false);
}
