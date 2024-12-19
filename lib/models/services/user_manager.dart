import 'package:zad/models/classes/collections.dart';
import 'package:zad/models/classes/user.dart';
import 'package:zad/models/interfaces/IUserManager.dart';
import 'package:zad/models/services/firebase_services.dart';

class UserManager implements IUserManager {
  static final UserManager _instance = UserManager._internal();
  factory UserManager() => _instance;
  UserManager._internal();

  final FirestoreService _firestoreService = FirestoreService();


  @override
  Future<void> createUser(User myUser) async {
    try {
      _firestoreService.addData(collections().user, myUser.toMap());
      print('user created successfully');
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  Future<void> deleteUser(User myUser) async {
    String? docID =
    await _firestoreService.getDocID(collections().user, 'id', myUser.id);
    await _firestoreService.deleteData(collections().user, docID!);
  }

  @override
  Future<void> editUser(User myUser) async {
    String? docID =
    await _firestoreService.getDocID(collections().user, 'id', myUser.id);
    await _firestoreService.updateData(
        collections().user, docID!, myUser.toMap());
  }

  @override
  Future<User?> getUserByUserID(String userID) async {
    try {
     var user = await _firestoreService.getDocumentByAttribute(collections().user, 'id', userID);
     User myUser = User.fromMap(user!);
        return myUser;

    } catch (e) {
      print(e.toString());
      print('error getting the user');
    }
  }


@override
  Future<User?> FindUserByNumber(String number) async {
    try {
      var document = await _firestoreService.getDocumentByAttribute(
          collections().user, 'number', number);
      if(document != null) {
        User myUser = User.fromMap(document);
        return myUser;
      }

    }catch (e) {
      print(e.toString());
      return null;
    }
  } //Future<List<Map<String, dynamic>>>
}