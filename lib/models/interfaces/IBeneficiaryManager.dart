import 'package:zad/models/classes/beneficiary.dart';

abstract class IBeneficiaryManager {
  Future<void> ApproveBeneficiary(String id);
  Future<beneficiary> disapproveBeneficiary(String id);
  Future<void> createBeneficiary(beneficiary myBeneficiary);
  Future<void> editBeneficiary(beneficiary myBeneficiary);
  Future<void> removeBeneficiary(String id);
  Future<List<beneficiary>> getBeneficiaries();
  Future<beneficiary> getBeneficiary(String id);
  Future<List<beneficiary>> getApprovedBeneficiaries(String status);
  Future<List<beneficiary>> getDisapprovedBeneficiaries(String status);
  Future<List<beneficiary>> getPendingBeneficiaries(String status);


}