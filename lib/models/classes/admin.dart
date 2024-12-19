import 'package:zad/models/classes/user.dart';

class admin extends User {
  admin({
    required String id,
    String? name,
    String? email,
    String? number,
    String? imageURL,
    String? type= "donor",
  }) : super(id, name, email, number, imageURL, type);



  factory admin.fromMap(Map<String, dynamic> map) {
    return admin(
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
      'name': name,
      'email': email,
      'number': number,
      'imageURL': imageURL,
      'type': type
    };
  }
}