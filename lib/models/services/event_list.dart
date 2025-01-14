import 'package:zad/models/interfaces/Iterator.dart';
import 'package:zad/models/services/event_iterator.dart';

import '../classes/event.dart';
import '../interfaces/event_collection.dart';
class EventList implements EventCollection
{
  final List<Event> _events;
  EventList(this._events);

  @override
  Iterator<Event> createIterator() {
    return EventIterator(_events);

  }
List<Event> get events => _events;

}