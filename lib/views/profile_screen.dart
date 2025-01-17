import 'package:flutter/material.dart';
import 'package:zad/controllers/profile_controller.dart';
import 'package:zad/controllers/signout_controller.dart';
import 'package:zad/models/classes/user.dart';
import 'package:zad/views/widgets/profile_header_decorator/profile_header.dart';
import 'package:zad/views/widgets/profile_header_decorator/profile_header_decorator.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();

}

class _ProfileScreenState extends State<ProfileScreen> {

  final ProfileController _profileController = ProfileController();
  late User? _currentUser = User(id: '', fullName: '', email: '', phoneNo: '', type: '');
  ProfileHeader _profileHeader = ConcreteProfileHeader(fullName: 'John Doe', imageUrl: "");

  @override
  void initState() {
    super.initState();
    setCurrentUser();
  }

  Future<void> setCurrentUser() async {
    User? user = await _profileController.getCurrentUser(context);
    setState(() {
      _currentUser = user;
      _profileHeader = ConcreteProfileHeader(
        fullName: _currentUser?.fullName ?? "John Doe",
        imageUrl: _currentUser?.imageURL ?? ""
      );
      if(_currentUser != null){
        switch(_currentUser?.type){
          case 'donor':
            _profileHeader = DonorBadgeDecorator(profileHeader: _profileHeader);
            break;
          case 'volunteer':
            _profileHeader = VolunteerBadgeDecorator(profileHeader: _profileHeader);
            break;
          case 'admin':
            _profileHeader = AdminBadgeDecorator(profileHeader: _profileHeader);
            break;
          case 'beneficiary':
            _profileHeader = BeneficiaryBadgeDecorator(profileHeader: _profileHeader);
            break;
        }
      }
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Profile'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _profileHeader.buildProfileHeader(),
            const SizedBox(height: 16.0),

            // Profile Details
            ProfileDetails(
                email: _currentUser?.email ?? "john.doe@example.com",
                phoneNo: _currentUser?.phoneNo ?? "01012345678",
                address: 'Cairo'
            ),
            const SizedBox(height: 16.0),
            // Profile Actions
            ProfileActions(),
          ],
        ),
      ),
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
  final SignOutController _signOutController = SignOutController();

  ProfileActions({super.key});

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
            _signOutController.signOut(context);
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
