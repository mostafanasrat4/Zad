import '../classes/admin.dart';
abstract class IAdmin {
  Future<void> createAdmin(Admin myUser);
  Future<void> deleteAdminr(Admin myUser);
  Future<void> editAdmin(Admin myAdmin);
  Future<Admin?> getAdminByUserID(String userID);
  Future<Admin?> FindAdminByNumber(String number);
}
