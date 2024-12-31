import 'package:zad/models/classes/user.dart';
import 'package:flutter/material.dart';
import 'package:zad/models/classes/beneficiary.dart';
import 'package:zad/models/classes/donation.dart';
import 'package:zad/models/services/beneficiaryManager.dart';
import 'package:zad/models/services/donation_manager.dart';
import 'package:zad/models/services/local_user_data.dart';

class DonorDashboardController{

// function that returns list of Beneficiaries to donate to
  Future<List<Beneficiary>> getBeneficiaries() async{
    try{
      List<Beneficiary> beneficiaries = await BenficiaryManager().getApprovedBeneficiaries();
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

}