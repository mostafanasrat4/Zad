import 'package:flutter/material.dart';
import 'package:zad/controllers/admin_dashboard_controller.dart';

class AdminDashboardScreen extends StatefulWidget {
  const AdminDashboardScreen({super.key});

  @override
  State<AdminDashboardScreen> createState() => _AdminDashboardScreenState();
}

class _AdminDashboardScreenState extends State<AdminDashboardScreen> {
  double totalFundsRaised = 0.0;
  double totalFundsRequired = 0.0;
  int totalBeneficiaries = 0;
  int totalDonors = 0;
  int totalEvents = 0;
  int totalVolunteers = 0;
  int totalDonations = 0;

  AdminDashboardController _adminDashboardController = AdminDashboardController();

  @override
  Future<void> initState() async {
    super.initState();
    updateMetrics();
  }

  Future<void> updateMetrics() async {
    setState(() async {
      totalFundsRaised = (await _adminDashboardController.getTotalFundsRaised())!;
      totalFundsRequired = (await _adminDashboardController.getTotalFundsRequired())!;
      totalBeneficiaries = (await _adminDashboardController.getTotalNoOfBeneficiaries())!;
      totalEvents = (await _adminDashboardController.getTotalNoOfEvents())!;
      totalVolunteers = (await _adminDashboardController.getTotalNoOfVolunteers())!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Admin Dashboard'),
        backgroundColor: Colors.teal,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.count(
          crossAxisCount: 3,
          crossAxisSpacing: 16.0,
          mainAxisSpacing: 16.0,
          children: [
            _buildDashboardCard(
              icon: Icons.attach_money,
              title: 'Total Funds Raised',
              value: '\$${totalFundsRaised.toStringAsFixed(2)}',
              color: Colors.green,
            ),
            _buildDashboardCard(
              icon: Icons.money_off,
              title: 'Total Funds Required',
              value: '\$${totalFundsRequired.toStringAsFixed(2)}',
              color: Colors.red,
            ),
            _buildDashboardCard(
              icon: Icons.people,
              title: 'Beneficiaries',
              value: '$totalBeneficiaries',
              color: Colors.blue,
            ),
            _buildDashboardCard(
              icon: Icons.favorite,
              title: 'Total Donors',
              value: '$totalDonors',
              color: Colors.purple,
            ),
            _buildDashboardCard(
              icon: Icons.event,
              title: 'Total Events',
              value: '$totalEvents',
              color: Colors.orange,
            ),
            _buildDashboardCard(
              icon: Icons.volunteer_activism,
              title: 'Total Volunteers',
              value: '$totalVolunteers',
              color: Colors.cyan,
            ),
            _buildDashboardCard(
              icon: Icons.card_giftcard,
              title: 'Total Donations',
              value: '$totalDonations',
              color: Colors.pink,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await updateMetrics();
        },
        child: const Icon(Icons.refresh),
        backgroundColor: Colors.teal,
      ),
    );
  }

  Widget _buildDashboardCard({
    required IconData icon,
    required String title,
    required String value,
    required Color color,
  }) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(
              backgroundColor: color.withOpacity(0.2),
              child: Icon(icon, color: color),
            ),
            const SizedBox(height: 8.0),
            Text(
              title,
              style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
                color: Colors.grey[800],
              ),
            ),
            Text(
              value,
              style: const TextStyle(
                fontSize: 22.0,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 8.0),
            LinearProgressIndicator(
              value: 0.7, // Example static progress
              color: color,
              backgroundColor: color.withOpacity(0.2),
            ),
          ],
        ),
      ),
    );
  }
}
