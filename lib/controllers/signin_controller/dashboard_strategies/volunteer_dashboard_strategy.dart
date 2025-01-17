import 'package:flutter/widgets.dart';
import 'package:zad/views/volunteer_screens/volunteer_dashboard_screen.dart';

import 'dashboard_strategy.dart';

class VolunteerDashboardStrategy extends DashboardStrategy {
  @override
  Widget displayDashboard() {
    return VolunteerDashboardScreen();
  }

}