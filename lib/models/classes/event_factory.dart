import 'event.dart';
import 'workshop_event.dart';
import 'fundraiser_event.dart';

class EventFactory {
  static Event createEvent(Map<String, dynamic> map) {
    final type = map['type'] ?? 'default';

    switch (type) {
      case 'workshop':
        return WorkshopEvent.fromMap(map);
      case 'fundraiser':
        return FundraiserEvent.fromMap(map);
      default:
        return Event.fromMap(map);
    }
  }
}
