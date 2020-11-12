import 'package:cloud_firestore/cloud_firestore.dart';

class Inquestion {
  static var inQues = FirebaseFirestore.instance
      .collection('questions')
      .doc('9XNviusmTthAAMA4znLq')
      .collection('Comments');
}
