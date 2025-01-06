import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zad/controllers/donor_dashboard_controller.dart';
import 'package:zad/controllers/providers/theme_controller.dart';
import 'package:zad/views/widgets/beneficiary_card.dart';
import '../models/services/beneficiary_list.dart';

class DonorDashboardScreen extends StatefulWidget {
  const DonorDashboardScreen({super.key});

  @override
  State<DonorDashboardScreen> createState() => _DonorDashboardScreenState();
}

class _DonorDashboardScreenState extends State<DonorDashboardScreen> {
  BeneficiaryList beneficiaryList = BeneficiaryList([]);
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    loadData();
  }

  Future<void> loadData() async {
    setState(() {
      isLoading = true;
    });
    final beneficiaries = await DonorDashboardController().getBeneficiaries();
    setState(() {
      beneficiaryList = BeneficiaryList(beneficiaries);
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final iterator = beneficiaryList.createIterator();
    return Scaffold(
      backgroundColor: context.watch<theme>().dark
          ? CupertinoColors.darkBackgroundGray
          : CupertinoColors.extraLightBackgroundGray,
      appBar: AppBar(
        backgroundColor:
            context.watch<theme>().dark ? Colors.black : Colors.white,
        title: const Text(
          'Donor Dashboard',
          style: TextStyle(color: Colors.blueAccent),
        ),
        actions: [
          IconButton(
            onPressed: () {
              context.read<theme>().changeTheme();
            },
            icon: context.read<theme>().dark
                ? const Icon(Icons.light_mode, color: Colors.yellow)
                : const Icon(Icons.dark_mode, color: Colors.blueAccent),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: isLoading
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : iterator.hasNext()
                ? GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      crossAxisSpacing: 12,
                      mainAxisSpacing: 12,
                      childAspectRatio: 4 / 5,
                    ),
                    itemCount: beneficiaryList.beneficiaries.length,
                    itemBuilder: (context, index) {
                      final beneficiary = iterator.next();
                      return GestureDetector(
                        onTap: () {},
                        child: BeneficiaryCard(
                          name: beneficiary!.fullName ?? "No Name",
                          image: beneficiary.imageURL,
                        ),
                      );
                    },
                  )
                : const Center(
                    child: Text(
                      "No beneficiaries available",
                      style: TextStyle(fontSize: 18, color: Colors.grey),
                    ),
                  ),
      ),
    );
  }
}
