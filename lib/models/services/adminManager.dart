import 'package:zad/models/classes/admin.dart';
import 'package:zad/models/classes/collections.dart';
import 'package:zad/models/interfaces/IUserManager.dart';
import 'package:zad/models/services/firebase_services.dart';


class AdminManager implements IUserManager {
  final FirestoreService _firestoreService = FirestoreService();
  @override
  Future<Admin?> FindUserByNumber(String number)async {
    try {
      var document = await _firestoreService.getDocumentByAttribute(
          collections().admins, 'number', number);
      if(document != null) {
        Admin myAdmin = Admin.fromMap(document);
        return myAdmin;
      }

    }catch (e) {
      print(e.toString());
      return null;
    }
    return null;

  }

  @override
  Future<void> createUser(myUser) async{
    if(myUser is Admin) {
      throw ArgumentError('User must be of type Admin');
      return;
    }
    try {
      _firestoreService.addData(collections().admins, myUser.toMap());
      print('user created successfully');
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  Future<void> deleteUser(myUser) async{
    if(myUser is Admin) {
      throw ArgumentError('User must be of type Admin');
      return;
    }
    try {
      String? docID =
      await _firestoreService.getDocID(collections().admins, 'id', myUser.id);
      await _firestoreService.deleteData(collections().admins, docID!);
    }catch(e) {
      print(e.toString());
    }
  }

  @override
  Future<void> editUser(myAdmin) async{
    if(myAdmin is Admin) {
      throw ArgumentError('User must be of type Admin');
      return;
    }
    String? docID =
        await _firestoreService.getDocID(collections().admins, 'id', myAdmin.id);
    await _firestoreService.updateData(
        collections().admins, docID!, myAdmin.toMap());
  }

  @override
  Future<Admin?> getUserByUserID(String userID)async {
    try {
      var user = await _firestoreService.getDocumentByAttribute(collections().admins, 'id', userID);
      Admin myAdmin = Admin.fromMap(user!);
      return myAdmin;

    } catch (e) {
      print(e.toString());
      print('error getting the user');
    }
    return null;
  }

}