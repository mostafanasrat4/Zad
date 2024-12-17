class User {
  String id; // pk
  String? name;
  String? email;
  String? number;
  String? imageURL;
  String? type;

  User(this.id, this.name, this.email, this.number, this.imageURL, this.type);
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
        'name': name,
        'email': email,
        'number': number,
        'imageURL': imageURL,
        'type': type,
      };

}

