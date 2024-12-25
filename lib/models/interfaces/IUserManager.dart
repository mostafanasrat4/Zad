import 'package:zad/models/classes/user.dart';
abstract class IUserManager {
  Future<void> createUser(myUser);
  Future<void> deleteUser(myUser);
  Future<void> editUser(myUser);
  Future<User?> getUserByUserID(String userID);
  Future<User?> FindUserByNumber(String number);
}
