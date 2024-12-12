//singleton

import 'package:firebase_auth/firebase_auth.dart';

class FirebaseAuthInstance{
  static final FirebaseAuthInstance _instance = FirebaseAuthInstance._internal();

  factory FirebaseAuthInstance(){
    return _instance;
  }

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  FirebaseAuth get firebaseAuth => _firebaseAuth;

  FirebaseAuthInstance._internal();

}

