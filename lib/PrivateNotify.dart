import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:gawebWeEksab/MainPage.dart';
class PrivateNotification extends StatefulWidget {
  @override
  _PrivateNotificationState createState() => _PrivateNotificationState();
}

class _PrivateNotificationState extends State<PrivateNotification> {
  @override
  Widget build(BuildContext context) {
    var selectedCollection = FirebaseFirestore.instance.collection("Users").doc(idPrize).collection("Notification").orderBy("time",descending: true);
    return StreamBuilder<QuerySnapshot>(
      stream: selectedCollection.snapshots(),
      builder: (BuildContext context,AsyncSnapshot<QuerySnapshot> snapshot){
        if(snapshot.hasError){
          print("Fuck Error");
        }
        if(snapshot.hasData){
          return Column(
            children: snapshot.data.docs.map((DocumentSnapshot document) {
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
          return Container(child: CircularProgressIndicator(),height: 120,);
        }
      },
    );
  }
}
