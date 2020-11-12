import 'package:cloud_firestore/cloud_firestore.dart';

class DarkTime {
  static var off = FirebaseFirestore.instance
      .collection("UserAnswer")
      .where("id", isEqualTo: "AlNj8UVt0igElrwZT2XQ");
}
