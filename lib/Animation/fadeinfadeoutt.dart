import 'package:flutter/material.dart';

class FadeInFadeOut extends PageRouteBuilder {
  final Widget page;
  FadeInFadeOut({required this.page})
      : super(
          pageBuilder: (context, animation, secondaryAnimation) => page,
          transitionsBuilder:
              (context, animation, secondaryAnimation, child) {
            return FadeTransition(opacity: animation, child: child);
          },
          transitionDuration: Duration(milliseconds: 400),
        );
}
