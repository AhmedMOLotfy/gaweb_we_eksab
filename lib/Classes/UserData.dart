import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:gawebWeEksab/main.dart';

class MyFire {
  static var str = FirebaseFirestore.instance
      .collection('Users')
      .where('email', isEqualTo: userEmail);
}
