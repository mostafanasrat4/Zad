import 'package:zad/models/classes/event.dart';
import 'package:zad/models/services/event_manager.dart';

class AdminController {
  final EventManager _eventManager = EventManager();


  Future<void> addEventWithFactory({
    required String type,
    required String id,
    required String name,
    required String location,
    required DateTime date,
    required String userID,
    required String description,
    required List<String> skillsNeeded,
  }) async {
    try {
      await _eventManager.addEventWithFactory(
        type,
        id,
        name,
        location,
        date,
        userID,
        description,
        skillsNeeded,
      );
    } catch (e) {
      print("Error adding event: $e");
    }
  }

  Future<void> editEvent(Event event) async {
    await _eventManager.EditEvent(event);
  }


  Future<void> deleteEvent(String id) async {
    await _eventManager.DeleteEvent(id);
  }

  // Fetch All Events
  Future<List<Event>> getAllEvents() async {
    return await _eventManager.getAllEvents();
  }
}
