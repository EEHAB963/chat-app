import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginProvaider extends ChangeNotifier {
  TextEditingController? emailConteoler = TextEditingController();
  TextEditingController? passwordControlor = TextEditingController();

  final aut = FirebaseAuth.instance;
  login() async {
    final userLogin = await aut.signInWithEmailAndPassword(
        email: emailConteoler!.text, password: passwordControlor!.text);
  }
}
