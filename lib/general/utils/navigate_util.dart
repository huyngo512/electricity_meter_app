import 'package:electricity_meter_app/constants/enums/auth_enum.dart';
import 'package:electricity_meter_app/feature/auth/screens/login_screen.dart';
import 'package:electricity_meter_app/feature/dashboard/screens/dashboard_screen.dart';
import 'package:flutter/material.dart';

class NavigateUtil {
  void navigateToView(BuildContext context, Widget route) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => route),
    );
  }
}

extension NavigateExtension on AuthStatus {
  Widget get firstView {
    switch (this) {
      case AuthStatus.authenticated:
        return const DashboardScreen();
      case AuthStatus.guest:
        return const LoginScreen();
      case AuthStatus.unknown:

        /// MARK: It can be IntroView.
        break;
    }
    return const LoginScreen();
  }
}