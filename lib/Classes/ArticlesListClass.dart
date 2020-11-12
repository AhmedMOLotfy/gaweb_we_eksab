import 'package:cloud_firestore/cloud_firestore.dart';

class ArticlesListClass {
  static var articlelistFire = FirebaseFirestore.instance
      .collection('Articles')
      .orderBy('time', descending: true);
}
