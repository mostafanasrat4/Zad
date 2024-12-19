class User {
  String id; // pk
  String? fullName;
  String? email;
  String? phoneNo;
  String? imageURL;
  String? type;

  User(this.id, this.fullName, this.email, this.phoneNo, this.imageURL, this.type);
  factory User.fromMap(Map<String, dynamic> map) => User(
        map['id'] ?? '',
        map['name'] ?? '',
        map['email'] ?? '',
        map['number'] ?? '',
        map['imageURL'] ?? '',
        map['type'] ?? '',
      );

  Map<String, dynamic> toMap() => {
        'id': id,
        'name': fullName,
        'email': email,
        'number': phoneNo,
        'imageURL': imageURL,
        'type': type,
      };

}

