import 'package:flutter/material.dart';
import 'package:zad/controllers/Beneficiary_screen_controller.dart';
import 'package:zad/models/classes/beneficiary.dart';
import 'package:zad/views/widgets/donation_popup.dart';

class BeneficiaryDetailsScreen extends StatefulWidget {
  final Beneficiary ben;
  BeneficiaryDetailsScreen({super.key, required this.ben});

  @override
  State<BeneficiaryDetailsScreen> createState() => _BeneficiaryDetailsScreenState();
}

class _BeneficiaryDetailsScreenState extends State<BeneficiaryDetailsScreen> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.ben.fullName!),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Name: ${widget.ben.fullName!}",
              style: const TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 10),
            Text(
              "Email: ${widget.ben.email!}",
              style: const TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 10),
            Text(
              "Phone Number: ${widget.ben.phoneNo!}",
              style: const TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 10),
          LinearProgressIndicator(
            value: (widget.ben.donationNeeded! / widget.ben.donationReceived!),
          ),
             BeneficiaryScreenController().isDonor()?
                ElevatedButton(onPressed: (){

                  showDonationPopup(context, widget.ben);
                }, child: const Text("Donate")):const Text("You Can't donate unless you are a Donor"),
          ],
        ),
      ),
    );
  }
}
