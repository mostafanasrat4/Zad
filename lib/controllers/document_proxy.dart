// protective proxy to be finished later
import 'dart:typed_data';


import 'package:zad/controllers/Image_adapter.dart';
import 'package:zad/controllers/interfaces/IDocument.dart';
import 'package:zad/models/classes/document.dart';
import 'package:zad/models/services/document_manager.dart';

import '../models/classes/user.dart';

class DocumentProxy implements IDocument{
  @override
  Future<Uint8List?> viewDocument(String userID, User user)async {
    if(_hasPermission(user)) {
      Document? doc = await DocumentManager().getDocument(userID);
      if (doc != null) {
        return ImageAdapter().stringToImage(doc.url);
      }
    }


  }
  bool _hasPermission(User user) {
    // Only "admin" users can view the document
    return  user.type == "admin";
  }
}