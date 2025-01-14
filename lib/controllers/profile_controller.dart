import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;
import 'package:flutter/material.dart';
import 'package:zad/models/classes/user.dart';
import 'package:zad/models/services/user_manager.dart';

class ProfileController{
  final UserManager _userManager = UserManager();


  Future<User?> getCurrentUser(BuildContext context) async {

    try{
      // 1. Get current signed-in user from Firebase Authentication
      firebase_auth.User? firebaseAuthUser = firebase_auth.FirebaseAuth.instance.currentUser;

      // 2. If there is already a signed-in user, get current user id
      if(firebaseAuthUser == null) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error in getting user data from FirebaseAuth!')),
        );
        return null;
      }
      String userId = firebaseAuthUser.uid;

      // 3. Fetch current user from Firestore by userId
      User? user = await _userManager.getUserByUserID(userId);
      if(user == null){
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error in getting user data from FireStore!')),
        );
        return null;
      }

      return user;

    } catch (e) {
      debugPrint(e.toString());
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('An error occurred: $e')),
      );
    }
    return null;

  }

}