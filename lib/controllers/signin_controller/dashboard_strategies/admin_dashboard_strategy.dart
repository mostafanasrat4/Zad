import 'package:flutter/widgets.dart';
import 'package:zad/views/admin_screens/admin_navigation_manager.dart';

import 'dashboard_strategy.dart';

class AdminDashboardStrategy extends DashboardStrategy {
  @override
  Widget displayDashboard() {
    return AdminNavigationManager();
  }

}