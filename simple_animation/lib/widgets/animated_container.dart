import 'package:flutter/material.dart';

class AnimatedContainerWidget extends StatefulWidget {
  const AnimatedContainerWidget({super.key});
  @override
  State<AnimatedContainerWidget> createState() => _AnimatedContainerWidgetState();
}
class _AnimatedContainerWidgetState extends State<AnimatedContainerWidget> {
  final double _height = 100.0;
  double _width = 100.0;

  void _increaseWidth() {
    setState(() {
      _width = _width >= 350.0 ? 100.0 : _width += 50.0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        AnimatedContainer(
          duration: const Duration(milliseconds: 1000),
          curve: Curves.elasticOut,
          color: Colors.yellow,
          height: _height,
          width: _width,
          child: TextButton(
            child: Text('Tap to\nGrow Width\n$_width'),
            onPressed: () {
              _increaseWidth();
            },
          ),
        ),
      ],
    );
  }
}