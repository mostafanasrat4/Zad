//FirebaseFirestore Singleton needs to be seperated into a singleton
// errors because firestore package isnt included in the dependencies
// flutter pub add cloud_firestore
//line 129 needs userID
// idk if seperation will be needed
// could be used a reference for whoever is gonna work on the models


import 'package:cloud_firestore/cloud_firestore.dart';



class FirestoreService {
  static final FirebaseFirestore _db = FirebaseFirestore.instance;


  // Get document ID based on attribute
  Future<String?> getDocID(String collection, String attribute, String value) async {
    try {
      QuerySnapshot querySnapshot = await _db
          .collection(collection)
          .where(attribute, isEqualTo: value)
          .get();
      if (querySnapshot.docs.isNotEmpty) {
        DocumentSnapshot documentSnapshot = querySnapshot.docs.first;
        return documentSnapshot.id;
      }
      return null;
    } catch (e) {
      print("Error getting document ID: $e");
      return null;
    }
  }

  // Add data and return the document ID
  Future<String?> addData(String collection, Map<String, dynamic> data) async {
    try {
      DocumentReference docRef = await _db.collection(collection).add(data);
      return docRef.id;
    } catch (e) {
      print("Error adding data: $e");
      return null;
    }
  }

  // Get all data from the collection and return a list of maps
  Future<List<Map<String, dynamic>>> getData(String collection) async {
    try {
      QuerySnapshot snapshot = await _db.collection(collection).get();
      return snapshot.docs
          .map((doc) => doc.data() as Map<String, dynamic>)
          .toList();
    } catch (e) {
      print("Error getting data: $e");
      return [];
    }
  }

  // Query to get a list of documents based on a specific attribute and value
  Future<List<Map<String, dynamic>>> getList(String collection, String attribute, String value) async {
    List<Map<String, dynamic>> documents = [];

    try {
      QuerySnapshot querySnapshot = await _db
          .collection(collection)
          .where(attribute, isEqualTo: value)
          .get();

      for (var doc in querySnapshot.docs) {
        documents.add(doc.data() as Map<String, dynamic>);
      }
      return documents;
    } catch (e) {
      print("Error getting list of documents: $e");
      return [];
    }
  }

  // Query to get a document based on a specific attribute and value
  Future<Map<String, dynamic>?> getDocumentByAttribute(String collection, String attribute, String value) async {
    try {
      QuerySnapshot querySnapshot = await _db
          .collection(collection)
          .where(attribute, isEqualTo: value)
          .get();

      if (querySnapshot.docs.isNotEmpty) {
        DocumentSnapshot doc = querySnapshot.docs.first;
        return doc.data() as Map<String, dynamic>;
      } else {
        return null;
      }
    } catch (e) {
      print("Error getting document by attribute: $e");
      return null;
    }
  }

  // Get document by docID
  Future<Map<String, dynamic>?> getDocument(String collection, String documentId) async {
    try {
      DocumentSnapshot doc = await _db.collection(collection).doc(documentId).get();
      return doc.exists ? doc.data() as Map<String, dynamic> : null;
    } catch (e) {
      print("Error getting document: $e");
      return null;
    }
  }

  // Update data in a document by its ID
  Future<void> updateData(String collection, String documentId, Map<String, dynamic> data) async {
    try {
      await _db.collection(collection).doc(documentId).update(data);
    } catch (e) {
      print("Error updating data: $e");
    }
  }

  // Delete a document by its ID
  Future<void> deleteData(String collection, String documentId) async {
    try {
      await _db.collection(collection).doc(documentId).delete();
    } catch (e) {
      print("Error deleting data: $e");
    }
  }

  // update single att
Future<void> updateSingelAtt(String collection, String documentID, String att, String Value)async{
    try{
      await _db.collection(collection).doc(documentID).update({att: Value});
    }catch(e){
      print(e.toString());
  }

  // codeium is fun
  // Check if a document with 2 attributes exists



}

  Future<bool> checkIfDocExistsWith2Attributes(String collection, String attribute1, String value1, String attribute2, String value2) async {
    try {
      QuerySnapshot snapshot = await _db
          .collection(collection)
          .where(attribute1, isEqualTo: value1)
          .where(attribute2, isEqualTo: value2)
          .get();
      return true;
    } catch (e) {
      print("Error checking if document exists: $e");
      return false;
    }
  }

  // Delete a document by 2 attributes
  Future<void> deleteDocWith2Attributes(String collection, String attribute1, String value1, String attribute2, String value2) async {
    try {
      QuerySnapshot snapshot = await _db
          .collection(collection)
          .where(attribute1, isEqualTo: value1)
          .where(attribute2, isEqualTo: value2)
          .get();
      if (snapshot.docs.isNotEmpty) {
        await snapshot.docs.first.reference.delete();
      }
    } catch (e) {
      print("Error deleting document by 2 attributes: $e");
    }
  }

  Future<List<Map<String, dynamic>>> getCollection(String collection) async {
    List<Map<String, dynamic>> documents = [];
    try {
      QuerySnapshot querySnapshot = await _db.collection(collection).get();
      for (var doc in querySnapshot.docs) {
        documents.add(doc.data() as Map<String, dynamic>);
      }
      return documents;
    } catch (e) {
      print(e.toString());
      return documents;
    }
  }

  getListby2Attributes(String collection, String attribute1, String value1, String attribute2, String value2) async{
    try{
      QuerySnapshot snapshot = await _db
          .collection(collection)
          .where(attribute1, isEqualTo: value1)
          .where(attribute2, isEqualTo: value2)
          .get();
      return snapshot.docs.map((doc) => doc.data() as Map<String, dynamic>).toList();
    }catch(e){
      print(e.toString());
    }

  }

  getDocumentIDby2Attributes(String collection, String attribute1, String value1, String attribute2, String value2) async{
    try{
      QuerySnapshot snapshot = await _db
          .collection(collection)
          .where(attribute1, isEqualTo: value1)
          .where(attribute2, isEqualTo: value2)
          .get();

      if (snapshot.docs.isNotEmpty) {
        DocumentSnapshot documentSnapshot = snapshot.docs.first;
        return documentSnapshot.id;
      }
      return null;
    }catch(e){
      print(e.toString());
    }
  }


  Future<void> addDataWithID(String collection, String documentID, Map<String, dynamic> data) async {
    try {
      await _db.collection(collection).doc(documentID).set(data);
    } catch (e) {
      print("Error adding data: $e");
    }
  }

}
