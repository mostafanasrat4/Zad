import 'package:zad/models/classes/event.dart';

abstract class IEventManager {
  Future <void> AddEvent(Event myEvent);
  Future <void> EditEvent(Event myEvent);
  Future <void> DeleteEvent(String id);
  Future<Event?> getEvent(String id);
  Future<List<Event>> getAllEvents();
  Future<List<Event>> getBeneficaryEvents(String userID);
  Future<List<Event>> getVolunteerEvents(String userID);
  Future<List<Event>> getUserEvents(String userID);
}