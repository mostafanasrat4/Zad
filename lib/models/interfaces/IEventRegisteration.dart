import 'package:zad/models/classes/Event.dart';
import 'package:zad/models/classes/event_registeration.dart';
import 'package:zad/models/classes/users.dart';

abstract class IEventRegisteration{


  Future<void> registerEvent(EventRegisteration myEventRegisteration);
  Future<void> unregisterEvent(EventRegisteration myEventRegisteration);
  Future<void> attendEvent(EventRegisteration myEventRegisteration);
  Future<void> unattendEvent(EventRegisteration myEventRegisteration);
  Future<List<User>> getEventRegisterations(String eventID);
  Future<List<User>> getUserRegisterations(String userID);
  Future<List<User>> getEventAttendees(String eventID);
  Future<List<Event>> getUserAttendedEvents(String userID);

}