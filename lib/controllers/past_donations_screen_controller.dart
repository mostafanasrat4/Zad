import 'package:zad/models/classes/donation_details.dart';
import 'package:zad/models/services/Donation_details_manager.dart';

class PastDonationsScreenController {
  Future<DonationDetails?> getDetails(String id)async{
    return await DonationDetailsManager().getDonationDetails(id);
  }
}