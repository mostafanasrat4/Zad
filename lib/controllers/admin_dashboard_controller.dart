import 'package:flutter/material.dart';
import 'package:zad/models/classes/event.dart';
import 'package:zad/models/classes/volunteer.dart';
import 'package:zad/models/services/event_manager.dart';
import 'package:zad/models/services/volunteer_manager.dart';

import '../models/classes/beneficiary.dart';
import '../models/services/beneficiaryManager.dart';

class AdminDashboardController{
  final BeneficiaryManager _beneficiaryManager = BeneficiaryManager();
  final EventManager _eventManager = EventManager();
  final VolunteerManager _volunteerManager = VolunteerManager();

  Future<double?> getTotalFundsRaised() async{
    try{
      double totalFundsRaised = 0;
      List<Beneficiary> beneficiaries = await _beneficiaryManager.getBeneficiaries();
      for(var beneficiary in beneficiaries){
        totalFundsRaised += beneficiary.donationReceived;
      }
      return totalFundsRaised;
    }
    catch(e){
      debugPrint(e.toString());
      return null;
    }
  }

  Future<double?> getTotalFundsRequired() async{
    try{
      double totalFundsRequired = 0;
      List<Beneficiary> beneficiaries = await _beneficiaryManager.getBeneficiaries();
      for(var beneficiary in beneficiaries){
        totalFundsRequired += beneficiary.donationNeeded;
      }
      return totalFundsRequired;
    }
    catch(e){
      debugPrint(e.toString());
      return null;
    }
  }

  Future<int?> getTotalNoOfBeneficiaries() async{
    try{
      List<Beneficiary> beneficiaries = await _beneficiaryManager.getBeneficiaries();
      return beneficiaries.length;
    }
    catch(e){
      debugPrint(e.toString());
      return null;
    }
  }

  Future<int?> getTotalNoOfApprovedBeneficiaries() async{
    try{
      List<Beneficiary> approvedBeneficiaries = await _beneficiaryManager.getApprovedBeneficiaries();
      return approvedBeneficiaries.length;
    }
    catch(e){
      debugPrint(e.toString());
      return null;
    }
  }

  Future<int?> getTotalNoOfPendingBeneficiaries() async{
    try{
      List<Beneficiary> pendingBeneficiaries = await _beneficiaryManager.getPendingBeneficiaries();
      return pendingBeneficiaries.length;
    }
    catch(e){
      debugPrint(e.toString());
      return null;
    }
  }

  Future<int?> getTotalNoOfDisapprovedBeneficiaries() async{
    try{
      List<Beneficiary> disapprovedBeneficiaries = await _beneficiaryManager.getDisapprovedBeneficiaries();
      return disapprovedBeneficiaries.length;
    }
    catch(e){
      debugPrint(e.toString());
      return null;
    }
  }

  Future<int?> getTotalNoOfEvents() async{
    try{
      List<Event> events = await _eventManager.getAllEvents();
      return events.length;
    }
    catch(e){
      debugPrint(e.toString());
      return null;
    }
  }

  Future<int?> getTotalNoOfVolunteers() async{
    try{
      List<Volunteer> volunteers = await _volunteerManager.getVolunteers();
      return volunteers.length;
    }
    catch(e){
      debugPrint(e.toString());
      return null;
    }
  }



}