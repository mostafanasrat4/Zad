import 'package:flutter/material.dart';
import 'package:zad/controllers/signin_with_email.dart';
import 'package:zad/views/signup_screen.dart';
// TODO: based on user type navigate replacement to a different screen, save user id in shared preferences and use it across the app
class SignInScreen extends StatelessWidget {

  SignInScreen({super.key});

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            // "Welcome Back!" Container
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
                  'Welcome Back!',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 40.0,
                    fontWeight: FontWeight.bold
                  ),
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
            const SizedBox(height: 40,),
            // Sign in button
            Padding(
              padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width/10.0),
              child: SizedBox(
                width: double.infinity,
                height: 40.0,
                child: ElevatedButton(
                  onPressed: () async{
                    // TODO: Replace this line with a call to a method from the controller (Don't call AuthService directly)
                    SignInWithEmail().signIN(emailController.text, passwordController.text);

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
            const SizedBox(height: 30.0),
            // "Or Sign in With" label
            const Text(
              'Or sign in with',
              style: TextStyle(
                fontSize: 14,
              ),
            ),
            const SizedBox(height: 8.0),
            // Other sign in methods
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 48.0,
                  height: 48.0,
                  child: IconButton(
                    icon: Image.asset('assets/images/google_logo.png'),
                    onPressed: () {
                      debugPrint('Google login');
                    },
                  ),
                ),

                const SizedBox(width: 10.0),
                SizedBox(
                  width: 48.0,
                  height: 48.0,
                  child: IconButton(
                    icon: Image.asset('assets/images/microsoft_logo.png'),
                    onPressed: () {
                      debugPrint('Microsoft login');
                    },
                  ),
                ),
                const SizedBox(width: 10.0),
                SizedBox(
                  width: 48.0,
                  child: IconButton(
                    icon: Image.asset('assets/images/apple_logo.png'),
                    onPressed: () {
                      debugPrint('Apple login');
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(height: 40.0),
            // "Sign Up" label
            const Text(
              'Don\'t have an account? Sign up below!',
              style: TextStyle(fontSize: 14.0),
            ),
            const SizedBox(height: 8.0),
            // Sign up button
            Padding(
              padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width/10.0),
              child: SizedBox(
                width: double.infinity,
                height: 40.0,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SignUpScreen()),
                    );
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
          ],
        ),
      ),
    );
  }
}
