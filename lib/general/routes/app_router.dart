import 'package:electricity_meter_app/feature/account/screens/account_register_screen.dart';
import 'package:electricity_meter_app/feature/account/screens/account_sms_register_screen.dart';
import 'package:electricity_meter_app/feature/auth/screens/login_screen.dart';
import 'package:electricity_meter_app/feature/auth/screens/sms_login_screen.dart';
import 'package:electricity_meter_app/feature/dashboard/screens/dashboard_screen.dart';
import 'package:electricity_meter_app/general/routes/route_paths.dart';
import 'package:flutter/material.dart';

class AppRouter {
  static Route onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(
          settings: const RouteSettings(name: '/'),
          builder: (_) => const Scaffold(),
        );
      case RoutePaths.LOGIN:
        return MaterialPageRoute(
          settings: RouteSettings(
            name: RoutePaths.LOGIN,
            arguments: settings.arguments,
          ),
          builder: (context) => const LoginScreen(),
        );
      case RoutePaths.SMS_LOGIN:
        return MaterialPageRoute(
          settings: RouteSettings(
            name: RoutePaths.SMS_LOGIN,
            arguments: settings.arguments,
          ),
          builder: (context) => const SmsLoginScreen(),
        );
      case RoutePaths.REGISTER:
        return MaterialPageRoute(
          settings: RouteSettings(
            name: RoutePaths.REGISTER,
            arguments: settings.arguments,
          ),
          builder: (context) => const AccountRegisterScreen(),
        );
      case RoutePaths.SMS_REGISTER:
        return MaterialPageRoute(
          settings: RouteSettings(
            name: RoutePaths.REGISTER,
            arguments: settings.arguments,
          ),
          builder: (context) => const AccountSmsRegisterScreen(),
        );
      case RoutePaths.DASHBOARD:
        return MaterialPageRoute(
          settings: RouteSettings(
            name: RoutePaths.DASHBOARD,
            arguments: settings.arguments,
          ),
          builder: (context) => const DashboardScreen(),
        );
      default:
        return _errorRoute();
    }
  }

  static Route onGenerateNestedRoute(RouteSettings settings) {
    print('Nested Route: ${settings.name}');
    // this is where you define the nested routes.
    switch (settings.name) {
      default:
        return _errorRoute();
    }
  }

  static Route _errorRoute() {
    return MaterialPageRoute(
      builder: (_) => Scaffold(
        appBar: AppBar(
          title: const Text('Error'),
        ),
        body: const Center(
          child: Text('Something went wrong'),
        ),
      ),
    );
  }
}
