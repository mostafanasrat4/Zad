import 'package:zad/models/classes/user.dart';

class Admin extends User {
  Admin({
    required String id,
    String? name,
    String? email,
    String? number,
    String? imageURL,
    String? type= "admin",
  }) : super(id, name, email, number, imageURL, type);



  factory Admin.fromMap(Map<String, dynamic> map) {
    return Admin(
      id: map['id'] ?? '',
      name: map['name'],
      email: map['email'],
      number: map['number'],
      imageURL: map['imageURL'],
      type: map['type'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': fullName,
      'email': email,
      'number': phoneNo,
      'imageURL': imageURL,
      'type': type
    };
  }
}