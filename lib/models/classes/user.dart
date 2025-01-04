class User {
  String id; // pk
  String? fullName;
  String? email;
  String? phoneNo;
  String? imageURL;
  String? type;

  User({
    required this.id,
    required this.fullName,
    required this.email,
    required this.phoneNo,
    this.imageURL,
    required this.type
  });
  factory User.fromMap(Map<String, dynamic> map) => User(
        id: map['id'] ?? '',
        fullName: map['fullName'] ?? '',
        email: map['email'] ?? '',
        phoneNo: map['phoneNo'] ?? '',
        imageURL: map['imageURL'] ?? '',
        type: map['type'] ?? '',
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

