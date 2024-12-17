import 'package:zad/models/classes/Event.dart';

abstract class IEventManager {
  Future <void> AddEvent(Event myEvent);
  Future <void> EditEvent(Event myEvent);
  Future <void> DeleteEvent(String id);
  Future<void> editEvent(Event myEvent);
  Future<Event> getEvent(String id);
}