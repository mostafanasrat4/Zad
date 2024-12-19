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
        map['fullName'] ?? '',
        map['email'] ?? '',
        map['phoneNo'] ?? '',
        map['imageURL'] ?? '',
        map['type'] ?? '',
      );

  Map<String, dynamic> toMap() => {
        'id': id,
        'fullName': fullName,
        'email': email,
        'phoneNo': phoneNo,
        'imageURL': imageURL,
        'type': type,
      };

}

