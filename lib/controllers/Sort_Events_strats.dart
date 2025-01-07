// ToDO Finish the startegy

import 'package:zad/controllers/interfaces/ISort_Events.dart';
import 'package:zad/models/classes/event.dart';

class sortEventByDate implements ISortEvents{
  @override
  List<Event> sortEvents(List<Event> events) {
    // TODO: implement sortEvents
    throw UnimplementedError();
  }

}

class sortEventByLocation implements ISortEvents{
  @override
  List<Event> sortEvents(List<Event> events) {
    // TODO: implement sortEvents
    throw UnimplementedError();
  }

}

class sortEventBySkill implements ISortEvents{
  @override
  List<Event> sortEvents(List<Event> events) {
    // TODO: implement sortEvents
    throw UnimplementedError();
  }

}

class sortEventByType implements ISortEvents{
  @override
  List<Event> sortEvents(List<Event> events) {
    // TODO: implement sortEvents
    throw UnimplementedError();
  }

}

class setStrategy{
   late ISortEvents _strategy;
   switchStrategy(String strategy){
     switch(strategy){
       case "Date": return sortEventByDate();
       case "Location": return sortEventByLocation();
       case "Type": return sortEventByType();
       case "Skill": return sortEventBySkill();
       default: return sortEventByDate();
     }
   }

}
