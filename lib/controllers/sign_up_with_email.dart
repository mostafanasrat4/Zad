import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:zad/models/services//firebase_auth_instance.dart';

class SignUp{
  final FirebaseAuth authInstance = FirebaseAuthInstance().firebaseAuth;


  // Sign Up Method
  Future<User?> signUpWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential userCredential = await authInstance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return userCredential.user;
    } catch (e) {
      debugPrint(e.toString());
      return null;
    }
  }
}