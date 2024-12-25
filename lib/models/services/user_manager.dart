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
  Future<void> createUser(myUser) async {
    if(myUser is User) {
      try {
        _firestoreService.addData(collections().user, myUser.toMap());
        print('user created successfully');
      } catch (e) {
        print(e.toString());
      }
    }else{
      print('error creating user');
    }
  }

  @override
  Future<void> deleteUser(myUser) async {
    if(myUser is !User){
      throw Exception('error deleting user');
      return;
    }
    String? docID =
    await _firestoreService.getDocID(collections().user, 'id', myUser.id);
    await _firestoreService.deleteData(collections().user, docID!);
  }

  @override
  Future<void> editUser(myUser) async {
    if(myUser is !User){
      throw Exception('error editing user');
      return;
    }
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
    return null;
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
    return null;
  }
}