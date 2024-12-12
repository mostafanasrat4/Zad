
import 'package:firebase_auth/firebase_auth.dart';
import 'package:zad/models/firebase_auth_instance.dart';

class signUP{
  final FirebaseAuth authInstance = FirebaseAuthInstance().firebaseAuth;


  // Sign Up Method
  Future<User?> signUpWithEmailPassword(String email, String password) async {
    try {
      UserCredential userCredential = await authInstance.createUserWithEmailAndPassword(
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