import 'package:zad/models/classes/approval_context_state.dart';
import 'package:zad/models/classes/approved_state.dart';
import 'package:zad/models/classes/rejected_state.dart';

import 'user.dart';

class Beneficiary extends User {
  double donationNeeded;
  double donationReceived;
  ApprovalContext approvalContext;

  String? reason;
  String? date;
  String? location;
  String? requiredDocumentsID;

  // Constructor for Beneficiary
  Beneficiary({
    required this.donationNeeded,
    required this.donationReceived,
    this.reason,
    this.date,
    this.location,
    this.requiredDocumentsID,
    String? fullName,
    String? email,
    String? phoneNo,
    String? imageURL,
    String? type = 'beneficiary',
    required String id,
  })  : approvalContext = ApprovalContext(),  // Initialize the state context
        super(id: id, fullName: fullName, email: email, phoneNo: phoneNo, imageURL: imageURL, type: type);


  factory Beneficiary.fromMap(Map<String, dynamic> map) {
    var beneficiary = Beneficiary(
      donationNeeded: map['donationNeeded'] ?? 0.0,
      donationReceived: map['donationReceived'] ?? 0.0,
      reason: map['reason'],
      date: map['date'],
      location: map['location'],
      requiredDocumentsID: map['requiredDocumentsID'],
      fullName: map['fullName'],
      email: map['email'],
      phoneNo: map['phoneNo'],
      imageURL: map['imageURL'],
      type: map['type'],
      id: map['id'] ?? '',
    );

    if (map['status'] == 'approved') {
      beneficiary.approvalContext.setState(beneficiary.approvalContext.approvedState);
    } else if (map['status'] == 'rejected') {
      beneficiary.approvalContext.setState(beneficiary.approvalContext.rejectedState);
    } else {
      beneficiary.approvalContext.setState(beneficiary.approvalContext.pendingState);
    }

    return beneficiary;
  }

  @override
  Map<String, dynamic> toMap() {
    return {
      'donationNeeded': donationNeeded,
      'donationReceived': donationReceived,
      'status': approvalContext.currentState is ApprovedState
          ? 'approved'
          : approvalContext.currentState is RejectedState
          ? 'rejected'
          : 'pending',
      'reason': reason,
      'date': date,
      'location': location,
      'requiredDocumentsID': requiredDocumentsID,
      'fullName': fullName,
      'email': email,
      'phoneNo': phoneNo,
      'imageURL': imageURL,
      'type': type,
      'id': id,
    };
  }
}
