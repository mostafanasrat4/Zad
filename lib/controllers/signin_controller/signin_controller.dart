import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;
import 'package:flutter/material.dart';
import 'package:zad/controllers/signin_controller/dashboard_context.dart';
import 'package:zad/controllers/signin_controller/dashboard_strategies/admin_dashboard_strategy.dart';
import 'package:zad/controllers/signin_controller/dashboard_strategies/donor_dashboard_strategy.dart';
import 'package:zad/controllers/signin_controller/dashboard_strategies/volunteer_dashboard_strategy.dart';
import 'package:zad/controllers/signin_with_email.dart';
import 'package:zad/models/classes/collections_of_topics.dart';
import 'package:zad/models/classes/topics.dart';
import 'package:zad/models/classes/user.dart';
import 'package:zad/models/services/FCM_DB.dart';
import 'package:zad/models/services/user_manager.dart';
import 'package:zad/views/donor_screens/donor_navigation_manager.dart';

import '../../models/services/local_user_data.dart';

class SignInController{
  final SignIn _signIn = SignIn();
  final UserManager _userManager = UserManager();
  final LocalUserData _localUserData = LocalUserData();

  Future<String?> signIn(String email, String password, BuildContext context) async {

    try{
      // 1. Sign-in with Firebase Authentication
      firebase_auth.User? firebaseAuthUser = await _signIn.signInWithEmailAndPassword(email, password);

      // 2. If signed in successfully, get current user id
      // TODO: Make signInWithEmailAndPassword() return different errors in sign in and handle them here
      if(firebaseAuthUser == null) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Invalid email or password')),
        );
        return null;
      }
      String userId = firebaseAuthUser.uid;

      // 3. Fetch current user from Firestore by userId
      User? user = await _userManager.getUserByUserID(userId);
      if(user == null) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error in getting user data!')),
        );
        return null;
      }

      // 4. Store user data in local storage
      _localUserData.clear();
      _localUserData.saveUserData(user.toMap());
      // await FCMDB().storeFCMToken();
      //


      // 4. Check user type and set dashboard strategy
      String? userType = user.type;
      DashboardContext dashboardContext = DashboardContext();
      switch(userType){
        case "admin":
          dashboardContext.setDashboardStrategy(AdminDashboardStrategy());

          break;
        case "donor":
          dashboardContext.setDashboardStrategy(DonorDashboardStrategy());

          break;
        case "volunteer":
          dashboardContext.setDashboardStrategy(VolunteerDashboardStrategy());

          break;
        default:
          dashboardContext.setDashboardStrategy(DonorDashboardStrategy());

      }

      // 5. Invoke showDashboard() in DashboardContext
      Widget dashboard = dashboardContext.getDashboard();
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => dashboard),
        // MaterialPageRoute(builder: (context) => ProfileScreen()),
        // MaterialPageRoute(builder: (context) => DonorNavigationManager()),
        (Route<dynamic> route) => false,
      );

    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('An error occurred: $e')),
      );
    }
  }
}