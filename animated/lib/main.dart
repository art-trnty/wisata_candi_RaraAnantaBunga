import 'package:flutter/material.dart';
import 'animated_magnifier.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Animation Controller'),
          backgroundColor: Colors.blue[100],
        ),
        body: const Center(
          child: AnimatedMagnifier(),
        ),
      ),
    );
  }
}
