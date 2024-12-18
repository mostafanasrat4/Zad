//toDo: remove debug prints

import 'package:flutter/material.dart';
import 'package:zad/models/classes/beneficiary.dart';
import 'package:zad/models/classes/collections.dart';
import 'package:zad/models/classes/beneficiary.dart';
import 'package:zad/models/interfaces/IBeneficiaryManager.dart';
import 'package:zad/models/services/firebase_services.dart';

class BenficiaryManager implements IBeneficiaryManager{
  final FirestoreService _firestoreService = FirestoreService();

  @override
  Future<void> ApproveBeneficiary(String id)async {
    try{
      var docID = await _firestoreService.getDocID(collections().beneficiary, 'id', id);
      await _firestoreService.updateSingelAtt(collections().beneficiary, docID!, 'status', 'approved');
    }
    catch(e){
      debugPrint(e.toString());
    }
  }

  @override
  Future<void> createBeneficiary(beneficiary myBeneficiary) async{
    try{
      await _firestoreService.addData(collections().beneficiary, myBeneficiary.toMap());
    }catch(e){
      debugPrint(e.toString());
    }
  }

  @override
  Future<void> disapproveBeneficiary(String id) async{
    try{
      var docID = await _firestoreService.getDocID(collections().beneficiary, 'id', id);
      await _firestoreService.updateSingelAtt(collections().beneficiary, docID!, 'status', 'disapproved');
    }
    catch(e){
      debugPrint(e.toString());
    }
  }

  @override
  Future<void> editBeneficiary(beneficiary myBeneficiary) async{
    try{
      var docID = await _firestoreService.getDocID(collections().beneficiary, 'id', myBeneficiary.id);
      await _firestoreService.updateData(collections().beneficiary, docID!, myBeneficiary.toMap());
    }
    catch(e){
      debugPrint(e.toString());
    }
  }

  @override
  Future<List<beneficiary>> getApprovedBeneficiaries(String status) async {
    try{
      var result = await _firestoreService.getList(collections().beneficiary, status, 'approved');
      List<beneficiary> beneficiaries = [];
      for(var item in result){
        beneficiaries.add(beneficiary.fromMap(item));
      }
      return beneficiaries;
    }
    catch(e){
      debugPrint(e.toString());
      return [];
    }
  }

  @override
  Future<List<beneficiary>> getBeneficiaries()async {
    try {
      var result = await _firestoreService.getCollection(
          collections().beneficiary);
      List<beneficiary> beneficiaries = [];
      for (var item in result) {
        beneficiaries.add(beneficiary.fromMap(item));
      }
      return beneficiaries;
    }catch(e){
      debugPrint(e.toString());
      return [];
    }

    }


  @override
  Future<beneficiary?> getBeneficiary(String id) async{
    try{
      var result = await _firestoreService.getDocumentByAttribute(collections().beneficiary,'id' ,id);
      return beneficiary.fromMap(result!);
    }
    catch(e){
      debugPrint(e.toString());
      return null;
    }
  }

  @override
  Future<List<beneficiary>> getDisapprovedBeneficiaries(String status) async{
    try{
      var result = await _firestoreService.getList(collections().beneficiary, status, 'disapproved');
      List<beneficiary> beneficiaries = [];
      for(var item in result){
        beneficiaries.add(beneficiary.fromMap(item));
      }
      return beneficiaries;
    }
    catch(e){
      debugPrint(e.toString());
      return [];
    }
  }

  @override
  Future<List<beneficiary>> getPendingBeneficiaries(String status) async {
    try{
      var result = await _firestoreService.getList(collections().beneficiary, status, 'pending');
      List<beneficiary> beneficiaries = [];
      for(var item in result){
        beneficiaries.add(beneficiary.fromMap(item));
      }
      return beneficiaries;
    }
    catch(e){
      debugPrint(e.toString());
      return [];
    }
  }

  @override
  Future<void> removeBeneficiary(String id)async {
    try{
      var docID = await _firestoreService.getDocID(collections().beneficiary, 'id', id);
      await _firestoreService.deleteData(collections().beneficiary, docID!);
    }
    catch(e){
      debugPrint(e.toString());
    }
  }
}