import '../classes/admin.dart';
abstract class IAdmin {
  Future<void> createAdmin(admin myUser);
  Future<void> deleteAdminr(admin myUser);
  Future<void> editAdmin(admin myAdmin);
  Future<admin?> getAdminByUserID(String userID);
  Future<admin?> FindAdminByNumber(String number);
}
