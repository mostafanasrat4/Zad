import 'package:flutter/material.dart';
import 'package:zad/controllers/signOut.dart';
import 'package:zad/models/services/local_user_data.dart';
import 'package:zad/views/signin_screen.dart';

class SignOutController{
  final SignOut _signOut = SignOut();
  final LocalUserData _localUserData = LocalUserData();

  Future<void> signOut(BuildContext context) async {

    try{
      // 1. Sign-out with Firebase Authentication
      bool isSignedOut = await _signOut.signOut();

      // 2. If signed out successfully, navigate to Login screen
      if(isSignedOut){
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Signed out successfully!')),
        );
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => SignInScreen()),
              (Route<dynamic> route) => false,
        );
      }
      else{
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error in signing out!')),
        );
      }

      // 3. Wipe the stored local user data from memory
      await _localUserData.clear();

    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('An error occurred: $e')),
      );
    }
  }
}