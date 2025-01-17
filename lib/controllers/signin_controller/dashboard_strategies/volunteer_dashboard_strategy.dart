import 'package:flutter/widgets.dart';
import 'package:zad/views/volunteer_screens/volunteer_navigation_manager.dart';

import 'dashboard_strategy.dart';

class VolunteerDashboardStrategy extends DashboardStrategy {
  @override
  Widget displayDashboard() {
    return VolunteerNavigationManager();
  }

}