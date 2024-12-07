/*
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:zad/services/IsignIN.dart';

class signInWithEmail implements IsignIN{
  final FirebaseAuth _auth = FirebaseAuth.instance;
  @override

  signIN(String email,String password){
     Future<User?> signInWithEmailPassword(String email, String password) async {
       try {
         UserCredential userCredential = await _auth.signInWithEmailAndPassword(
           email: email,
           password: password,
         );
         return userCredential.user;
       } catch (e) {
         print(e);
         return null;
       }
     }
   }

}*/
