import 'package:cloud_firestore/cloud_firestore.dart';

class ArticleDetailsClass {
  static var articleDetails = FirebaseFirestore.instance
      .collection('Articles')
      .doc('3CG7i9TblmAx3KnHcgsC')
      .collection('Details');
}
