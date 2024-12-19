import 'user.dart';

class Beneficiary extends User {
  double donationNeeded;
  double donationReceived;
  String? status = 'pending';
  String? reason;
  String? date;
  String? location;
  String? requiredDocuments;

  Beneficiary({
    required this.donationNeeded,
    required this.donationReceived,
    this.status,
    this.reason,
    this.date,
    this.location,
    this.requiredDocuments,
    String? name,
    String? email,
    String? number,
    String? imageURL,
    String? type='beneficiary',
    required String id,
  }) : super(id, name, email, number, imageURL, type);

  factory Beneficiary.fromMap(Map<String, dynamic> map) {
    return Beneficiary(
      donationNeeded: map['donationNeeded'] ?? 0.0,
      donationReceived: map['donationReceived'] ?? 0.0,
      status: map['status'],
      reason: map['reason'],
      date: map['date'],
      location: map['location'],
      requiredDocuments: map['requiredDocuments'],
      name: map['name'],
      email: map['email'],
      number: map['number'],
      imageURL: map['imageURL'],
      type: map['type'],
      id: map['id'] ?? '',
    );
  }

  @override
  Map<String, dynamic> toMap() {
    return {
      'donationNeeded': donationNeeded,
      'donationReceived': donationReceived,
      'status': status,
      'reason': reason,
      'date': date,
      'location': location,
      'requiredDocuments': requiredDocuments,
      'name': name,
      'email': email,
      'number': number,
      'imageURL': imageURL,
      'type': type,
      'id': id,
    };
  }
}
