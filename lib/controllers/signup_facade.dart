import 'package:zad/controllers/sign_up_with_email.dart';
import 'package:zad/models/services/local_user_data.dart';
import 'package:zad/models/services/user_manager.dart';

import '../models/classes/user.dart';
//toDo: login and signup based on user type
class SignUpFacade {
  Future<void> SignUp(User myUser, String password) async {
   await signUP().signUpWithEmailPassword(myUser.email!, password);
   await UserManager().createUser(myUser);
   LocalUserData().saveUserData(myUser.toMap());

  }
}