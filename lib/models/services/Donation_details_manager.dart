import 'package:flutter/material.dart';
import 'package:zad/models/classes/collections.dart';
import 'package:zad/models/classes/donation_details.dart';
import 'package:zad/models/interfaces/IDonation_details.dart';
import 'package:zad/models/services/donation_manager.dart';
import 'package:zad/models/services/firebase_services.dart';





class DonationDetailsManager implements IDonationDetailsManager{
  final FirestoreService _firestoreService = FirestoreService();
  @override
  Future<void> createDonationDetails(DonationDetails myDonation)async {
    try{
      _firestoreService.addData(collections().donationDetails, myDonation.toMap());
    }catch(e){
      debugPrint(e.toString());
    }
  }


  // don't use DELETE!!!!!!!!!!
  @override
  Future<void> deleteDonationDetails(String ID) async{
    try{
      await _firestoreService.deleteData(collections().donationDetails, ID);
    }catch(e){
      debugPrint(e.toString());
    }
  }

  @override
  Future<void> editDonationDetails(DonationDetails myDonation)async {
    try{
     var docID = await _firestoreService.getDocID(collections().donationDetails, 'id', myDonation.id);
     if(docID != null) {
       await _firestoreService.updateData(
           collections().donationDetails, docID!, myDonation.toMap());
     }else{
       throw Exception('document does not exist');
     }
    }catch(e){
      debugPrint(e.toString());
    }
  }

  @override
  Future<DonationDetails?> getDonationDetails(String id) async{
    try{
      var result =await _firestoreService.getDocumentByAttribute(collections().donationDetails, 'id', id);
      return DonationDetails.fromMap(result!);
    }catch(e){
      debugPrint(e.toString());
      return null;
    }
  }



}