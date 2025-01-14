import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zad/controllers/donor_dashboard_controller.dart';
import 'package:zad/controllers/providers/theme_controller.dart';
import 'package:zad/views/Beneficiary_screen.dart';
import 'package:zad/views/widgets/beneificary_card_template.dart';

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
      backgroundColor: context.watch<theme>().dark?
      CupertinoColors.darkBackgroundGray
      : CupertinoColors.extraLightBackgroundGray,
      appBar: AppBar(
        backgroundColor:
        context.watch<theme>().dark ? Colors.black : Colors.white,
        title: const Text(
          'Donor Dashboard',
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
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => BeneficiaryScreen(ben: beneficiary)));
                          },
                          child: BeneficiaryCard(
                            name: beneficiary!.fullName ?? "No Name",
                            goal: beneficiary.donationNeeded.toString() ?? "Undefined",
                            reached: beneficiary.donationReceived.toString() ?? "Undefined",
                          ).buildCard()
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


/*
*
import 'package:flutter/material.dart';
import 'package:zad/views/widgets/fundraising_event_widget.dart';

class DonorDashboardScreen extends StatefulWidget {
  const DonorDashboardScreen({super.key});

  @override
  State<DonorDashboardScreen> createState() => _DonorDashboardScreenState();
}

class _DonorDashboardScreenState extends State<DonorDashboardScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Fundraising App'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          // Search Bar
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.search),
                hintText: 'Search events...',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
              ),
            ),
          ),

          // Filters and Categories
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: SizedBox(
              height: 40,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  FilterChip(
                    label: const Text('All'),
                    onSelected: (selected) {},
                  ),
                  const SizedBox(width: 8),
                  FilterChip(
                    label: const Text('Urgent'),
                    onSelected: (selected) {},
                  ),
                  const SizedBox(width: 8),
                  FilterChip(
                    label: const Text('Health'),
                    onSelected: (selected) {},
                  ),
                  const SizedBox(width: 8),
                  FilterChip(
                    label: const Text('Social'),
                    onSelected: (selected) {},
                  ),
                  const SizedBox(width: 8),
                  FilterChip(
                    label: const Text('Educational'),
                    onSelected: (selected) {},
                  ),
                ],
              ),
            ),
          ),

          // List of Fundraising Events
          Expanded(
            child: ListView(
              children: [
                FundraisingEventWidget(
                  title: 'Event 1',
                  description: 'Description for Event 1',
                  goalAmount: 10000.0,
                  raisedAmount: 5000.0,
                  timeRemaining: const Duration(days: 10),
                  beneficiaryName: 'Beneficiary 1',
                  tags: ['Health'],
                  onDonatePressed: () {},
                  onSharePressed: () {},
                  onViewDetailsPressed: () {},
                ),
                FundraisingEventWidget(
                  title: 'Event 2',
                  description: 'Description for Event 2',
                  goalAmount: 20000.0,
                  raisedAmount: 15000.0,
                  timeRemaining: const Duration(days: 5),
                  beneficiaryName: 'Beneficiary 2',
                  tags: ['Community'],
                  onDonatePressed: () {},
                  onSharePressed: () {},
                  onViewDetailsPressed: () {},
                ),
                // Add more event widgets here
              ],
            ),
          ),
        ],
      ),

      // Navigation Bar
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'My Donations',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: 'Notifications',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        currentIndex: 0, // Home page index
        onTap: (index) {
          // Handle navigation between pages
        },
      ),
    );
  }
}


* */