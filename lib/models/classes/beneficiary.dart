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
    String? type,
    required String id,
  }) : super(id, name, email, number, imageURL, type);

  factory Beneficiary.fromMap(Map<String, dynamic> map) {
    return Beneficiary(
      donationNeeded: map['DonationNeeded'] ?? 0.0,
      donationReceived: map['DonationGiven'] ?? 0.0,
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
      'DonationNeeded': donationNeeded,
      'DonationGiven': donationReceived,
      'status': status,
      'reason': reason,
      'date': date,
      'location': location,
      'requiredDocuments': requiredDocuments,
      'name': fullName,
      'email': email,
      'number': phoneNo,
      'imageURL': imageURL,
      'type': type,
      'id': id,
    };
  }
}
