//ToDo: use that card instead of the other one

import 'package:flutter/material.dart';
import 'package:zad/views/card_template.dart';

class EventCard extends CardTemplate {
  final String productName;
  final String description;

  EventCard({
    required this.productName,
    required this.description,
  });

  @override
  double getElevation() => 2.0;

  @override
  Color getBackgroundColor() => Colors.grey[100]!;

  @override
  Widget buildTitle() {
    return Text(
      productName,
      style: const TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  @override
  Widget buildContent() {
    return Text(
      description,
      style: const TextStyle(fontSize: 14),
    );
  }

  @override
  Widget buildFooter() {
    return Text(
      'footer',
      style: const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
        color: Colors.green,
      ),
    );
  }
}
