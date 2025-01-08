import 'package:flutter/material.dart';
import 'package:zad/views/donor_dashboard_screen.dart';
import 'package:zad/views/donor_screens/my_donations_screen.dart';
import 'package:zad/views/notifications_screen.dart';
import 'package:zad/views/profile_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:zad/controllers/providers/theme_controller.dart';

class DonorNavigationManager extends StatefulWidget {
  const DonorNavigationManager({super.key});

  @override
  State<DonorNavigationManager> createState() => _DonorNavigationManagerState();
}

class _DonorNavigationManagerState extends State<DonorNavigationManager> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    DonorDashboardScreen(),
    MyDonationsScreen(),
    NotificationsScreen(),
    ProfileScreen(),
  ];

  void _onTap(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: _pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: context.watch<theme>().dark?
        CupertinoColors.darkBackgroundGray
            : CupertinoColors.extraLightBackgroundGray,,
        currentIndex: _currentIndex,
        onTap: _onTap,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: 'My Donations',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: 'Notifications',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'My Profile',
          ),
        ],
      ),
    );
  }
}



