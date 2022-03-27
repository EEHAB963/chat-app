import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SigninProvaider extends ChangeNotifier {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  final auth = FirebaseAuth.instance;
  creat() async {
    try {
      final newUser = await auth.createUserWithEmailAndPassword(
          email: email.text, password: password.text);
    } catch (e) {
      print(e);
    }
  }
}
