import 'package:flutter/material.dart';
import 'package:zad/controllers/signin_controller/dashboard_strategies/dashboard_strategy.dart';

class DashboardContext{
  late DashboardStrategy _dashboardStrategy;

  void setDashboardStrategy(DashboardStrategy dashboardStrategy){
    _dashboardStrategy = dashboardStrategy;
  }

  Widget showDashboard(){
    return _dashboardStrategy.displayDashboard();
  }

}