import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:zad/models/classes/collections.dart';
import 'package:zad/models/services/firebase_services.dart';

class FCMDB {
  FirebaseMessaging messaging = FirebaseMessaging.instance;
  final FirestoreService _firestoreService = FirestoreService();

  Future<void> storeFCMToken(String userID) async {
    String? token = await messaging.getToken();
    await _firestoreService.addDataWithID(collections().FCM, userID, {"FCMToken": token});

  }


  Future <String?>LoadFCMToken(String userID)async{
    var token = await _firestoreService.getDocument(collections().FCM, userID);
    return token?['FCMToken'];
  }
}