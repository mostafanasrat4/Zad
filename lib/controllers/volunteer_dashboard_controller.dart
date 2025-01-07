import 'package:zad/controllers/Sort_Events_strats.dart';
import 'package:zad/models/classes/event.dart';
import 'package:zad/models/classes/event_registeration.dart';
import 'package:zad/models/classes/volunteer.dart';
import 'package:zad/models/services/event_manager.dart';
import 'package:zad/models/services/event_registeration_manager.dart';
import 'package:zad/models/services/local_user_data.dart';

class VolunteerDashboardController {

  Future <List<Event>> getFutureEvents()async{
    var events = await EventManager().getAllEvents();
    var FutureEvents;
    for (var event in events) {
      event.date.isAfter(DateTime.now())? FutureEvents.add(event) : null;
    }
    return FutureEvents;
  }


  Future<List<Event>> getEvents(){
    var events = EventManager().getAllEvents();
    return events;
  }
  Future<List<Event>> getVolunteerRegisteredEvents()async{
    var user = await LocalUserData().loadUserData();
    if(user == null) return [];
    var userID = user.id;
    var events = await EventRegisterationManager().getUserRegisterations(userID);
    return events;
  }

  Future<List<Event>> getVolunteerAttendedEvents()async{
    var user = await LocalUserData().loadUserData();
    if(user == null) return [];
    var userID = user.id;
    var events = await EventRegisterationManager().getUserAttendedEvents(userID);
    return events;
  }
}