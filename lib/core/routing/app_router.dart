import 'package:appointment/app/presentation/layouts/home_layout.dart';
import 'package:appointment/authentication/presentation/screens/forgot_password_screen.dart';
import 'package:appointment/authentication/presentation/screens/otp_verification_screen.dart';
import 'package:appointment/authentication/presentation/screens/register_screen.dart';
import 'package:appointment/core/routing/routes.dart';
import 'package:appointment/authentication/presentation/screens/login_screen.dart';
import 'package:appointment/app/presentation/screens/onboarding_screen.dart';
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
      case Routes.registerScreen:
        return MaterialPageRoute(
          builder: (_) => const RegisterScreen(),
        );
      case Routes.forgotPasswordScreen:
        return MaterialPageRoute(
          builder: (_) => const ForgotPasswordScreen(),
        );
      case Routes.otpVerificationScreen:
        return MaterialPageRoute(
          builder: (_) => const OtpVerificationScreen(),
        );
      case Routes.homeLayout:
        return MaterialPageRoute(
          builder: (_) => const HomeLayout(),
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
