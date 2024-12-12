import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:zad/models/firebase_auth_instance.dart';



class isLogged extends ChangeNotifier {
  final FirebaseAuth authInstance = FirebaseAuthInstance().firebaseAuth;
  Stream<User?> get authStateChanges => authInstance.authStateChanges();

  bool _isLoggedIn = false ;

  bool get isLoggedIn => _isLoggedIn;

  void changeState() {
    _isLoggedIn = !_isLoggedIn;
    //SharedPrefs().saveBool('logged', _isLoggedIn);
    notifyListeners();
  }
}
