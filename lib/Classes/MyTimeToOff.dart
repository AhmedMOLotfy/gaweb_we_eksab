import 'package:cloud_firestore/cloud_firestore.dart';

class UserAnswers {
  static var answer = FirebaseFirestore.instance
      .collection('UserAnswer')
      .where("id", isEqualTo: 'AlNj8UVt0igElrwZT2XQ');
}
