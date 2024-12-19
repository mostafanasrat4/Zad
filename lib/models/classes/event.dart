//import 'package:cloud_firestore/cloud_firestore.dart';
//errors because no firestore package, cant add it because no wifi rn
//flutter pub add cloud_firestore

import 'package:cloud_firestore/cloud_firestore.dart';

class Event {
  String id; // primary key
  String userID; // foreign key of the owner beneficiary
  String name;
  String location;
  String description;
  DateTime date;
  String? type;
  List? SkillsNeeded;


  Event(this.name, this.description, this.date, this.id, this.location, this.userID, this.SkillsNeeded, this.type);
  factory Event.fromMap(Map<String, dynamic> map) {
    return Event(
      map['name'] ?? '',
      map['description'] ?? '',
      (map['date'] as Timestamp).toDate(),
      map['id'] ?? '',
      map['location'] ?? '',
      map['userID'] ?? '',
      List.from(map['SkillsNeeded']?.cast<String>() ?? []),
      map['type'] ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'userID': userID,
      'name': name,
      'location': location,
      'description': description,
      'date': date,
      'SkillsNeeded': SkillsNeeded,
      'type': type
    };
  }


}
