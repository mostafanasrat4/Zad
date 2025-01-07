import 'package:zad/models/services/event_iterator.dart';
import 'package:zad/models/classes/event.dart';

class EventCollection {
  final List<Event> _events;

  EventCollection(this._events);

  EventIterator createIterator() {
    return EventIterator(_events);
  }
}
