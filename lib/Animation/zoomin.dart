import 'package:flutter/material.dart';

class ZoomInDown extends StatefulWidget {
  final Widget child;

  const ZoomInDown({Key? key, required this.child}) : super(key: key);

  @override
  _ZoomInDownState createState() => _ZoomInDownState();
}

class _ZoomInDownState extends State<ZoomInDown>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<Offset> slideAnimation;
  late Animation<double> zoomAnimation;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    );

    slideAnimation =
        Tween<Offset>(begin: const Offset(0, -0.5), end: Offset.zero).animate(
      CurvedAnimation(
        parent: controller,
        curve: Curves.easeOut,
      ),
    );

    zoomAnimation = Tween<double>(begin: 0.5, end: 1.0).animate(
      CurvedAnimation(
        parent: controller,
        curve: Curves.easeOutBack,
      ),
    );

    controller.forward();
  }

  @override
  void didUpdateWidget(covariant ZoomInDown oldWidget) {
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
        scale: zoomAnimation,
        child: widget.child,
      ),
    );
  }
}
