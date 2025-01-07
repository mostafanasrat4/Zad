import 'package:zad/models/classes/event.dart';
import 'package:zad/models/interfaces/Iterator.dart';

class EventIterator implements Iterator<Event> {
  final List<Event> _events;
  int _currentIndex = 0;

  EventIterator(this._events);

  @override
  bool hasNext() {
    return _currentIndex < _events.length;
  }

  @override
  Event? next() {
    if (!hasNext()) return null;
    return _events[_currentIndex++];
  }
}
