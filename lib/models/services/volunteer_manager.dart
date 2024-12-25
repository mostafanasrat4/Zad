import 'package:flutter/material.dart';
import 'package:zad/models/classes/collections.dart';
import 'package:zad/models/classes/user.dart';
import 'package:zad/models/classes/volunteer.dart';
import 'package:zad/models/interfaces/IUserManager.dart';
import 'package:zad/models/services/firebase_services.dart';

class VolunteerManager implements IUserManager {


  final FirestoreService _firestoreService = FirestoreService();

  @override
  Future<void> createUser(myVolunteer) async{
    if(myVolunteer is Volunteer){
      throw ArgumentError('Volunteer must be of type Volunteer');
      return;
    }
   try{
     await _firestoreService.addData(collections().volunteers, myVolunteer.toMap());
   }catch(e){
     debugPrint(e.toString());
   }
  }

  @override
  Future<void> editUser(myVolunteer)  async{
    if(myVolunteer is  !Volunteer){
      throw ArgumentError('Volunteer must be of type Volunteer');
      return;
    }
    try{
      var docID = await _firestoreService.getDocID(collections().volunteers, 'id', myVolunteer.id);
      await _firestoreService.updateData(collections().volunteers, docID!, myVolunteer.toMap());
    }catch(e){
      debugPrint(e.toString());
    }
  }

  @override
  Future<Volunteer?> getUserByUserID(String id) async {
    try{
      var docID = await _firestoreService.getDocID(collections().volunteers, 'id', id);
      var result = await _firestoreService.getDocument(collections().volunteers, docID!);
      return Volunteer.fromMap(result!);
    }catch(e){
      debugPrint(e.toString());
      return null;
    }
  }

  @override
  Future<List<Volunteer>> getVolunteers() async {
    try{
      var result = await _firestoreService.getData(collections().volunteers);
      return result.map((e) => Volunteer.fromMap(e)).toList();
    }catch(e){
      debugPrint(e.toString());
      return [];
    }
  }

  @override
  Future<void> removeVolunteer(String id) async {
    try{
      var docID = await _firestoreService.getDocID(collections().volunteers, 'id', id);
      await _firestoreService.deleteData(collections().volunteers, docID!);
    }catch(e){
      debugPrint(e.toString());
    }
  }

  @override
  Future<User?> FindUserByNumber(String number) {
    // TODO: implement FindUserByNumber
    throw UnimplementedError();
  }


  @override
  Future<void> deleteUser(myUser) {
    // TODO: implement deleteUser
    throw UnimplementedError();
  }


}