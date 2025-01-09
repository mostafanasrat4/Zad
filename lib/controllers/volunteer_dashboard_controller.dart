import 'package:zad/models/classes/event.dart';
import 'package:zad/models/services/event_manager.dart';
import 'package:zad/models/services/event_registeration_manager.dart';
import 'package:zad/models/services/local_user_data.dart';


class VolunteerDashboardController {
  Future<List<Event>> getFutureEvents() async {
    var events = await EventManager().getAllEvents();
    List<Event> FutureEvents = [];
    for (var event in events) {
      event.date.isAfter(DateTime.now()) ? FutureEvents.add(event) : null;
    }
    return FutureEvents;
  }

  Future<List<Event>> getEvents() async {
    return await EventManager().getAllEvents();
  }

  Future<List<Event>> getVolunteerRegisteredEvents() async {
    var user = await LocalUserData().loadUserData();
    if (user == null) return [];
    var userID = user.id;
    var events =
        await EventRegisterationManager().getUserRegisterations(userID);
    return events;
  }

  // get current user registered events "just for testing"
  Future<List<Event>> getVolunteerRegisteredEvents2(var user) async {
    return EventRegisterationManager().getUserRegisterations(user);
  }

  Future<List<Event>> getVolunteerAttendedEvents() async {
    var user = await LocalUserData().loadUserData();
    if (user == null) return [];
    var userID = user.id;
    var events =
        await EventRegisterationManager().getUserAttendedEvents(userID);
    return events;
  }

  Future<List<Event>> getRegisteredEventIDs() async {
    var user = await LocalUserData().loadUserData();
    if (user == null) return [];
    var userID = user.id;
    var registeredEvents =
        await EventRegisterationManager().getUserRegisterations(userID);

    return registeredEvents;
  }

  EventRegisterationManager getRegistrationManager() {
    return EventRegisterationManager();
  }
}
