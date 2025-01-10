import '../classes/event.dart';

abstract class EventFactory {
  Event createEvent(
    String id,
    String name,
    String location,
    DateTime date,
    String userID,
    String description,
    List<String> skillsNeeded,
  );
}
