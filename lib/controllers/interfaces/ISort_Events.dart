import 'package:zad/models/classes/event.dart';

abstract class ISortEvents {
  List<Event> sortEvents(List<Event> events);
}