import 'package:firebase_auth/firebase_auth.dart';
import 'package:zad/models/services/IsignIN.dart';
import 'package:zad/models/services/firebase_auth_instance.dart';

class SignInWithEmail implements IsignIN {
  final FirebaseAuth authInstance = FirebaseAuthInstance().firebaseAuth;



  // Sign In Method
  @override
  Future<User?> signIN(String email, String password) async {
    try {
      UserCredential userCredential = await authInstance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return userCredential.user;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
