import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:gawebWeEksab/MainPage.dart';
import 'package:gawebWeEksab/MoreScreenDirectory/BalanceScreen.dart';

class UpdateData{

  var referenceBalance = FirebaseFirestore.instance.collection("Users").doc(idPrize);
  Future<void> updateBalance(var selectedBalance){
    return referenceBalance.update({"balance":fuckBalance - myMoney}).then((value) => print("Success,Alhamd to Allah")).catchError((onError){
      print(onError);
    });
  }
}
