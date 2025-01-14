import 'package:cloud_firestore/cloud_firestore.dart';

import 'event.dart';

class FundraiserEvent extends Event {
  final double goalAmount;

  FundraiserEvent({
    required String id,
    required String userID,
    required String name,
    required String location,
    required String description,
    required DateTime date,
    required this.goalAmount,
    List? SkillsNeeded,
    String? type = 'fundraiser',
  }) : super(name, description, date, id, location, userID, SkillsNeeded, type);

  factory FundraiserEvent.fromMap(Map<String, dynamic> map) {
    return FundraiserEvent(
      id: map['id'] ?? '',
      userID: map['userID'] ?? '',
      name: map['name'] ?? '',
      location: map['location'] ?? '',
      description: map['description'] ?? '',
      date: (map['date'] as Timestamp).toDate(), // Convert Timestamp to DateTime
      goalAmount: (map['goalAmount'] ?? 0.0).toDouble(),
      SkillsNeeded: List.from(map['SkillsNeeded']?.cast<String>() ?? []),
      type: map['type'] ?? 'fundraiser',
    );
  }
}
