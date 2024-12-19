import 'package:zad/models/classes/admin.dart';
import 'package:zad/models/interfaces/IAdmin.dart';
import 'package:zad/models/services/firebase_services.dart';
import 'package:zad/models/classes/collections.dart';


class AdminManager implements IAdmin {
  final FirestoreService _firestoreService = FirestoreService();
  @override
  Future<Admin?> FindAdminByNumber(String number)async {
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
  Future<void> createAdmin(Admin myUser) async{
    try {
      _firestoreService.addData(collections().admins, myUser.toMap());
      print('user created successfully');
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  Future<void> deleteAdminr(Admin myUser) async{
    String? docID =
        await _firestoreService.getDocID(collections().admins, 'id', myUser.id);
    await _firestoreService.deleteData(collections().admins, docID!);
  }

  @override
  Future<void> editAdmin(Admin myAdmin) async{
    String? docID =
        await _firestoreService.getDocID(collections().admins, 'id', myAdmin.id);
    await _firestoreService.updateData(
        collections().admins, docID!, myAdmin.toMap());
  }

  @override
  Future<Admin?> getAdminByUserID(String userID)async {
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