import 'dart:math';

import 'package:flutter/material.dart';

class AnimatedScreen extends StatefulWidget {
  static const name = 'animated_screen';
  const AnimatedScreen({super.key});

  @override
  State<AnimatedScreen> createState() => _AnimatedScreenState();
}

class _AnimatedScreenState extends State<AnimatedScreen> {
  double width = 50;
  double height = 50;
  Color color = Colors.indigo;
  double borderRadius = 10.0;

  void changeShape() {
    final randon = Random();
    width = randon.nextInt(300) + 120;
    height = randon.nextInt(300) + 120;
    borderRadius = randon.nextInt(100) + 20;
    color = Color.fromRGBO(
        randon.nextInt(255), randon.nextInt(255), randon.nextInt(255), 1);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Flutter + Material 3 ")),
      body: Center(
          child: AnimatedContainer(
        duration: const Duration(milliseconds: 400),
        curve: Curves.linear,
        width: width <= 0 ? 50 : width,
        height: height <= 0 ? 50 : height,
        decoration: BoxDecoration(
            color: color,
            borderRadius:
                BorderRadius.circular(borderRadius < 0 ? 0 : borderRadius)),
      )),
      floatingActionButton: _CustomFloatingButton(onPressed: changeShape),
    );
  }
}

class _CustomFloatingButton extends StatelessWidget {
  final VoidCallback? onPressed;
  const _CustomFloatingButton({super.key, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
        onPressed: onPressed, child: Icon(Icons.play_arrow_rounded));
  }
}
