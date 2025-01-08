import 'package:flutter/material.dart';

// Base Profile Header Interface
abstract class ProfileHeader {
  Widget buildProfileHeader();
}

// Concrete Profile Header Implementation
class ConcreteProfileHeader implements ProfileHeader{

  final String fullName;
  final String? imageUrl;

  ConcreteProfileHeader({
    required this.fullName,
    required this.imageUrl,
  });

  @override
  Widget buildProfileHeader() {
    return Column(
      children: [
        CircleAvatar(
          radius: 60,
          backgroundImage: (imageUrl != null && imageUrl != '')
              ? NetworkImage(imageUrl!)
              : AssetImage('assets/profile_picture.png') as ImageProvider,
        ),
        const SizedBox(height: 8.0),
        Text(
          fullName,
          style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold
          ),
        ),
      ],
    );
  }

}