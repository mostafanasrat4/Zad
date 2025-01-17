import 'package:flutter/material.dart';
import 'package:zad/controllers/Beneficiary_screen_controller.dart';
import 'package:zad/models/classes/beneficiary.dart';

showDonationPopup(BuildContext context, Beneficiary ben) {
  String? selectedDonationType; // Variable to hold the selected dropdown value
  TextEditingController amountController = TextEditingController();

  showDialog(
    context: context,
    builder: (BuildContext context) {
      return StatefulBuilder(
        builder: (context, setState) {
          return AlertDialog(
            title: Text('Enter Details'),
            content: Column(
              mainAxisSize: MainAxisSize.min, // To make the dialog compact
              children: [
                TextField(
                  controller: amountController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(labelText: 'Amount'),
                ),
                DropdownButton<String>(
                  value: selectedDonationType,
                  hint: Text('Select Donation Type'),
                  items: [
                    DropdownMenuItem(value: 'cash', child: Text('Cash')),
                    DropdownMenuItem(value: 'cheque', child: Text('Cheque')),
                    DropdownMenuItem(value: 'card', child: Text('Card')),
                  ],
                  onChanged: (String? newValue) {
                    setState(() {
                      selectedDonationType = newValue;
                    });
                  },
                ),
              ],
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('Cancel'),
              ),
              TextButton(
                onPressed: () {
                  final int? amount = int.tryParse(amountController.text);
                  if (selectedDonationType != null && amount != null) {
                    BeneficiaryScreenController().Donate(
                      ben.id,
                      selectedDonationType!,
                      amount,
                    );
                    Navigator.of(context).pop();
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Please select a donation type.')),
                    );
                  }
                },
                child: Text('Confirm Donation'),
              ),
            ],
          );
        },
      );
    },
  );
}
