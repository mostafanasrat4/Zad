import 'package:zad/models/classes/donor.dart';

abstract class IDonorManager {
  Future<void> createDonor(donor myDonor);
  Future<void> editDonor(donor myDonor);
  Future<void> deleteDonor(donor myDonor);
  Future<donor?> getDonorByUserID(String userID);
  Future<donor?> FindDonorByNumber(String number);
}