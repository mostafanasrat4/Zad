import 'package:flutter/material.dart';

abstract class CardTemplate {
  Widget buildCard() {
    return Card(
      elevation: getElevation(),
      color: getBackgroundColor(),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            buildTitle(),
            const SizedBox(height: 8),
            buildContent(),
            const SizedBox(height: 8),
            buildFooter(),
          ],
        ),
      ),
    );
  }

  double getElevation();
  Color getBackgroundColor();
  Widget buildTitle();
  Widget buildContent();
  Widget buildFooter();
}

