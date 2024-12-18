// TODO: Remove debug Prints

import 'package:flutter/material.dart';
import 'package:zad/models/classes/Event.dart';
import 'package:zad/models/classes/collections.dart';
import 'package:zad/models/classes/event_registeration.dart';
import 'package:zad/models/classes/users.dart';
import 'package:zad/models/interfaces/IEventRegisteration.dart';
import 'package:zad/models/services/firebase_services.dart';

class EventRegisterationManager implements IEventRegisteration{
  final FirestoreService _firestoreService = FirestoreService();

  @override
  Future<void> attendEvent(EventRegisteration myEventRegisteration)async {
    try{
      await _firestoreService.addData(collections().eventRegisterations, myEventRegisteration.toMap());
    }catch(e){
      debugPrint(e.toString());
    }

  }

  @override
  Future<List<User>> getEventAttendees(String eventID) async{
    try{
      var eventAttendees = await _firestoreService.getListby2Attributes(collections().eventRegisterations, 'eventID', eventID, 'attended', true as String);
      List<User> eventAttendeesOBJ = [];
      for(var eventAttendee in eventAttendees){
        var eventAttendeeUser = await _firestoreService.getDocumentByAttribute(collections().volunteers, 'id', eventAttendee['userID']);
        eventAttendeesOBJ.add(User.fromMap(eventAttendeeUser!));
      }
      return eventAttendeesOBJ;
    }catch(e){
      debugPrint(e.toString());
      return [];
    }
  }

  @override
  Future<List<User>> getEventRegisterations(String eventID) async {
    try {
      var eventRegisterations = await _firestoreService.getList(
          collections().eventRegisterations, 'eventID', eventID);
      List<User> eventRegisteredUsers = [];
      for (var eventRegisteration in eventRegisterations) {
        var eventAttendeeUser = await _firestoreService.getDocumentByAttribute(
            collections().volunteers, 'id', eventRegisteration['userID']);
        eventRegisteredUsers.add(User.fromMap(eventAttendeeUser!));
      }
      return eventRegisteredUsers;
    } catch (e) {
      debugPrint(e.toString());
      return [];
    }
  }




  @override
  Future<List<Event>> getUserAttendedEvents(String userID) {
    // TODO: implement getUserAttendedEvents
    throw UnimplementedError();
  }

  @override
  Future<List<Event>> getUserRegisterations(String userID) async{
    try{
      var registeredEventsMaps = await _firestoreService.getList(collections().eventRegisterations, 'userID', userID);
      List<Event> registeredEvents = [];
      for(var registeredEventMap in registeredEventsMaps){
        var registeredEvent = await _firestoreService.getDocumentByAttribute(collections().events, 'id', registeredEventMap['eventID']);
        registeredEvents.add(Event.fromMap(registeredEvent!));
      }
      return registeredEvents;
    }catch(e){
      debugPrint(e.toString());
      return [];
    }
  }

  @override
  Future<void> registerEvent(EventRegisteration myEventRegisteration) async{
    try{
      await _firestoreService.addData(collections().eventRegisterations, myEventRegisteration.toMap());
    }catch(e){
      // TODO: Remove debug Prints
      debugPrint(e.toString());
    }

  }

  @override
  Future<void> unattendEvent(EventRegisteration myEventRegisteration) async{
    try{
      await _firestoreService.deleteDocWith2Attributes(collections().eventRegisterations, 'eventID', myEventRegisteration.EventID, 'userID',myEventRegisteration.userID);
    }catch(e){
      // TODO: Remove debug Prints
      debugPrint(e.toString());
    }
  }

  @override
  Future<void> unregisterEvent(EventRegisteration myEventRegisteration) async{
    try{
      var documentId = await _firestoreService.getDocumentIDby2Attributes(collections().eventRegisterations, 'eventID', myEventRegisteration.EventID, 'userID',myEventRegisteration.userID);
      await _firestoreService.updateData(collections().eventRegisterations, documentId, myEventRegisteration.toMap());
    }catch(e){
      // TODO: Remove debug Prints
      debugPrint(e.toString());
    }

  }

}