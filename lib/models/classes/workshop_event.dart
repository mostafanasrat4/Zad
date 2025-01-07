import 'package:cloud_firestore/cloud_firestore.dart';
import 'event.dart';

class WorkshopEvent extends Event {
  final List<String> topics;

  WorkshopEvent({
    required String id,
    required String userID,
    required String name,
    required String location,
    required String description,
    required DateTime date,
    required List? SkillsNeeded,
    required this.topics,
    String? type = 'workshop',
  }) : super(name, description, date, id, location, userID, SkillsNeeded, type);

  factory WorkshopEvent.fromMap(Map<String, dynamic> map) {
    return WorkshopEvent(
      id: map['id'] ?? '',
      userID: map['userID'] ?? '',
      name: map['name'] ?? '',
      location: map['location'] ?? '',
      description: map['description'] ?? '',
      date: (map['date'] as Timestamp).toDate(), // Convert Timestamp to DateTime
      SkillsNeeded: List.from(map['SkillsNeeded']?.cast<String>() ?? []),
      topics: List.from(map['topics']?.cast<String>() ?? []),
      type: map['type'] ?? 'workshop',
    );
  }
}
