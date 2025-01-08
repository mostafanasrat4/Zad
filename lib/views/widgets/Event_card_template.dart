//ToDo: use that card instead of the other one

import 'package:flutter/material.dart';
import 'package:zad/views/card_template.dart';

class EventCard extends CardTemplate {
  final String name;
  final String location;
  final DateTime date;

  EventCard({
    required this.name,
    required this.location,
    required this.date,
  });

  @override
  double getElevation() => 2.0;

  @override
  Color getBackgroundColor() => Colors.grey[100]!;

  @override
  Widget buildTitle() {
    return Text(
      name,
      style: const TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  @override
  Widget buildContent() {
    return Text(
      "Location: $location",
      style: const TextStyle(fontSize: 14),
    );
  }

  @override
  Widget buildFooter() {
    return Text(
      "Date: ${date.toLocal()}",
      style: const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
        color: Colors.green,
      ),
    );
  }
}
