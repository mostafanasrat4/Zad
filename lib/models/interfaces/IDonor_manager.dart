import 'package:zad/models/classes/donor.dart';

abstract class IDonorManager {
  Future<void> createDonor(Donor myDonor);
  Future<void> editDonor(Donor myDonor);
  Future<void> deleteDonor(Donor myDonor);
  Future<Donor?> getDonorByUserID(String userID);
  Future<Donor?> FindDonorByNumber(String number);
}