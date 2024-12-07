import 'package:flutter/material.dart';
import 'package:matcher/matcher.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:zad/services/auth_service.dart';
import 'package:zad/services/loginWithEmail.dart';

class loginScreen extends StatelessWidget {
  loginScreen({super.key});
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            width: double.infinity,
            height: 300,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [Colors.purple, Colors.green],
                  begin: Alignment.bottomLeft,
                  end: Alignment.bottomRight),
            ),
            child: Center(
              child: Text(
                'Login',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                ),
              ),
            ),
          ),
          TextFormField(
            controller: emailController,
            decoration: InputDecoration(
              hintText: 'e.g nasrat@example.com',
              labelText: 'email',
            ),
          ),
          TextFormField(
            controller: passwordController,
            obscureText: true,
            decoration: InputDecoration(
              hintText: '******',
              labelText: 'password',
            ),
          ),
          ElevatedButton(
            onPressed: () async{
              AuthService().signInWithEmailPassword(emailController.text, passwordController.text);

            },
            child: Text('login'),
          ),
        ],
      ),
    );
  }
}
