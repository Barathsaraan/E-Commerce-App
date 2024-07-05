import 'package:flutter/material.dart';
import 'package:sunstar/screens/homescreen.dart';
import 'package:sunstar/screens/loginscreen.dart';
import 'package:sunstar/screens/otpverifyscreen.dart';

class Routes {
  static const String login = '/login';
  static const String homePage = '/home';
  // static const String otpverified = '/otp_verified';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      // case otpverified:
      //   return _fadeAnimation(const OtpverifiedScreen());
      case login:
        return _fadeAnimation(const LoginScreen());
      case homePage:
        return _fadeAnimation(const HomeScreen());
      default:
        return _fadeAnimation(const HomeScreen());
    }
  }

  static PageRouteBuilder _fadeAnimation(Widget child) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => child,
      transitionDuration: const Duration(milliseconds: 300),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return FadeTransition(
          opacity: Tween<double>(
            begin: 0.0,
            end: 1.0,
          ).animate(
            CurvedAnimation(
              parent: animation,
              curve: Curves.easeInOut,
            ),
          ),
          child: SlideTransition(
            position: Tween<Offset>(
              begin: const Offset(0.1, 0.0),
              end: Offset.zero,
            ).animate(
              CurvedAnimation(
                parent: animation,
                curve: Curves.easeInOut,
              ),
            ),
            child: child,
          ),
        );
      },
    );
  }
}
