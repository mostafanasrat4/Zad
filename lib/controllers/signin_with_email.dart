import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:zad/models/services/IsignIN.dart';
import 'package:zad/models/services/firebase_auth_instance.dart';

class SignIn implements ISignIn {
  final FirebaseAuth authInstance = FirebaseAuthInstance().firebaseAuth;



  // Sign In Method
  @override
  Future<User?> signInWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential userCredential = await authInstance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      final user = userCredential.user;
      if(user != null){
        debugPrint('Signed in successfully with email:${user.email.toString()} and uid: ${ user.uid.toString()}');
      }
      return user;
    } catch (e) {
      debugPrint(e.toString());
      return null;
    }
  }
}
