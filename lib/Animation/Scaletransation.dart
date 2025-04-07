import 'package:flutter/material.dart';

class ScaleInUp extends StatefulWidget {
  final Widget child;

  const ScaleInUp({Key? key, required this.child}) : super(key: key);

  @override
  _ScaleInUpState createState() => _ScaleInUpState();
}

class _ScaleInUpState extends State<ScaleInUp>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<Offset> slideAnimation;
  late Animation<double> scaleAnimation;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    );

    slideAnimation =
        Tween<Offset>(begin: const Offset(0, 0.3), end: Offset.zero).animate(
      CurvedAnimation(
        parent: controller,
        curve: Curves.easeOut,
      ),
    );

    scaleAnimation = Tween<double>(begin: 0.8, end: 1.0).animate(
      CurvedAnimation(
        parent: controller,
        curve: Curves.easeOutBack,
      ),
    );

    controller.forward();
  }

  @override
  void didUpdateWidget(covariant ScaleInUp oldWidget) {
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
    return SlideTransition(
      position: slideAnimation,
      child: ScaleTransition(
        scale: scaleAnimation,
        child: widget.child,
      ),
    );
  }
}
