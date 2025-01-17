import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;
import 'package:flutter/material.dart';
import 'package:zad/controllers/sign_up_with_email.dart';
import 'package:zad/models/classes/admin.dart';
import 'package:zad/models/classes/beneficiary.dart';
import 'package:zad/models/classes/donor.dart';
import 'package:zad/models/classes/volunteer.dart';
import 'package:zad/models/interfaces/IUserManager.dart';
import 'package:zad/models/services/adminManager.dart';
import 'package:zad/models/services/beneficiaryManager.dart';
import 'package:zad/models/services/donor_manager.dart';
import 'package:zad/models/services/local_user_data.dart';
import 'package:zad/models/services/user_manager.dart';
import 'package:zad/models/services/volunteer_manager.dart';
import 'package:zad/views/signin_screen.dart';

import '../models/classes/user.dart';

class SignUpController {
  final SignUp _signUp = SignUp();
  final UserManager _userManager = UserManager();
  final LocalUserData _localUserData = LocalUserData();
  late IUserManager _manager;
  late var selectedUserType;

  Future<void> signUpFacade(User myUser, String password, BuildContext context) async {
    try{
      // 1. Sign-up with Firebase Authentication
      firebase_auth.User? firebaseAuthUser = await _signUp.signUpWithEmailAndPassword(myUser.email!, password);

      // 2. If signed up successfully, get firebase authentication uid
      if(firebaseAuthUser == null) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error in signup')),
        );
        return;
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
        selectedUserType = Admin(id: myUser.id, name: myUser.fullName, email: myUser.email, number: myUser.phoneNo, imageURL: myUser.imageURL);
      }
      else if(userType == 'donor') {
        _manager = DonorManager();
        selectedUserType = Donor(id: myUser.id, fullName: myUser.fullName, email: myUser.email, phoneNo: myUser.phoneNo, imageURL: myUser.imageURL);
      }
      else if(userType == 'volunteer') {
        _manager = VolunteerManager();
        selectedUserType = Volunteer(id: myUser.id, fullName: myUser.fullName, email: myUser.email, phoneNo: myUser.phoneNo, imageURL: myUser.imageURL, registeredEvents: [], skills: [], availability: [], preferrences: []);
      }
      else if(userType == 'beneficiary') {
        _manager = BeneficiaryManager();
        selectedUserType = Beneficiary(id: myUser.id, fullName: myUser.fullName, email: myUser.email, phoneNo: myUser.phoneNo, imageURL: myUser.imageURL, donationNeeded: null, donationReceived: null);
      }
      else {
        _manager = DonorManager();
        selectedUserType = Donor(id: myUser.id, fullName: myUser.fullName, email: myUser.email, phoneNo: myUser.phoneNo, imageURL: myUser.imageURL);
      }

      await _manager.createUser(selectedUserType);



      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Signed up successfully!')),
      );
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => SignInScreen()),
            (Route<dynamic> route) => false,
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('An error occurred: $e')),
      );    }
  }
}