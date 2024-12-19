import 'package:zad/models/classes/user.dart';

class Donor extends User {
  Donor({
    required String id,
    String? fullName,
    String? email,
    String? phoneNo,
    String? imageURL,
    String? type= "donor",
  }) : super(id, fullName, email, phoneNo, imageURL, type);



  factory Donor.fromMap(Map<String, dynamic> map) {
    return Donor(
      id: map['id'] ?? '',
      fullName: map['name'],
      email: map['email'],
      phoneNo: map['phoneNo'],
      imageURL: map['imageURL'],
      type: map['type'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'fullName': fullName,
      'email': email,
      'phoneNo': phoneNo,
      'imageURL': imageURL,
      'type': type
    };
  }
}