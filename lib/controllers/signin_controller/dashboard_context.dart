import 'package:zad/controllers/signin_controller/dashboard_strategies/dashboard_strategy.dart';

class DashboardContext{
  late DashboardStrategy _dashboardStrategy;

  // TODO: add showDashboard() method

  void setDashboardStrategy(DashboardStrategy dashboardStrategy){
    _dashboardStrategy = dashboardStrategy;
  }

}