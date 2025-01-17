import 'package:flutter/cupertino.dart';
import 'package:uuid/uuid.dart';
import 'package:uuid/v1.dart';
import 'package:zad/models/classes/donation.dart';
import 'package:zad/models/classes/donation_details.dart';
import 'package:zad/models/classes/user.dart';
import 'package:zad/models/services/Donation_details_manager.dart';
import 'package:zad/models/services/donation_manager.dart';
import 'package:zad/models/services/local_user_data.dart';

class BeneficiaryScreenController {
  Future<bool> isDonor() async {
    try {
      var user = await LocalUserData().loadUserData();
      if (user == null) {
        print("No user found."); // Debugging
        return false;
      }
      print("User type: ${user.type}"); // Debugging
      return user.type == 'donor';
    } catch (e) {
      print("Error in isDonor: $e");
      return false;
    }
  }

  Future<void> Donate(String beneficiaryID, String paymentType, int amount) async{
    var user = await LocalUserData().loadUserData();
    if (user == null) return;
    User myUser = User.fromMap(user as Map<String, dynamic>);
    if (myUser.type == 'donor'){
      String id = Uuid().v1();
      Donation myDonation = Donation(id, beneficiaryID, myUser.id, amount);
      DonationDetails myDetails = DonationDetails(id, DateTime.now(), paymentType);
      await DonationManager().createDonation(myDonation);
      await DonationDetailsManager().createDonationDetails(myDetails);
      print("donation added");
    }
  }
}
