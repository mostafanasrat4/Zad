import 'package:flutter/cupertino.dart';
import 'package:zad/models/classes/collections.dart';
import 'package:zad/models/classes/donor.dart';
import 'package:zad/models/services/firebase_services.dart';
import '../interfaces/IDonor_manager.dart';

class DonorManager implements IDonorManager{
  final FirestoreService _firestoreService = FirestoreService();
  @override
  Future<donor?> FindDonorByNumber(String number)async {
    try{
      var don = await _firestoreService.getDocumentByAttribute(collections().donors, 'number', number);
      donor myDonor = donor.fromMap(don!);
      return  myDonor;
    }catch(e){
      debugPrint(e.toString());
      return null;
    }
  }

  @override
  Future<void> createDonor(donor myUser) async{
    try {
      _firestoreService.addData(collections().donors, myUser.toMap());
      print('donor created successfully');
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  Future<void> deleteDonor(donor myUser)async {
    String? docID = await _firestoreService.getDocID(collections().user, 'id', myUser.id);
    await _firestoreService.deleteData(collections().user, docID!);
  }

  @override
  Future<void> editDonor(donor myUser)async {
    String? docID =
        await _firestoreService.getDocID(collections().user, 'id', myUser.id);
    await _firestoreService.updateData(
        collections().user, docID!, myUser.toMap());
  }

  @override
  Future<donor?> getDonorByUserID(String userID) async{
    try {
      var user = await _firestoreService.getDocumentByAttribute(collections().user, 'id', userID);
      donor myUser = donor.fromMap(user!);
      return myUser;

    } catch (e) {
      print(e.toString());
      print('error getting the user');
    }
    return null;
  }

}