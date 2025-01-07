import 'package:flutter/material.dart';
import 'package:zad/models/classes/beneficiary.dart';

class BeneficiaryScreen extends StatelessWidget {
  Beneficiary ben;
  BeneficiaryScreen({super.key, required this.ben});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(ben.fullName!),
      ),
      body: Center(
        child: Text(ben.fullName!),
      ),
    );
  }
}
