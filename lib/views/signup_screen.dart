import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import 'package:zad/controllers/Image_adapter.dart';
import 'package:zad/controllers/signup_facade.dart';
import 'package:zad/models/classes/user.dart';
import 'package:zad/views/signin_screen.dart';

class SignUpScreen extends StatefulWidget {

  SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _nameController = TextEditingController();

  final TextEditingController _emailController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();

  final TextEditingController _phoneNoController = TextEditingController();

  final SignUpController _signUpController = SignUpController();

  final _uuid = Uuid();

  @override
  Widget build(BuildContext context) {
    String? selectedValue;
    var imgURL;
    var imagee;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            GestureDetector(
              child: CircleAvatar(
                radius: 50.0,
                backgroundColor: Colors.black,
                backgroundImage: imgURL == null ? null : MemoryImage(imagee),
              ),
              onTap: (){
                imgURL = ImageAdapter().pickAndCompressImageToString();
                imagee = ImageAdapter().stringToImage(imgURL);
              },
            ),
            DropdownMenu<String>(
              initialSelection: selectedValue,
              onSelected: (value) {
                // Update the state when a value is selected
                setState(() {
                  selectedValue = value;
                });
                print('Selected value: $value');
              },
              dropdownMenuEntries: [
                DropdownMenuEntry(value: 'volunteer', label: 'Volunteer'),
                DropdownMenuEntry(value: 'donor', label: 'Donor'),
                DropdownMenuEntry(value: 'admin', label: 'Admin'),
                DropdownMenuEntry(value: 'beneficiary', label: 'Beneficiary'),
              ],
            ),
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
                controller: _nameController,
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
                controller: _emailController,
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
                controller: _passwordController,
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
                controller: _phoneNoController,
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
                    try {
                      User user = User(
                          id: '',
                          fullName: _nameController.text,
                          email: _emailController.text,
                          phoneNo: _phoneNoController.text,
                          type: selectedValue,
                          imageURL: imgURL
                      );
                      _signUpController.signUpFacade(user, _passwordController.text, context);
                    } catch (e) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('An error occurred: $e')),
                      );
                    }
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
