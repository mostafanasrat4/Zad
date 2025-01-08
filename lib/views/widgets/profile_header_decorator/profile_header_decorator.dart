import 'package:flutter/material.dart';
import 'package:zad/views/widgets/profile_header_decorator/profile_header.dart';

// Decorator Base Class
class ProfileHeaderDecorator implements ProfileHeader{
  final ProfileHeader profileHeader;

  ProfileHeaderDecorator({required this.profileHeader});

  @override
  Widget buildProfileHeader(){
    return profileHeader.buildProfileHeader();
  }
}


// Donor Badge Decorator
class DonorBadgeDecorator extends ProfileHeaderDecorator {
  DonorBadgeDecorator({required super.profileHeader});

  @override
  Widget buildProfileHeader() {
    return Stack(
      children: [
        super.buildProfileHeader(),
        Positioned(
          top: 0,
          right: 0,
          child: AnimatedContainer(
            duration: Duration(seconds: 2),
            padding: EdgeInsets.symmetric(
                horizontal: 8,
                vertical: 4
            ),
            decoration: BoxDecoration(
              color: Colors.greenAccent,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              children: [
                Icon(
                    Icons.favorite,
                    color: Colors.red,
                    size: 16
                ),
                SizedBox(width: 4),
                Text(
                  'Donor',
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

// Volunteer Badge Decorator
class VolunteerBadgeDecorator extends ProfileHeaderDecorator {
  VolunteerBadgeDecorator({required super.profileHeader});

  @override
  Widget buildProfileHeader() {
    return Stack(
      children: [
        super.buildProfileHeader(),
        Positioned(
          bottom: 0,
          right: 0,
          child: AnimatedContainer(
            duration: Duration(seconds: 2),
            padding: EdgeInsets.symmetric(
                horizontal: 8,
                vertical: 4
            ),
            decoration: BoxDecoration(
              color: Colors.orangeAccent,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              children: [
                Icon(
                    Icons.handshake,
                    color: Colors.white,
                    size: 16
                ),
                SizedBox(width: 4),
                Text(
                  'Volunteer',
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

// Admin Badge Decorator
class AdminBadgeDecorator extends ProfileHeaderDecorator {
  AdminBadgeDecorator({required super.profileHeader});

  @override
  Widget buildProfileHeader() {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.blueAccent, width: 3),
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.blueAccent.withOpacity(0.5),
            blurRadius: 8,
            spreadRadius: 4,
          ),
        ],
      ),
      child: Column(
        children: [
          super.buildProfileHeader(),
          SizedBox(height: 8),
          Text(
            'Admin',
            style: TextStyle(
                color: Colors.blue,
                fontWeight: FontWeight.bold,
                fontSize: 16
            ),
          ),
        ],
      ),
    );
  }
}

// Beneficiary Badge Decorator
class BeneficiaryBadgeDecorator extends ProfileHeaderDecorator {
  BeneficiaryBadgeDecorator({required super.profileHeader});

  @override
  Widget buildProfileHeader() {
    return Stack(
      children: [
        super.buildProfileHeader(),
        Positioned(
          left: 0,
          top: 0,
          child: AnimatedContainer(
            duration: Duration(seconds: 2),
            padding: EdgeInsets.symmetric(
                horizontal: 8,
                vertical: 4
            ),
            decoration: BoxDecoration(
              color: Colors.purpleAccent,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              children: [
                Icon(
                    Icons.people,
                    color: Colors.white,
                    size: 16
                ),
                SizedBox(width: 4),
                Text(
                  'Beneficiary',
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}