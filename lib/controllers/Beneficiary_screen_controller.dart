import 'package:flutter/cupertino.dart';
import 'package:uuid/uuid.dart';
import 'package:zad/models/classes/donation.dart';
import 'package:zad/models/classes/donation_details.dart';
import 'package:zad/models/classes/user.dart';
import 'package:zad/models/services/Donation_details_manager.dart';
import 'package:zad/models/services/donation_manager.dart';
import 'package:zad/models/services/local_user_data.dart';

class BeneficiaryScreenController {
  TextEditingController _amountController = TextEditingController();
  get amountController => _amountController;

   isDonor() async{
    var user = await LocalUserData().loadUserData();
    User myUser = User.fromMap(user as Map<String, dynamic>);
    if (user == null) return false;
    if (myUser.type == 'donor') return true;
    return false;
  }

  Future<void> Donate(String beneficiaryID, String paymentType) async{
    var user = await LocalUserData().loadUserData();
    User myUser = User.fromMap(user as Map<String, dynamic>);
    if (user == null) return;
    if (myUser.type == 'donor'){
      String id = Uuid().v1();
      Donation myDonation = Donation(id, beneficiaryID, myUser.id, _amountController.text as int);
      DonationDetails myDetails = DonationDetails(id, DateTime.now(), paymentType);
      DonationManager().createDonation(myDonation);
      DonationDetailsManager().createDonationDetails(myDetails);
    }
  }
}