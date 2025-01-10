import 'package:zad/models/classes/ConcreteFactories.dart';
import 'package:zad/models/interfaces/IEventFactory.dart';

class EventFactorySelector {
  EventFactory getFactory(String type) {
    switch (type) {
      case 'workshop':
        return WorkshopEventFactory();
      case 'fundraiser':
        return FundraiserEventFactory();
      case "social":
        return SocialEventFactory();
      default:
        throw Exception("type is not available");
    }
  }
}
