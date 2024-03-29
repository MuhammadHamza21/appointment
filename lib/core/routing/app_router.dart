import 'package:appointment/core/routing/routes.dart';
import 'package:appointment/features/login/ui/screens/login_screen.dart';
import 'package:appointment/features/onBoarding/onboarding_screen.dart';
import 'package:flutter/material.dart';

class AppRouter {
  Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.onBoardingScreen:
        return MaterialPageRoute(
          builder: (_) => const OnboardingScreen(),
        );
      case Routes.loginScreen:
        return MaterialPageRoute(
          builder: (_) => const LoginScreen(),
        );
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            appBar: AppBar(),
            body: Center(
              child: Text("No route defined for ${settings.name}"),
            ),
          ),
        );
    }
  }
}
