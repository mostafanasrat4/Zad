import 'package:zad/models/classes/admin.dart';
import 'package:zad/models/interfaces/IAdmin.dart';
import 'package:zad/models/services/firebase_services.dart';
import 'package:zad/models/classes/collections.dart';


class AdminManager implements IAdmin {
  final FirestoreService _firestoreService = FirestoreService();
  @override
  Future<admin?> FindAdminByNumber(String number)async {
    try {
      var document = await _firestoreService.getDocumentByAttribute(
          collections().admins, 'number', number);
      if(document != null) {
        admin myAdmin = admin.fromMap(document);
        return myAdmin;
      }

    }catch (e) {
      print(e.toString());
      return null;
    }
    return null;

  }

  @override
  Future<void> createAdmin(admin myUser) async{
    try {
      _firestoreService.addData(collections().admins, myUser.toMap());
      print('user created successfully');
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  Future<void> deleteAdminr(admin myUser) async{
    String? docID =
        await _firestoreService.getDocID(collections().admins, 'id', myUser.id);
    await _firestoreService.deleteData(collections().admins, docID!);
  }

  @override
  Future<void> editAdmin(admin myAdmin) async{
    String? docID =
        await _firestoreService.getDocID(collections().admins, 'id', myAdmin.id);
    await _firestoreService.updateData(
        collections().admins, docID!, myAdmin.toMap());
  }

  @override
  Future<admin?> getAdminByUserID(String userID)async {
    try {
      var user = await _firestoreService.getDocumentByAttribute(collections().admins, 'id', userID);
      admin myAdmin = admin.fromMap(user!);
      return myAdmin;

    } catch (e) {
      print(e.toString());
      print('error getting the user');
    }
    return null;
  }

}