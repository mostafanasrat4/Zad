import '../classes/event.dart';
import '../interfaces/event_collection.dart';
import 'package:zad/models/services/event_iterator.dart';
import 'package:zad/models/interfaces/Iterator.dart';
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