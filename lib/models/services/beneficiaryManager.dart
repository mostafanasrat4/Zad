//toDo: remove debug prints

import 'package:flutter/material.dart';
import 'package:zad/models/classes/beneficiary.dart';
import 'package:zad/models/classes/collections.dart';
import 'package:zad/models/classes/user.dart';

import 'package:zad/models/interfaces/IUserManager.dart';
import 'package:zad/models/services/firebase_services.dart';

class BenficiaryManager implements IUserManager{
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
  Future<void> createUser( myBeneficiary) async{
    if(myBeneficiary is Beneficiary) {
      throw ArgumentError('User must be of type Beneficiary');
      return;
    }
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
  Future<void> editUser(myBeneficiary) async{
    if(myBeneficiary is Beneficiary) {
      throw ArgumentError('User must be of type Beneficiary');
      return;
    }
    try{
      var docID = await _firestoreService.getDocID(collections().beneficiary, 'id', myBeneficiary.id);
      await _firestoreService.updateData(collections().beneficiary, docID!, myBeneficiary.toMap());
    }
    catch(e){
      debugPrint(e.toString());
    }
  }

  @override
  Future<List<Beneficiary>> getApprovedBeneficiaries() async {
    try{
      String status = 'status';
      var result = await _firestoreService.getList(collections().beneficiary, status, 'approved');
      List<Beneficiary> beneficiaries = [];
      for(var item in result){
        beneficiaries.add(Beneficiary.fromMap(item));
      }
      return beneficiaries;
    }
    catch(e){
      debugPrint(e.toString());
      return [];
    }
  }

  @override
  Future<List<Beneficiary>> getBeneficiaries()async {
    try {
      var result = await _firestoreService.getCollection(
          collections().beneficiary);
      List<Beneficiary> beneficiaries = [];
      for (var item in result) {
        beneficiaries.add(Beneficiary.fromMap(item));
      }
      return beneficiaries;
    }catch(e){
      debugPrint(e.toString());
      return [];
    }

    }


  @override
  Future<Beneficiary?> getBeneficiary(String id) async{
    try{
      var result = await _firestoreService.getDocumentByAttribute(collections().beneficiary,'id' ,id);
      return Beneficiary.fromMap(result!);
    }
    catch(e){
      debugPrint(e.toString());
      return null;
    }
  }

  @override
  Future<List<Beneficiary>> getDisapprovedBeneficiaries(String status) async{
    try{
      var result = await _firestoreService.getList(collections().beneficiary, status, 'disapproved');
      List<Beneficiary> beneficiaries = [];
      for(var item in result){
        beneficiaries.add(Beneficiary.fromMap(item));
      }
      return beneficiaries;
    }
    catch(e){
      debugPrint(e.toString());
      return [];
    }
  }

  @override
  Future<List<Beneficiary>> getPendingBeneficiaries(String status) async {
    try{
      var result = await _firestoreService.getList(collections().beneficiary, status, 'pending');
      List<Beneficiary> beneficiaries = [];
      for(var item in result){
        beneficiaries.add(Beneficiary.fromMap(item));
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

  @override
  Future<User?> getUserByUserID(String userID) {
    // TODO: implement getUserByUserID
    throw UnimplementedError();
  }
}