import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zad/controllers/providers/theme_controller.dart';
import 'package:zad/views/donor_screens/my_donations_screen.dart';
import 'package:zad/views/notifications_screen.dart';
import 'package:zad/views/profile_screen.dart';
import 'package:zad/views/volunteer_screens/volunteer_dashboard_screen.dart';

class VolunteerNavigationManager extends StatefulWidget {
  const VolunteerNavigationManager({super.key});

  @override
  State<VolunteerNavigationManager> createState() => _VolunteerNavigationManagerState();
}

class _VolunteerNavigationManagerState extends State<VolunteerNavigationManager> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    VolunteerDashboardScreen(),
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
            : CupertinoColors.extraLightBackgroundGray,
        currentIndex: _currentIndex,
        onTap: _onTap,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
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



