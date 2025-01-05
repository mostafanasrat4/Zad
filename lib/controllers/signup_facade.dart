import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;
import 'package:flutter/material.dart';
import 'package:zad/controllers/sign_up_with_email.dart';
import 'package:zad/models/interfaces/IUserManager.dart';
import 'package:zad/models/services/adminManager.dart';
import 'package:zad/models/services/beneficiaryManager.dart';
import 'package:zad/models/services/donor_manager.dart';
import 'package:zad/models/services/local_user_data.dart';
import 'package:zad/models/services/user_manager.dart';
import 'package:zad/models/services/volunteer_manager.dart';
import '../models/classes/user.dart';

// TODO: login and signup based on user type
class SignUpController {
  final SignUp _signUp = SignUp();
  final UserManager _userManager = UserManager();
  final LocalUserData _localUserData = LocalUserData();
  late IUserManager _manager;

  Future<void> signUpFacade(User myUser, String password, BuildContext context) async {
    try{
      // 1. Sign-up with Firebase Authentication
      firebase_auth.User? firebaseAuthUser = await _signUp.signUpWithEmailAndPassword(myUser.email!, password);

      // 2. If signed up successfully, get firebase authentication uid
      if(firebaseAuthUser == null) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error in signup')),
        );
      }
      myUser.id = firebaseAuthUser!.uid; // To keep ids of both Firebase Authentication and Firestore consistent

      // 3. Add user to Firestore User table
      await _userManager.createUser(myUser);

      // 4. Add user data to local storage
      _localUserData.saveUserData(myUser.toMap());

      // 5. Add user to Firestore table based on its type
      String userType = myUser.type!;
      if(userType == 'admin') {
        _manager = AdminManager();
      }
      else if(userType == 'donor') {
        _manager = DonorManager();
      }
      else if(userType == 'volunteer') {
        _manager = VolunteerManager();
      }
      else if(userType == 'beneficiary') {
        _manager = BeneficiaryManager();
      }
      else {
        _manager = DonorManager();
      }
      await _manager.createUser(myUser);
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('An error occurred: $e')),
      );    }
  }
}