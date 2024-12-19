import 'package:zad/models/classes/donation_details.dart';


abstract class IDonationDetailsManager{
  Future<void> createDonationDetails(DonationDetails myDonation);
  Future<void> deleteDonationDetails(String ID);
  Future<void> editDonationDetails(DonationDetails myDonation);
  Future<DonationDetails?> getDonationDetails(String id);
  //Future<List<DonationDetails>> getDonationsByUserIDDetails(String userID);
  //Future<List<DonationDetails>> getDonationsByProjectIDDetails(String projectID);


}