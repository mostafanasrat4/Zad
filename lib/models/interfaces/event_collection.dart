import 'package:zad/models/classes/event.dart';
import 'package:zad/models/interfaces/Iterator.dart';

abstract class EventCollection {
  Iterator<Event> createIterator();
}
