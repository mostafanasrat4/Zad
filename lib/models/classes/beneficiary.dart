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
    String? fullName,
    String? email,
    String? phoneNo,
    String? imageURL,
    String? type='beneficiary',
    required String id,
  }) : super(id, fullName, email, phoneNo, imageURL, type);

  factory Beneficiary.fromMap(Map<String, dynamic> map) {
    return Beneficiary(
      donationNeeded: map['donationNeeded'] ?? 0.0,
      donationReceived: map['donationReceived'] ?? 0.0,
      status: map['status'],
      reason: map['reason'],
      date: map['date'],
      location: map['location'],
      requiredDocuments: map['requiredDocuments'],
      fullName: map['fullName'],
      email: map['email'],
      phoneNo: map['phoneNo'],
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
      'fullName': fullName,
      'email': email,
      'phoneNo': phoneNo,
      'imageURL': imageURL,
      'type': type,
      'id': id,
    };
  }
}
