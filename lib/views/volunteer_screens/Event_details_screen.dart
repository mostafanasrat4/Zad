import 'package:flutter/material.dart';
import 'package:zad/models/classes/event.dart';

class EventDetailsScreen extends StatelessWidget {
  Event myEvent;
  EventDetailsScreen({super.key, required this.myEvent});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(myEvent.name),
      ),
      body: Center(
        child: Column(
          children: [
            Text(myEvent.name),
            Text(myEvent.location),
            Text(myEvent.date.toLocal().toString()),
            Text(myEvent.description),
            myEvent.type == null || myEvent.type == "" ? Container() :
            Text(myEvent.type!),
            for(var skill in myEvent.SkillsNeeded!) Text(skill),
          ],
        ),
      ),
    );
  }
}
