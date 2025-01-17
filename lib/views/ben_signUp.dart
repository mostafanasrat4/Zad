import 'package:flutter/material.dart';
import 'package:zad/models/classes/beneficiary.dart';
import 'package:zad/models/services/beneficiaryManager.dart';

class BeneficiarySignUp extends StatefulWidget {
  Beneficiary ben;
  BeneficiarySignUp({super.key, required this.ben});

  @override
  State<BeneficiarySignUp> createState() => _BeneficiarySignUpState();
}

class _BeneficiarySignUpState extends State<BeneficiarySignUp> {
  // Controllers for text input
  TextEditingController _reasonController = TextEditingController();
  TextEditingController _locationController = TextEditingController();
  TextEditingController _donationNeededController = TextEditingController();

  // Variables to store user input
  double donationNeeded = 0.0;
  String? reason;
  String? date;
  String? location;

  // Function to show a date picker
  Future<void> _pickDate() async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(Duration(days: 365)),
    );

    if (pickedDate != null) {
      setState(() {
        date = "${pickedDate.toLocal()}";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Beneficiary Sign Up"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Donation Needed Input
            TextField(
              controller: _donationNeededController,
              decoration: InputDecoration(
                labelText: "Donation Needed (\$)",
              ),
              keyboardType: TextInputType.number,
              onChanged: (value) {
                setState(() {
                  donationNeeded = double.tryParse(value) ?? 0.0;
                });
              },
            ),
            SizedBox(height: 20),

            // Reason Input
            TextField(
              controller: _reasonController,
              decoration: InputDecoration(
                labelText: "Reason for Donation",
              ),
              onChanged: (value) {
                setState(() {
                  reason = value;
                });
              },
            ),
            SizedBox(height: 20),

            // Date Picker
            ElevatedButton(
              onPressed: _pickDate,
              child: Text("Select Date"),
            ),
            SizedBox(height: 10),
            // Display selected date
            if (date != null)
              Text(
                "Selected Date: $date",
                style: TextStyle(fontSize: 16),
              ),
            SizedBox(height: 20),

            // Location Input
            TextField(
              controller: _locationController,
              decoration: InputDecoration(
                labelText: "Location",
              ),
              onChanged: (value) {
                setState(() {
                  location = value;
                });
              },
            ),
            SizedBox(height: 20),

            // Submit Button
            ElevatedButton(
              onPressed: () {
                // Validate and save data
                if (donationNeeded > 0 &&
                    reason != null &&
                    date != null &&
                    location != null) {
                  // ToDo handle Navigation
                  widget.ben.donationNeeded = donationNeeded;
                  widget.ben.reason = reason;
                  widget.ben.date = date;
                  widget.ben.location = location;
                  BeneficiaryManager().editUser(widget.ben);
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text("Please fill all fields."),
                    ),
                  );
                }
              },
              child: Text("Submit"),
            ),
          ],
        ),
      ),
    );
  }
}