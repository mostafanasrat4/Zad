import 'package:flutter/cupertino.dart';
import 'package:zad/models/classes/collections.dart';
import 'package:zad/models/classes/donations.dart';
import 'package:zad/models/interfaces/IDonationManager.dart';
import 'package:zad/models/services/firebase_services.dart';

class DonationManager  implements IDonationManager{
  final FirestoreService _firestoreService = FirestoreService();

  @override
  Future<void> createDonation(Donation myDonation) async{
   try{
     await _firestoreService.addData(collections().donations, myDonation.toMap());
   }catch(e){
     debugPrint(e.toString());
   }
  }

  @override
  Future<void> deleteDonation(Donation myDonation)async {
  try{
    var docID = await _firestoreService.getDocID(collections().donations, 'id', myDonation.id);
    await _firestoreService.deleteData(collections().donations, docID!);
  }catch(e){
    debugPrint(e.toString());
  }
  }

  @override
  Future<void> editDonation(Donation myDonation) async{
    try{
      await _firestoreService.updateData(collections().donations, myDonation.id, myDonation.toMap());
    }catch(e){
      debugPrint(e.toString());
    }
  }

  @override
  Future<List<Donation>> getDonationsByProjectID(String projectID) async{
    try{
      var donations = await _firestoreService.getList(collections().donations, 'projectId', projectID);
      List<Donation> donationsOBJ = [];
      for(var donation in donations){
        donationsOBJ.add(Donation.fromMap(donation));
      }
      return donationsOBJ;
    }catch(e){
      debugPrint(e.toString());
    }
    return [];

  }

  @override
  Future<List<Donation>> getDonationsByUserID(String userID) async{
    try{
      var donations = await _firestoreService.getList(collections().donations, 'userId', userID);
      List<Donation> donationsOBJ = [];
      for(var donation in donations){
        donationsOBJ.add(Donation.fromMap(donation));
      }
      return donationsOBJ;
    }catch(e){
      debugPrint(e.toString());
      return [];
    }
  }

}