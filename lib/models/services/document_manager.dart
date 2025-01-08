import 'package:flutter/cupertino.dart';
import 'package:zad/models/classes/collections.dart';
import 'package:zad/models/classes/document.dart';
import 'package:zad/models/interfaces/IDocument.dart';
import 'package:zad/models/services/firebase_services.dart';


class DocumentManager implements IDocument {

  final FirestoreService _firestoreService = FirestoreService();

  @override
  Future<void> deleteDocument(String ID)async {
    try{
      var docID = await _firestoreService.getDocID(collections().documents, 'id', ID);
      await _firestoreService.deleteData(collections().documents, docID!);
    }catch(e){}
  }

  @override
  Future<void> editDocument(Document myDocument)async {
    try{
      var docID = await _firestoreService.getDocID(collections().documents, 'id', myDocument.id);
      await _firestoreService.updateData(collections().documents, docID!, myDocument.toMap());
    }catch(e){}
  }

  @override
  Future<Document?> getDocument(String userID)async {
    try{
      var docID = await _firestoreService.getDocID(collections().documents, 'userID', userID);
      var doc = await _firestoreService.getDocument(collections().documents, docID!);
      if (doc != null) {
        return Document.fromMap(doc);
      }
      else{
        return null;
      }
    }catch(e){
      debugPrint(e.toString());
      return null;
    }

  }

  @override
  Future<void> uploadDocument(Document myDocument) async{
   try{
     await _firestoreService.addData(collections().documents, myDocument.toMap());
   }catch(e){
     debugPrint(e.toString());
   }
  }

}