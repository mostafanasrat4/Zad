import 'users.dart';
// use selectors for skills and availability to control values

class Volunter extends User {
  List<String> skills;
  List<DateTime> availability;
  List<String> preferrences = [];


  Volunter({
    required String id,
    String? name,
    String? email,
    String? number,
    String? imageURL,
    String? type,
    required this.skills,
    required this.availability,
    required this.preferrences,
  }) : super(id, name, email, number, imageURL, type);


  factory Volunter.fromMap(Map<String, dynamic> map) {
    return Volunter(
      id: map['id'] ?? '',
      name: map['name'],
      email: map['email'],
      number: map['number'],
      imageURL: map['imageURL'],
      type: map['type'],
      skills: List<String>.from(map['skills'] ?? []),
      availability: List<DateTime>.from(
        (map['availability'] ?? []).map((e) => DateTime.parse(e)),
      ),
      preferrences: List<String>.from(map['preferrences'] ?? []),
    );
  }


  @override
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'number': number,
      'imageURL': imageURL,
      'type': type,
      'skills': skills,
      'availability': availability.map((e) => e.toIso8601String()).toList(),
      'preferrences': preferrences
    };
  }

}
