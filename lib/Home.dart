import 'dart:math';

import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  double width = 50;
  double heigth = 50;
  double opacity = 1.0;
  Color color = Colors.green;
  BorderRadiusGeometry borderRadious = BorderRadius.circular(8);

  void startAnimation() {
    setState(() {
      opacity = opacity == 0 ? 1.0 : 0.0;
      final random = Random();
      width = random.nextInt(300).toDouble();
      heigth = random.nextInt(300).toDouble();
      color = Color.fromRGBO(
          random.nextInt(256), random.nextInt(256), random.nextInt(256), 1);
      borderRadious = BorderRadius.circular(random.nextInt(100).toDouble());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: AnimatedOpacity(
          opacity: opacity,
          duration: const Duration(milliseconds: 800),
          child: AnimatedContainer(
            duration: const Duration(seconds: 1),
            curve: Curves.bounceOut,
            width: width,
            height: heigth,
            decoration: BoxDecoration(
              color: color,
              borderRadius: borderRadious,
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          startAnimation();
        },
        child: const Icon(Icons.play_arrow),
      ),
    );
  }
}
