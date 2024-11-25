import 'package:flutter/material.dart';

class AnimatedMagnifier extends StatefulWidget {
  const AnimatedMagnifier({super.key});
  @override
  AnimatedMagnifierState createState() => AnimatedMagnifierState();
}

class AnimatedMagnifierState extends State<AnimatedMagnifier>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    )..repeat(reverse: true);
    _animation = Tween(begin: 1.0, end: 0.8).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        return Transform.scale(
          scale: _animation.value,
          child: child,
        );
      },
      child: Image.asset('assets/magnifier.png'),
    );
  }
}
