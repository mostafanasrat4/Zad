import 'package:zad/models/classes/event.dart';
import 'package:zad/models/classes/event_registeration.dart';
import 'package:zad/models/classes/user.dart';

abstract class IEventRegisteration{


  Future<void> registerEvent(EventRegisteration myEventRegisteration);
  Future<void> unregisterEvent(EventRegisteration myEventRegisteration);
  Future<void> attendEvent(EventRegisteration myEventRegisteration);
  Future<void> unattendEvent(EventRegisteration myEventRegisteration);
  Future<List<User>> getEventRegisterations(String eventID);
  Future<List<Event>> getUserRegisterations(String userID);
  Future<List<User>> getEventAttendees(String eventID);
  Future<List<Event>> getUserAttendedEvents(String userID);

}