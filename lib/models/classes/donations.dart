import 'package:cloud_firestore/cloud_firestore.dart';

class Donation {
  String id;
  String beneficiaryID;
  String userId; // fk to user
  int amount;
  DateTime date;
  String? status;
  String Type;

  Donation(this.id, this.beneficiaryID, this.userId, this.amount, this.date, this.Type);

  factory Donation.fromMap(Map<String, dynamic> map) {
    return Donation(
      map['id'] ?? '',
      map['projectId'] ?? '',
      map['userId'] ?? '',
      map['amount'] ?? 0,
      (map['date'] as Timestamp).toDate(),
      map['Type'] ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'projectId': beneficiaryID,
      'userId': userId,
      'amount': amount,
      'date': date,
      'Type': Type
    };
  }
}