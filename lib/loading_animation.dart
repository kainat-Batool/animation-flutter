// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class RadialAnimaion extends StatefulWidget {
  final double progress;
  final Color color;

  const RadialAnimaion(
      {required this.color, required this.progress, super.key});

  @override
  State<RadialAnimaion> createState() => _RadialAnimaionState();
}

class _RadialAnimaionState extends State<RadialAnimaion>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> animations;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
        vsync: this, duration: Duration(milliseconds: 1000));

    animations = Tween(begin: 0.0, end: widget.progress).animate(controller);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: AnimatedBuilder(
          animation: animations,
          builder: (context, child) {
            return Stack(
              alignment: Alignment.center,
              children: [
                SizedBox(
                  width: 150,
                  height: 150,
                  child: CircularProgressIndicator(
                    value: animations.value,
                    strokeWidth: 10,
                    backgroundColor: Colors.grey.shade100,
                  ),
                ),
                Text(
                  '${(animations.value * 100).toInt()}%',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                  ),
                ),
              ],
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          controller.forward();
        },
        child: Icon(Icons.start),
      ),
    );
  }
}
