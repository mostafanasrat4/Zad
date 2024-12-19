import 'package:flutter/material.dart';
import 'package:zad/models/classes/collections.dart';
import 'package:zad/models/classes/volunteer.dart';
import 'package:zad/models/interfaces/IVolunteerManager.dart';
import 'package:zad/models/services/firebase_services.dart';

class VolunteerManager implements IVolunteerManager {


  final FirestoreService _firestoreService = FirestoreService();

  @override
  Future<void> createVolunteer(Volunteer myVolunteer) async{
   try{
     await _firestoreService.addData(collections().volunteers, myVolunteer.toMap());
   }catch(e){
     debugPrint(e.toString());
   }
  }

  @override
  Future<void> editVolunteer(Volunteer myVolunteer)  async{
    try{
      var docID = await _firestoreService.getDocID(collections().volunteers, 'id', myVolunteer.id);
      await _firestoreService.updateData(collections().volunteers, docID!, myVolunteer.toMap());
    }catch(e){
      debugPrint(e.toString());
    }
  }

  @override
  Future<Volunteer?> getVolunteer(String id) async {
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


}