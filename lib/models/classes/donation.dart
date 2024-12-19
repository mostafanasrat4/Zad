import 'package:cloud_firestore/cloud_firestore.dart';

class Donation {
  String id;
  String beneficiaryID; //fk to owner of the event that got the donation
  String userId; // fk to user
  int amount;


  Donation(this.id, this.beneficiaryID, this.userId, this.amount);

  factory Donation.fromMap(Map<String, dynamic> map) {
    return Donation(
      map['id'] ?? '',
      map['beneficiaryID'] ?? '',
      map['userId'] ?? '',
      map['amount'] ?? 0,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'beneficiaryID': beneficiaryID,
      'userId': userId,
      'amount': amount,
    };
  }
}