import 'dart:collection';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

import '../model/class1.dart';
// (mail psswrd)
class MainProvider extends ChangeNotifier{
  final FirebaseFirestore db =FirebaseFirestore.instance;



  TextEditingController nameController=TextEditingController();
  TextEditingController numberController=TextEditingController();
  TextEditingController locationController=TextEditingController();

  void  adddoner (String from,String oldid){
    String id=DateTime.now().millisecondsSinceEpoch.toString();
    HashMap <String,dynamic> map1=HashMap();
    map1["NAME"]=nameController.text;
    map1["NUMBER"]=numberController.text;
    map1["LOCATION"]=locationController.text;
    if(from=="NEW"){
      map1["id"]=id;
    }
    if(from=="EDIT"){
      db.collection("doner").doc(oldid).set(map1);
    }
    else{
      db.collection("doner").doc(id).set(map1,SetOptions(merge: true));

    }
notifyListeners();

  }


  List<abc> donerlist=[];
  void getdoner () {
    print("get success");
    db.collection("doner").get().then((value) {

      if (value.docs.isNotEmpty) {
        print('value idnd');
        donerlist.clear();
        for (var elements in value.docs) {
          Map <dynamic, dynamic> getMap = elements.data();
          donerlist.add(abc(
            elements.id,
            getMap["NAME"]??"Field is empty",
            getMap["NUMBER"]??"Field is empty",
            getMap["LOCATION"]??"Field is empty"



          )

          );
        }
          notifyListeners();


        }

    });
    print(donerlist.length);
    notifyListeners();
   }

   void deleteDoner(String id){
    db.collection("doner").doc(id).delete();
    getdoner();
      notifyListeners();

   }


  void EditDoner(String id) {
   db.collection("doner").doc(id).get().then((value) {
     Map<dynamic,dynamic> map=value.data()as Map;
     if(value.exists){
       nameController.text=map["NAME"].toString();
       numberController.text=map["NUMBER"].toString();
       locationController.text=map["LOCATION"].toString();
       notifyListeners();
     }
   }

   );
   notifyListeners();
  }



}