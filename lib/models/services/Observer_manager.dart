import 'package:zad/models/classes/user.dart';
import 'package:zad/models/interfaces/IObserver.dart';
import 'package:zad/models/services/FCM_services.dart';

class ObserverManager implements IObserver{
  // Map to store observers: {eventType: Set of user IDs}
  final Map<String, Set<String>> _observers = {};

  // Subscribe a user to a specific event type
  void subscribe(User user, String eventType) {
    _observers.putIfAbsent(eventType, () => {}).add(user.id);
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

  // Notify all observers of a specific event type
  void notify(String eventType, String title, String body) {
    if (_observers.containsKey(eventType)) {
      for (var userId in _observers[eventType]!) {
        FcmServices().sendFCMMessage(title, body, userId);
      }
    }
  }
}
