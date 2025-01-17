import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zad/controllers/donor_dashboard_controller.dart';
import 'package:zad/controllers/providers/theme_controller.dart';
import 'package:zad/models/classes/donation.dart';


class MyDonationsScreen extends StatefulWidget {
  const MyDonationsScreen({super.key});

  @override
  State<MyDonationsScreen> createState() => _MyDonationsScreenState();
}

class _MyDonationsScreenState extends State<MyDonationsScreen> {
  bool isLoading = true;
  List<Donation> DonationsList = [];

  @override
  void initState() {
    super.initState();
    loadData();
  }

  Future<void> loadData() async {
    setState(() {
      isLoading = true;
    });
    final donations = await DonorDashboardController().getDonations();
    setState(() {
      DonationsList = donations;
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.watch<theme>().dark?
      CupertinoColors.darkBackgroundGray
          : CupertinoColors.extraLightBackgroundGray,
      appBar: AppBar(
        backgroundColor:
        context.watch<theme>().dark ? Colors.black : Colors.white,
        title: const Text(
          'My Donations',
        ),
        actions: [
          IconButton(
            icon: context.read<theme>().dark
                ? const Icon(Icons.light_mode, color: Colors.yellow)
                : const Icon(Icons.dark_mode, color: Colors.blueAccent),
            onPressed: () {
              context.read<theme>().changeTheme();
            },
          )
        ],
      ),
      body: Center(
        child: isLoading ?
        const Center(child: CircularProgressIndicator())
        : ListView.builder(
          itemCount: DonationsList.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                //ToDo Navigate to Donations details or a popUP
              },
              child: ListTile(
                title: Text("Donation amount ${DonationsList[index].amount}"),
              ),
            );
          },
        ),
      )

    );
  }
}
