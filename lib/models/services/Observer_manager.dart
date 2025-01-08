import 'package:flutter/foundation.dart';
import 'package:zad/models/classes/topics.dart';
import 'package:zad/models/classes/user.dart';
import 'package:zad/models/interfaces/IObserver.dart';
import 'package:zad/models/services/FCM_DB.dart';
import 'package:zad/models/services/FCM_services.dart';

class ObserverManager implements IObserver {
  // Map to store observers: {eventType: Set of user IDs}
  final Map<String, Set<String>> _observers = {};
  // new subscribe to event method
  void sub(User user, String topic) async {
    topics myTopic = topics(topic, {user.id});
    await FCMDB().StoreSubscriber(myTopic);
  }
  //new unsubscribe to event method
  void unsub(User user, String topic) async {
    topics myTopic = topics(topic, {user.id});
    await FCMDB().RemoveSubscriber(myTopic);
  }
// new notify all observers of a specific event type
  @override
  void notify(String title, String body, String topic) async {
    try {
      var subs = await FCMDB().LoadSubs(topic);
      if (subs == null) return;
      for (var userID in subs.users) {
        await FcmServices().sendFCMMessage(title, body, userID);
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }



  ///////////////////////////////////////////////////////////////////////////////////////////////
  // ignore this, wont be used but left just incase
  // Subscribe a user to a specific event type
  void subscribe(User user, String eventType) async {
    _observers.putIfAbsent(eventType, () => {}).add(user.id);
    topics myTopic = topics(eventType, {user.id});
    await FCMDB().StoreSubscriber(myTopic);
  }
  // Unsubscribe a user from a specific event type
  void unsubscribe(User user, String eventType) {
    if (_observers.containsKey(eventType)) {
      _observers[eventType]?.remove(user.id);
      if (_observers[eventType]?.isEmpty ?? false) {
        _observers.remove(eventType);
      }
    }
  }
  // notify all observers
  void notifyALL(String eventType, String title, String body) {
    if (_observers.containsKey(eventType)) {
      for (var userId in _observers[eventType]!) {
        FcmServices().sendFCMMessage(title, body, userId);
      }
    }
  }
}
