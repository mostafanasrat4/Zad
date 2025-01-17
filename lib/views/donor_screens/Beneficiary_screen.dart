import 'package:flutter/material.dart';
import 'package:zad/controllers/Beneficiary_screen_controller.dart';
import 'package:zad/models/classes/beneficiary.dart';
import 'package:zad/views/widgets/donation_popup.dart';

class BeneficiaryScreen extends StatelessWidget {
  final Beneficiary ben;
  BeneficiaryScreen({super.key, required this.ben});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(ben.fullName!),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Name: ${ben.fullName!}",
              style: const TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 10),
            Text(
              "Email: ${ben.email!}",
              style: const TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 10),
            Text(
              "Phone Number: ${ben.phoneNo!}",
              style: const TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 10),
          LinearProgressIndicator(
            value: (ben.donationNeeded! / ben.donationReceived!),
          ),
            BeneficiaryScreenController().isDonor()?
                ElevatedButton(onPressed: (){
                  showDonationPopup(context, ben);
                }, child: const Text("Donate")):const Text("You Can't donate unless you are a Donor"),
          ],
        ),
      ),
    );
  }
}
