import 'users.dart';

class beneficiary extends User {
  double DonationNeeded;
  double DonationGiven;
  String? status = 'pending';
  String? reason;
  String? date;
  String? location;
  String? requiredDocuments;

  beneficiary({
    required this.DonationNeeded,
    required this.DonationGiven,
    this.status,
    this.reason,
    this.date,
    this.location,
    this.requiredDocuments,
    String? name,
    String? email,
    String? number,
    String? imageURL,
    String? type,
    required String id,
  }) : super(id, name, email, number, imageURL, type);

  factory beneficiary.fromMap(Map<String, dynamic> map) {
    return beneficiary(
      DonationNeeded: map['DonationNeeded'] ?? 0.0,
      DonationGiven: map['DonationGiven'] ?? 0.0,
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
      'DonationNeeded': DonationNeeded,
      'DonationGiven': DonationGiven,
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
