import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../models/firebase_auth_instance.dart';

class signout{
  final FirebaseAuth authInstance = FirebaseAuthInstance().firebaseAuth;

  // Sign Out Method
  Future<void> signOut() async {
    try {
      await authInstance.signOut();
    }catch(e){
      debugPrint(e.toString());
    }
  }

}