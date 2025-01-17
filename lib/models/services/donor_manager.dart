import 'package:flutter/cupertino.dart';
import 'package:zad/models/classes/collections.dart';
import 'package:zad/models/classes/donor.dart';
import 'package:zad/models/interfaces/IUserManager.dart';
import 'package:zad/models/services/firebase_services.dart';


class DonorManager implements IUserManager{
  final FirestoreService _firestoreService = FirestoreService();
  @override
  Future<Donor?> FindUserByNumber(String number)async {
    try{
      var don = await _firestoreService.getDocumentByAttribute(collections().donors, 'number', number);
      Donor myDonor = Donor.fromMap(don!);
      return  myDonor;
    }catch(e){
      debugPrint(e.toString());
      return null;
    }
  }

  @override
  Future<void> createUser(myUser) async{
    if(myUser is !Donor){
      throw ArgumentError('User must be of type Donor');
      return;
    }
    try {
      await _firestoreService.addData(collections().donors, myUser.toMap());
      print('donor created successfully');
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  Future<void> deleteUser(myUser)async {
    if(myUser is !Donor){
      throw ArgumentError('User must be of type Donor');
      return;
    }
    try {
      String? docID = await _firestoreService.getDocID(
          collections().user, 'id', myUser.id);
      await _firestoreService.deleteData(collections().user, docID!);
    }catch(e){
      debugPrint(e.toString());
    }
  }

  @override
  Future<void> editUser( myUser)async {
    if(myUser is !Donor){
      throw ArgumentError('User must be of type Donor');
      return;
    }
    try {
      String? docID =
      await _firestoreService.getDocID(collections().user, 'id', myUser.id);
      await _firestoreService.updateData(
          collections().user, docID!, myUser.toMap());
    }catch(e){
      debugPrint(e.toString());
    }
  }

  @override
  Future<Donor?> getUserByUserID(String userID) async{
    try {
      var user = await _firestoreService.getDocumentByAttribute(collections().user, 'id', userID);
      Donor myUser = Donor.fromMap(user!);
      return myUser;

    } catch (e) {
      print(e.toString());
      print('error getting the user');
    }
    return null;
  }

}