import 'package:flutter/material.dart';
import 'package:matcher/matcher.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:zad/controllers//signin_with_email.dart';
import 'package:zad/controllers/signin_with_email.dart';

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
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                  colors: [Colors.purple, Colors.green],
                  begin: Alignment.bottomLeft,
                  end: Alignment.bottomRight),
            ),
            child: const Center(
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
            decoration: const InputDecoration(
              hintText: 'e.g nasrat@example.com',
              labelText: 'email',
            ),
          ),
          TextFormField(
            controller: passwordController,
            obscureText: true,
            decoration: const InputDecoration(
              hintText: '******',
              labelText: 'password',
            ),
          ),
          ElevatedButton(
            onPressed: () async{
              //AuthService().signInWithEmailPassword(emailController.text, passwordController.text);

            },
            child: const Text('login'),
          ),
        ],
      ),
    );
  }
}
