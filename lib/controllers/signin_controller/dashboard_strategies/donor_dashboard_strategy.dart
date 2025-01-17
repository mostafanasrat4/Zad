import 'package:flutter/widgets.dart';
import 'package:zad/views/donor_screens/donor_navigation_manager.dart';

import 'dashboard_strategy.dart';

class DonorDashboardStrategy extends DashboardStrategy {
  @override
  Widget displayDashboard() {
    return DonorNavigationManager();
  }

}