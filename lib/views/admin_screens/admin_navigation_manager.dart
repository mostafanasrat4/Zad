import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zad/controllers/providers/theme_controller.dart';
import 'package:zad/views/admin_screens/adminScreen.dart';
import 'package:zad/views/admin_screens/admin_dashboard_screen.dart';
import 'package:zad/views/donor_screens/donor_dashboard_screen.dart';
import 'package:zad/views/donor_screens/my_donations_screen.dart';
import 'package:zad/views/notifications_screen.dart';
import 'package:zad/views/profile_screen.dart';

class AdminNavigationManager extends StatefulWidget {
  const AdminNavigationManager({super.key});

  @override
  State<AdminNavigationManager> createState() => _AdminNavigationManagerState();
}

class _AdminNavigationManagerState extends State<AdminNavigationManager> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    AdminDashboardScreen(),
    AdminScreen(),
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
        // backgroundColor: context.watch<theme>().dark?
        // CupertinoColors.darkBackgroundGray
        //     : CupertinoColors.extraLightBackgroundGray,
        backgroundColor: Colors.lightBlue,
        currentIndex: _currentIndex,
        onTap: _onTap,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.dashboard),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.event),
            label: 'Events',
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



