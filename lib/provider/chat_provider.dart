import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider_s/model/maseeges_model.dart';

class ChatProvider extends ChangeNotifier {
  final firebase = FirebaseFirestore.instance;
  final auth = FirebaseAuth.instance;
  User? myUser;

  getUser() {
    try {
      final user = auth.currentUser;
      if (user != null) {
        myUser = user;
      }
    } catch (e) {
      print(e);
    }
    print(myUser);
    notifyListeners();
  }

  List<MassegeModel> masseges = [];

  TextEditingController controllerMassege = TextEditingController();

// the sand masseges
  Future setMassege(MassegeModel massegeModel) async {
    await firebase.collection('massege').add(massegeModel.postMassege());
    notifyListeners();
  }

  // the get masseges
  Future getMassege() async {
    Set<MassegeModel> m = {};
    await for (var a in firebase.collection('massege').snapshots()) {
      m.clear();
      for (var mas in a.docs.reversed) {
        m.add(MassegeModel.fromJson(mas.data()));
        print(mas.data());
      }

      masseges = m.toList();
      notifyListeners();
    }

    notifyListeners();
  }

  delete() {
    firebase.collection('massege').doc().delete();

    notifyListeners();
  }
}
