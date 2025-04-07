import 'package:flutter/material.dart';

class FadeInLeft extends StatefulWidget {
  final Widget child;

  // ignore: use_key_in_widget_constructors
  const FadeInLeft({required this.child});

  @override
  _FadeInLeftState createState() => _FadeInLeftState();
}

class _FadeInLeftState extends State<FadeInLeft>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<Offset> translateAnimation;
  late Animation<double> fadeAnimation;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );
    translateAnimation =
        Tween<Offset>(begin: const Offset(-1.5, 0), end: Offset.zero).animate(
      CurvedAnimation(
        parent: controller,
        curve: Curves.decelerate,
      ),
    );
    fadeAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: controller,
        curve: Curves.decelerate,
      ),
    );
    controller.forward();
  }

  @override
  void didUpdateWidget(FadeInLeft oldWidget) {
    super.didUpdateWidget(oldWidget);
    controller.reset();
    controller.forward();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: fadeAnimation,
      child: SlideTransition(
        position: translateAnimation,
        child: widget.child,
      ),
    );
  }
}
