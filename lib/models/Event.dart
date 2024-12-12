//import 'package:cloud_firestore/cloud_firestore.dart';
//errors because no firestore package, cant add it because no wifi rn
//flutter pub add cloud_firestore


class Event {
  String id; // primary key
  String userID; // foreign key
  String name;
  String location;
  String description;
  DateTime date;
  List? SkillsNeeded;

  Event(this.name, this.description, this.date, this.id, this.location, this.userID, this.SkillsNeeded);

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'userID': userID,
      'name': name,
      'location': location,
      'description': description,
      'date': date,
      'SkillsNeeded': SkillsNeeded// save as DateTime, can be converted to Timestamp in Firestore
    };
  }

  Event.fromMap(Map<String, dynamic> map)
      : id = map['id'] ?? '',
        userID = map['userID'] ?? '',
        name = map['name'] ?? '',
        location = map['location'] ?? '',
        description = map['description'] ?? '',
        SkillsNeeded = map['SkillsNeeded'],
        date = map['date'] is Timestamp
            ? (map['date'] as Timestamp).toDate()  // Convert Timestamp to DateTime
            : map['date'] is DateTime
            ? map['date'] // If it's already DateTime, use it directly
            : DateTime.now();// Default to current date if it's null or invalid
}
