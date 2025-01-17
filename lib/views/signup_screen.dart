import 'package:flutter/material.dart';
import 'package:zad/controllers/signup_facade.dart';
import 'package:zad/models/classes/user.dart';
import 'package:zad/views/signin_screen.dart';

import '../controllers/Image_adapter.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _phoneNoController = TextEditingController();

  final SignUpController _signUpController = SignUpController();

  String? _selectedType = 'donor';
  String? _imageURL;

  void _pickImage() async {

    final pickedImage = await ImageAdapter().pickAndCompressImageToString();
    setState(() {
      _imageURL = pickedImage;
    });
  }

  void _signUp() async {
    if (_selectedType == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please select a user type')),
      );
      return;
    }

    try {
      User user = User(
        id: '',
        fullName: _nameController.text,
        email: _emailController.text,
        phoneNo: _phoneNoController.text,
        type: _selectedType,
        imageURL: _imageURL,
      );

      await _signUpController.signUpFacade(user, _passwordController.text, context);
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('An error occurred: $e')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Sign Up')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            GestureDetector(
              onTap: _pickImage,
              child: CircleAvatar(
                radius: 50.0,
                backgroundColor: Colors.grey,

                child: _imageURL == null
                    ? const Icon(Icons.camera_alt, size: 50, color: Colors.white)
                    : null,
              ),
            ),
            const SizedBox(height: 20),
            DropdownButtonFormField<String>(
              value: _selectedType,
              onChanged: (value) => setState(() => _selectedType = value),
              items: const [
                DropdownMenuItem(value: 'donor', child: Text('Donor')),
                DropdownMenuItem(value: 'volunteer', child: Text('Volunteer')),
                DropdownMenuItem(value: 'beneficiary', child: Text('Beneficiary')),
                DropdownMenuItem(value: 'admin', child: Text('Admin')),
              ],
              decoration: const InputDecoration(labelText: 'User Type'),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: _nameController,
              decoration: const InputDecoration(labelText: 'Full Name'),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: _emailController,
              keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(labelText: 'Email'),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: _passwordController,
              obscureText: true,
              decoration: const InputDecoration(labelText: 'Password'),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: _phoneNoController,
              keyboardType: TextInputType.phone,
              decoration: const InputDecoration(labelText: 'Phone Number'),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: _signUp,
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 40.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              child: const Text('Sign Up', style: TextStyle(fontSize: 16)),
            ),
            const SizedBox(height: 20),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SignInScreen()),
                );
              },
              child: const Text('Already have an account? Sign in here!'),
            ),
          ],
        ),
      ),
    );
  }
}
