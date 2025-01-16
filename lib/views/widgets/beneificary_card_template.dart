//ToDo: use that card instead of the other one
import 'package:flutter/material.dart';
import 'package:zad/views/widgets/card_template.dart';

class BeneficiaryCard extends CardTemplate {
  final String name;
  final String goal;
  final String reached;

  BeneficiaryCard({
    required this.name,
    required this.goal,
    required this.reached,
  });

  @override
  double getElevation() => 4.0;

  @override
  Color getBackgroundColor() => Colors.white;

  @override
  Widget buildTitle() {
    return Text(
      name,
      style: const TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  @override
  Widget buildContent() {
    return Text(
      "goal: $goal",
      style: const TextStyle(fontSize: 16),
    );
  }

  @override
  Widget buildFooter() {
    return Text(
      "Reached: $reached",
      style: const TextStyle(
        fontSize: 14,
        fontStyle: FontStyle.italic,
      ),
    );
  }
}
