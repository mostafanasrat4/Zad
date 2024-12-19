import 'package:zad/models/classes/donation.dart';

abstract class IDonationManager{
  Future<void> createDonation(Donation myDonation);
  Future<void> deleteDonation(Donation myDonation);
  Future<void> editDonation(Donation myDonation);
  Future<List<Donation>> getDonationsByUserID(String userID);
  Future<List<Donation>> getDonationsByProjectID(String projectID);


}