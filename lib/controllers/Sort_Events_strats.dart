// ToDO Finish the startegy

import 'package:zad/controllers/interfaces/ISort_Events.dart';
import 'package:zad/models/classes/event.dart';

class sortEventByDate implements ISortEvents {
  @override
  List<Event> sortEvents(List<Event> events) {
    events.sort((a, b) => a.date.compareTo(b.date));
    return events;
  }
}

class sortEventByLocation implements ISortEvents {
  @override
  List<Event> sortEvents(List<Event> events) {
    events.sort((a, b) => a.location.compareTo(b.location));
    return events;
  }
}

class sortEventBySkill implements ISortEvents {
  @override
  List<Event> sortEvents(List<Event> events) {
    events.retainWhere((event) => event.SkillsNeeded?.isNotEmpty ?? false);
    return events;
  }
}

class sortEventByType implements ISortEvents {
  @override
  List<Event> sortEvents(List<Event> events) {
    events.sort((a, b) => (a.type ?? "").compareTo(b.type ?? ""));
    return events;
  }
}

class setStrategy {
  late ISortEvents _strategy;
  ISortEvents switchStrategy(String strategy) {
    switch (strategy) {
      case "Date":
        _strategy = sortEventByDate();
        break;
      case "Location":
        _strategy = sortEventByLocation();
        break;
      case "Type":
        _strategy = sortEventByType();
        break;
      case "Skill":
        _strategy = sortEventBySkill();
        break;
      default:
        _strategy = sortEventByDate();
        break;
    }
    return _strategy;
  }
}
