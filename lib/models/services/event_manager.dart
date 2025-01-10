import 'package:flutter/cupertino.dart';
import 'package:zad/models/classes/event.dart';
import 'package:zad/models/classes/collections.dart';
import 'package:zad/models/classes/event_factory_selector.dart';
import 'package:zad/models/interfaces/IEventManager.dart';
import 'package:zad/models/services/firebase_services.dart';

import '../interfaces/IEventFactory.dart';

class EventManager implements IEventManager {
  final FirestoreService _firestoreService = FirestoreService();
  final EventFactorySelector _eventFactorySelector = EventFactorySelector();
  @override
  Future<void> AddEvent(Event myEvent) async {
    try {
      await _firestoreService.addData(collections().events, myEvent.toMap());
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  @override
  Future<void> addEventWithFactory(
    String type,
    String id,
    String name,
    String location,
    DateTime date,
    String userID,
    String description,
    List<String> skillsNeeded,
  ) async {
    try {
      EventFactory factory = _eventFactorySelector.getFactory(type);
      Event event = factory.createEvent(
        id,
        name,
        location,
        date,
        userID,
        description,
        skillsNeeded,
      );

      await _firestoreService.addData(collections().events, event.toMap());
      debugPrint("Event added successfully: $event");
    } catch (e) {
      debugPrint("Error adding event: $e");
    }

    throw UnimplementedError();
  }

  @override
  Future<void> DeleteEvent(String id) async {
    try {
      var docID =
          await _firestoreService.getDocID(collections().events, 'id', id);
      await _firestoreService.deleteData(collections().events, docID!);
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  @override
  Future<void> EditEvent(Event myEvent) async {
    try {
      var docID = await _firestoreService.getDocID(
          collections().events, 'id', myEvent.id);
      await _firestoreService.updateData(
          collections().events, docID!, myEvent.toMap());
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  @override
  Future<Event?> getEvent(String id) async {
    try {
      var event = await _firestoreService.getDocumentByAttribute(
          collections().events, 'id', id);
      return Event.fromMap(event!);
    } catch (e) {
      debugPrint(e.toString());
    }
    return null;
  }

  @override
  Future<List<Event>> getAllEvents() async {
    try {
      var events = await _firestoreService.getCollection(collections().events);
      List<Event> eventsOBJ = [];
      for (var event in events) {
        eventsOBJ.add(Event.fromMap(event));
      }

      return eventsOBJ;
    } catch (e) {
      debugPrint(e.toString());
      return [];
    }
  }

  @override
  Future<List<Event>> getBeneficaryEvents(String userID) async {
    try {
      var rawEvents = await _firestoreService.getList(
          collections().events, 'userID', userID);
      List<Event> events = [];
      for (var event in rawEvents) {
        events.add(Event.fromMap(event));
      }
      return events;
    } catch (e) {
      debugPrint(e.toString());
    }
    return [];
  }

  @override
  Future<List<Event>> getUserEvents(String userID) {
    // TODO: implement getUserEvents
    throw UnimplementedError();
  }

  @override
  Future<List<Event>> getVolunteerEvents(String userID) async {
    // TODO: implement getVolunteerEvents
    throw UnimplementedError();
  }
}
