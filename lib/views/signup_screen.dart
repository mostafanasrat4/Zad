import 'package:flutter/material.dart';
import 'package:zad/views/signin_screen.dart';
import 'package:zad/controllers/sign_up_with_email.dart';

class SignUpScreen extends StatelessWidget {

  SignUpScreen({super.key});

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController phoneNoController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            // "Welcome!" Container
            Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height/4.0,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                    colors: [Colors.blue, Colors.green],
                    begin: Alignment.bottomLeft,
                    end: Alignment.bottomRight
                ),
              ),
              child: const Center(
                child: Text(
                  'Welcome!',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 40.0,
                      fontWeight: FontWeight.bold
                  ),
                ),
              ),
            ),
            // Name TextFormField
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: TextFormField(
                controller: nameController,
                keyboardType: TextInputType.name,
                textCapitalization: TextCapitalization.words,
                decoration: const InputDecoration(
                  hintText: 'Mohammad Hany',
                  labelText: 'Full Name',
                ),
              ),
            ),
            // Email TextFormField
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: TextFormField(
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                  hintText: 'mohammad@example.com',
                  labelText: 'Email',
                ),
              ),
            ),
            // Password TextFormField
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: TextFormField(
                controller: passwordController,
                obscureText: true,
                decoration: const InputDecoration(
                  labelText: 'Password',
                ),
              ),
            ),
            // PhoneNo TextFormField
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: TextFormField(
                controller: phoneNoController,
                keyboardType: TextInputType.phone,
                decoration: const InputDecoration(
                  hintText: '01012345678',
                  labelText: 'Phone No.',
                ),
              ),
            ),
            const SizedBox(height: 40,),
            // SignUp button
            Padding(
              padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width/10.0),
              child: SizedBox(
                width: double.infinity,
                height: 40.0,
                child: ElevatedButton(
                  onPressed: () async{
                    // ToDo: Replace this line with a call to a method from the controller (Don't call AuthService directly)
                    signUP().signUpWithEmailPassword(emailController.text, passwordController.text);

                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  child: const Text('Sign Up',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18.0
                    ),),
                ),
              ),
            ),
            const SizedBox(height: 70.0),
            // "Already have an account?" label
            const Text(
              'Already have an account? Sign in below!',
              style: TextStyle(fontSize: 14.0),
            ),
            const SizedBox(height: 8.0),
            // Sign in button
            Padding(
              padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width/10.0),
              child: SizedBox(
                width: double.infinity,
                height: 40.0,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SignInScreen()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  child: const Text('Sign In',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18.0
                    ),),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
