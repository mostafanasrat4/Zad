import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {

  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // TODO: Profile Header Card (To be wrapped with proper decorators)
            ProfileHeader(),
            const SizedBox(height: 16.0),

            // Profile Details
            ProfileDetails(email: 'mostafanasrat@gmail.com', phoneNo: '01094944737', address: 'Cairo'),
            const SizedBox(height: 16.0),
            // Profile Actions
            ProfileActions(),
          ],
        ),
      ),
    );
  }
}

class ProfileHeader extends StatelessWidget {

  const ProfileHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          radius: 60,
          backgroundImage: AssetImage('assets/profile_picture.png'), // Replace with your image
        ),
        const SizedBox(height: 8.0),
        Text(
          'Mostafa Nasrat',
          style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold
          ),
        ),
      ],
    );
  }
}

class ProfileDetails extends StatelessWidget {
  final String email;
  final String phoneNo;
  final String address;

  const ProfileDetails({
    super.key,
    required this.email,
    required this.phoneNo,
    required this.address,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Email Details
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Row(
                children: [
                  Icon(
                      Icons.email,
                      color: Colors.blue
                  ),
                  const SizedBox(width: 16.0),
                  Text(
                    'Email:',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(width: 8.0),
                  Expanded(
                    child: Text(
                      email,
                      style: TextStyle(color: Colors.black),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Row(
                children: [
                  Icon(
                      Icons.phone,
                      color: Colors.blue
                  ),
                  const SizedBox(width: 16.0),
                  Text(
                    'Phone:',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(width: 8.0),
                  Expanded(
                    child: Text(
                      phoneNo,
                      style: TextStyle(color: Colors.black),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Row(
                children: [
                  Icon(
                      Icons.location_city,
                      color: Colors.blue
                  ),
                  const SizedBox(width: 16.0),
                  Text(
                    'Address:',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(width: 8.0),
                  Expanded(
                    child: Text(
                      // TODO: add address field to User class
                      'Cairo',
                      style: TextStyle(color: Colors.black),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ProfileActions extends StatelessWidget {

  const ProfileActions({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        ElevatedButton.icon(
          onPressed: () {
            // TODO: Add edit profile screen and navigate to it
          },
          icon: Icon(Icons.edit),
          label: Text('Edit Profile'),
        ),
        ElevatedButton.icon(
          onPressed: () {
            // TODO: perform logout using logout controller
          },
          icon: Icon(Icons.logout),
          label: Text('Logout'),
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.red,
          ),
        ),
      ],
    );
  }
}
