import 'package:zad/models/classes/event.dart';

import '../interfaces/IEventFactory.dart';

class WorkshopEventFactory implements EventFactory {
  @override
  Event createEvent(
    String id,
    String name,
    String location,
    DateTime date,
    String userID,
    String description,
    List<String> skillsNeeded,
  ) {
    return Event(
      name,
      description,
      date,
      id,
      location,
      userID,
      skillsNeeded,
      "Workshop",
    );
  }
}

class FundraiserEventFactory implements EventFactory {
  @override
  Event createEvent(
    String id,
    String name,
    String location,
    DateTime date,
    String userID,
    String description,
    List<String> skillsNeeded,
  ) {
    return Event(
      name,
      description,
      date,
      id,
      location,
      userID,
      skillsNeeded,
      "Fundraiser",
    );
  }
}

class SocialEventFactory implements EventFactory {
  @override
  Event createEvent(
    String id,
    String name,
    String location,
    DateTime date,
    String userID,
    String description,
    List<String> skillsNeeded,
  ) {
    return Event(
      name,
      description,
      date,
      id,
      location,
      userID,
      skillsNeeded,
      "Social",
    );
  }
}
