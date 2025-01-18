import 'package:flutter/material.dart';
import 'package:zad/models/classes/beneficiary.dart';
import 'package:zad/models/classes/collections_of_topics.dart';
import 'package:zad/models/classes/donation.dart';
import 'package:zad/models/classes/topics.dart';
import 'package:zad/models/classes/user.dart';
import 'package:zad/models/services/FCM_DB.dart';
import 'package:zad/models/services/beneficiaryManager.dart';
import 'package:zad/models/services/donation_manager.dart';
import 'package:zad/models/services/local_user_data.dart';

class DonorDashboardController{

// function that returns list of Beneficiaries to donate to
  Future<List<Beneficiary>> getBeneficiaries() async{
    try{
      List<Beneficiary> beneficiaries = await BeneficiaryManager().getApprovedBeneficiaries();
      return beneficiaries;
    }catch(e){
      debugPrint(e.toString());
      return [];
    }
  }
  Future <List<Donation>> getDonations() async{
    try{
      User user =  LocalUserData().loadUserData() as User;
      var userID = user.id;
      List<Donation> donations = await DonationManager().getDonationsByUserID(userID);
      return donations;
    }catch(e){
      debugPrint(e.toString());
      return [];
    }
  }
Future<void> subscribe() async{
  try{
     var userR =  LocalUserData().loadUserData();
     User user = User.fromMap(userR as Map<String, dynamic>);
     topics myTopic = topics(collections_of_topics().newBeneficiary, {user.id});
     FCMDB().StoreSubscriber(myTopic);
  }catch(e){

  }
}
}