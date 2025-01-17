import 'package:uuid/uuid.dart';
import 'package:zad/controllers/Image_adapter.dart';
import 'package:zad/models/classes/beneficiary.dart';
import 'package:zad/models/classes/document.dart';
import 'package:zad/models/classes/event.dart';
import 'package:zad/models/classes/user.dart';
import 'package:zad/models/services/beneficiaryManager.dart';
import 'package:zad/models/services/document_manager.dart';
import 'package:zad/models/services/event_manager.dart';
import 'package:zad/models/services/local_user_data.dart';

class BeneficiaryProfileController {
  User? myUser = LocalUserData().loadUserData() as User;
  late Beneficiary? ben;
  Future<Beneficiary?> LoadUserDetails() async {
    ben = await BeneficiaryManager().getBeneficiary(myUser!.id);
    return ben;
  }

  Future<List<Event>> getBeneficiaryCreatedEvents(String id) async {
    return await EventManager().getBeneficaryEvents(myUser!.id);
  }

  Future<void> UploadDocuments() async {
    var Image = await ImageAdapter().pickAndCompressImageToString();
    if(Image == null){
      return;
    }
    Document myDocument = Document(id: Uuid().v1(), url: Image, userID: myUser!.id);
    await DocumentManager().uploadDocument(myDocument);
  }

  Future<void> EditDocuments() async {
    var Image = await ImageAdapter().pickAndCompressImageToString();
    if(Image == null){
      return;
    }
    Document myDocument = Document(id: Uuid().v1(), url: Image, userID: myUser!.id);
    await DocumentManager().editDocument(myDocument, myUser!.id);
  }

  bool isImageExists() {
    if (ben!.imageURL == "" || ben!.imageURL == null) {
      return false;
    }
    else {
      return true;
    }
  }
}
