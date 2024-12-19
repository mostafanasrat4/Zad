import 'package:cloud_firestore/cloud_firestore.dart';

class DonationDetails {
  String id;
  DateTime date;
  String? status;
  String paymentMethod;

  DonationDetails(this.id, this.date, this.paymentMethod);

  factory DonationDetails.fromMap(Map<String, dynamic> map) {
    return DonationDetails(
      map['id'] ?? '',
      (map['date'] as Timestamp).toDate(),
      map['paymentMethod'] ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'date': date,
      'Type': paymentMethod
    };
  }
}