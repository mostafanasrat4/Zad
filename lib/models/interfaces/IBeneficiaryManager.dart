import 'package:zad/models/classes/beneficiary.dart';

abstract class IBeneficiaryManager {
  Future<void> ApproveBeneficiary(String id);
  Future<void> disapproveBeneficiary(String id);
  Future<void> createBeneficiary(Beneficiary myBeneficiary);
  Future<void> editBeneficiary(Beneficiary myBeneficiary);
  Future<void> removeBeneficiary(String id);
  Future<List<Beneficiary>> getBeneficiaries();
  Future<Beneficiary?> getBeneficiary(String id);
  Future<List<Beneficiary>> getApprovedBeneficiaries(String status);
  Future<List<Beneficiary>> getDisapprovedBeneficiaries(String status);
  Future<List<Beneficiary>> getPendingBeneficiaries(String status);


}