import 'package:zad/models/classes/document.dart';

abstract class IDocument {
  Future<void> uploadDocument(Document myDocument);
  Future<void> getDocument(String ID);
  Future<void> deleteDocument(String ID);
  Future<void> editDocument(Document myDocument);

}