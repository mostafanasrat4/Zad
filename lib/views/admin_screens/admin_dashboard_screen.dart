import 'package:flutter/material.dart';

class AdminDashboardScreen extends StatefulWidget {
  const AdminDashboardScreen({super.key});

  @override
  State<AdminDashboardScreen> createState() => _AdminDashboardScreenState();
}

class _AdminDashboardScreenState extends State<AdminDashboardScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Admin Dashboard'),
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
              value: '\$120,000',
              color: Colors.green,
            ),
            _buildDashboardCard(
              icon: Icons.money_off,
              title: 'Total Funds Required',
              value: '\$200,000',
              color: Colors.red,
            ),
            _buildDashboardCard(
              icon: Icons.people,
              title: 'Beneficiaries',
              value: '850',
              color: Colors.blue,
            ),
            _buildDashboardCard(
              icon: Icons.favorite,
              title: 'Total Donors',
              value: '1,200',
              color: Colors.purple,
            ),
            _buildDashboardCard(
              icon: Icons.event,
              title: 'Total Events',
              value: '35',
              color: Colors.orange,
            ),
            _buildDashboardCard(
              icon: Icons.volunteer_activism,
              title: 'Total Volunteers',
              value: '420',
              color: Colors.cyan,
            ),
            _buildDashboardCard(
              icon: Icons.card_giftcard,
              title: 'Total Donations',
              value: '2,500',
              color: Colors.pink,
            ),
          ],
        ),
      ),
    );
  }
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
          SizedBox(height: 8.0),
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
            style: TextStyle(
              fontSize: 22.0,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          SizedBox(height: 8.0),
          LinearProgressIndicator(
            value: 0.7, // Example progress
            color: color,
            backgroundColor: color.withOpacity(0.2),
          ),
        ],
      ),
    ),
  );
}
