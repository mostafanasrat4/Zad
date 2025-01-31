import 'user.dart';
// use selectors for skills and availability to control values

class Volunteer extends User {
  List<String> skills;
  List<DateTime> availability;
  List<String> preferrences = [];
  List<String> registeredEvents;
  Volunteer({
    required String id,
    String? fullName,
    String? email,
    String? phoneNo,
    String? imageURL,
    String? type = 'volunteer',
    required this.registeredEvents,
    required this.skills,
    required this.availability,
    required this.preferrences,
  }) : super(
            id: id,
            fullName: fullName,
            email: email,
            phoneNo: phoneNo,
            imageURL: imageURL,
            type: type);

  factory Volunteer.fromMap(Map<String, dynamic> map) {
    return Volunteer(
      id: map['id'] ?? '',
      fullName: map['fullName'],
      email: map['email'],
      phoneNo: map['phoneNo'],
      imageURL: map['imageURL'],
      type: map['type'],
      registeredEvents: List<String>.from(map['registeredEvents'] ?? []),
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
      'fullName': fullName,
      'email': email,
      'phoneNo': phoneNo,
      'imageURL': imageURL,
      'type': type,
      'skills': skills,
      'availability': availability.map((e) => e.toIso8601String()).toList(),
      'preferrences': preferrences,
      'registeredEvents': registeredEvents,
    };
  }
}
