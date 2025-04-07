import 'package:flutter/material.dart';

class NavigationWidget {
  // Push a new page with a fade transition
  static Future<void> pushPage(BuildContext context, Widget page) async {
    await Navigator.push(
      context,
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) => page,
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          const begin = Offset(1.0, 0.0); // Start from the right
          const end = Offset.zero;
          const curve = Curves.easeInOut;

          final tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
          final offsetAnimation = animation.drive(tween);

          return SlideTransition(
            position: offsetAnimation,
            child: child,
          );
        },
      ),
    );
  }

  // Push and remove until a specific page with a fade transition
  static Future<void> pushAndRemoveUntil(
      BuildContext context, Widget page) async {
    await Navigator.pushAndRemoveUntil(
      context,
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) => page,
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          const begin = Offset(0.0, 1.0); // Start from the bottom
          const end = Offset.zero;
          const curve = Curves.easeInOut;

          final tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
          final offsetAnimation = animation.drive(tween);

          return SlideTransition(
            position: offsetAnimation,
            child: child,
          );
        },
      ),
      (route) => false,
    );
  }

  // Replace the current page with a new one with a fade transition
  static Future<void> replacePage(BuildContext context, Widget page) async {
    await Navigator.pushReplacement(
      context,
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) => page,
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          const begin = Offset(-1.0, 0.0); // Start from the left
          const end = Offset.zero;
          const curve = Curves.easeInOut;

          final tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
          final offsetAnimation = animation.drive(tween);

          return SlideTransition(
            position: offsetAnimation,
            child: child,
          );
        },
      ),
    );
  }

  // Navigate to a named route
  static Future<void> pushNamedRoute(BuildContext context, String routeName,
      {Object? arguments}) async {
    await Navigator.pushNamed(context, routeName, arguments: arguments);
  }

  // Replace with a named route
  static Future<void> replaceWithNamedRoute(
      BuildContext context, String routeName,
      {Object? arguments}) async {
    await Navigator.pushReplacementNamed(context, routeName, arguments: arguments);
  }

  // Pop the current page
  static void popPage(BuildContext context, [Object? result]) {
    Navigator.pop(context, result);
  }

  // Pop until a specific route
  static void popUntil(BuildContext context, String routeName) {
    Navigator.popUntil(context, ModalRoute.withName(routeName));
  }
}
