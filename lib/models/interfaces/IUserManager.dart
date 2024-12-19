import 'package:zad/models/classes/user.dart';
abstract class IUserManager {
  Future<void> createUser(User myUser);
  Future<void> deleteUser(User myUser);
  Future<void> editUser(User myUser);
  Future<User?> getUserByUserID(String userID);
  Future<User?> FindUserByNumber(String number);
}
