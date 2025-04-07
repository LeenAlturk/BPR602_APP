import 'package:flutter/material.dart';

class FlipInX extends StatefulWidget {
  final Widget child;

  const FlipInX({Key? key, required this.child}) : super(key: key);

  @override
  _FlipInXState createState() => _FlipInXState();
}

class _FlipInXState extends State<FlipInX>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> flipAnimation;
  late Animation<double> fadeAnimation;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );

    flipAnimation = Tween<double>(begin: 1.5, end: 0.0).animate(
      CurvedAnimation(
        parent: controller,
        curve: Curves.easeOutBack,
      ),
    );

    fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: controller,
        curve: Curves.easeIn,
      ),
    );

    controller.forward();
  }

  @override
  void didUpdateWidget(covariant FlipInX oldWidget) {
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
      child: AnimatedBuilder(
        animation: flipAnimation,
        builder: (context, child) {
          return Transform(
            alignment: Alignment.center,
            transform: Matrix4.rotationX(flipAnimation.value),
            child: child,
          );
        },
        child: widget.child,
      ),
    );
  }
}
