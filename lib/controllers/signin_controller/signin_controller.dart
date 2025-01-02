import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;
import 'package:flutter/material.dart';
import 'package:zad/controllers/signin_controller/dashboard_context.dart';
import 'package:zad/controllers/signin_controller/dashboard_strategies/admin_dashboard_strategy.dart';
import 'package:zad/controllers/signin_controller/dashboard_strategies/donor_dashboard_strategy.dart';
import 'package:zad/controllers/signin_controller/dashboard_strategies/volunteer_dashboard_strategy.dart';
import 'package:zad/controllers/signin_with_email.dart';
import 'package:zad/models/services/user_manager.dart';
import 'package:zad/models/classes/user.dart';
import 'package:zad/views/admin_dashboard_screen.dart';

class SignInController{
  Future<bool> signIn(String email, String password, BuildContext context) async {
    // 1. Sign-in with Firebase Authentication
    SignIn signIn = SignIn();
    firebase_auth.User? firebaseAuthUser = await signIn.signInWithEmailAndPassword(email, password);

    // 2. If signed in successfully, get current user id
    if(firebaseAuthUser == null) {
      return false;
    }
    String userId = firebaseAuthUser.uid;

    // 3. Fetch current user from Firestore by id
    UserManager userManager = UserManager();
    User? user = await userManager.getUserByUserID(userId);
    String? userType = user?.type;

    // 4. Check user type and set dashboard strategy
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
    }

    // 5. Invoke showDashboard() in DashboardContext
    Widget dashboard = dashboardContext.showDashboard();
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => dashboard),
          (Route<dynamic> route) => false,
    );
    return true;
  }
}