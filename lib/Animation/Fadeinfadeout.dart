import 'package:flutter/material.dart';

class FadeInDown extends StatefulWidget {
  final Widget child;

  // ignore: use_key_in_widget_constructors
  const FadeInDown({required this.child});

  @override
  _FadeInDownState createState() => _FadeInDownState();
}

class _FadeInDownState extends State<FadeInDown>
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
        Tween<Offset>(begin: const Offset(0, -0.3), end: Offset.zero).animate(
      CurvedAnimation(
        parent: controller,
        curve: Curves.easeOutCubic,
      ),
    );
    fadeAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: controller,
        curve: Curves.easeOutCubic,
      ),
    );
    controller.forward();
  }

  @override
  void didUpdateWidget(FadeInDown oldWidget) {
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
