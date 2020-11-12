import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class PublicNotification extends StatefulWidget {
  @override
  _PublicNotificationState createState() => _PublicNotificationState();
}

class _PublicNotificationState extends State<PublicNotification> {
  @override
  Widget build(BuildContext context) {
    var collectionReference = FirebaseFirestore.instance.collection("Notification").orderBy("time",descending: true);
    return StreamBuilder<QuerySnapshot>(
      stream: collectionReference.snapshots(),
      builder: (BuildContext context,
      AsyncSnapshot<QuerySnapshot> snapshot) {
        if(snapshot.hasError){
          print("has Error");
          return Text("has Error");
        }
        if(snapshot.hasData){
          return Column(
            children: snapshot.data.docs.map((DocumentSnapshot document){
              return Column(
                children: [
                  ListTile(
                    trailing: Text("${document.data()['desc']}"),
                    leading: Icon(Icons.info),
                  ),
                ],
              );
            }).toList(),
          );
        }
        else{
          return CircularProgressIndicator();
        }
      },
    );
  }
}
