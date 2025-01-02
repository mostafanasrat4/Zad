import 'package:flutter/widgets.dart';
import 'package:zad/views/admin_dashboard_screen.dart';
import 'dashboard_strategy.dart';

class AdminDashboardStrategy extends DashboardStrategy {
  @override
  Widget displayDashboard() {
    return AdminDashboardScreen();
  }

}