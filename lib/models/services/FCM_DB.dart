import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:zad/models/classes/collections.dart';
import 'package:zad/models/classes/topics.dart';
import 'package:zad/models/classes/user.dart';
import 'package:zad/models/services/firebase_services.dart';
import 'package:zad/models/services/local_user_data.dart';

class FCMDB {
  FirebaseMessaging messaging = FirebaseMessaging.instance;
  final FirestoreService _firestoreService = FirestoreService();

  Future<void> storeFCMToken() async {
    String? token = await messaging.getToken();
    var user = LocalUserData().loadUserData();
    User myUser = User.fromMap(user as Map<String, dynamic>);

    await _firestoreService
        .addDataWithID(collections().FCM, myUser.id, {"FCMToken": token});
  }

  Future<String?> LoadFCMToken(String userID) async {
    var token = await _firestoreService.getDocument(collections().FCM, userID);
    return token?['FCMToken'];
  }

  // 2 storing functions, one that stores all the topics in one collections, every topic has a set of user IDs, the other one stores every user ID in a topic collection
  Future<void> StoreSubscriber(topics myTopic) async {
    try {
      await _firestoreService.setWithMerge(
          collections().Subscribers, myTopic.topic, myTopic.toMap());
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Future<void> RemoveSubscriber(topics myTopic) async {
    try {
      var x = await _firestoreService.getDocumentByAttribute(
          collections().Subscribers, 'topic', myTopic.topic);
      topics myTopic2 = topics.fromMap(x!);
      myTopic2.users.remove(myTopic.users);
      _firestoreService.updateData(
          collections().Subscribers, myTopic.topic, myTopic2.toMap());
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Future<topics?> LoadSubs(String topic) async {
    try {
      var doc =
          await _firestoreService.getDocument(collections().Subscribers, topic);
      if (doc != null) {
        return topics.fromMap(doc);
      }
    } catch (e) {
      debugPrint(e.toString());
    }
    return null;
  }

// unused
  Future<void> RemoveSub2(String topic, String userID) async {
    try {
      var docID = await _firestoreService.getDocID(topic, 'userID', userID);
      if (docID != null) {
        await _firestoreService.deleteData(topic, docID);
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  //unused
  Future<void> StoreSub2(String topic, String userID) async {
    try {
      await _firestoreService.addData(topic, {'userID': userID});
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
