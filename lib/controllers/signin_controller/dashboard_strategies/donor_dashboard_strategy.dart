import 'package:flutter/widgets.dart';
import 'package:zad/views/donor_screens/donor_dashboard_screen.dart';

import 'dashboard_strategy.dart';

class DonorDashboardStrategy extends DashboardStrategy {
  @override
  Widget displayDashboard() {
    return DonorDashboardScreen();
  }

}