// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class ToogleButtonWidget extends StatefulWidget {
  const ToogleButtonWidget({super.key});

  @override
  State<ToogleButtonWidget> createState() => _ToogleButtonWidgetState();
}

class _ToogleButtonWidgetState extends State<ToogleButtonWidget> {
  bool isAnimated = false;
  final width = 250.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: GestureDetector(
          onTap: () {
            setState(() {
              isAnimated = !isAnimated;
            });
          },
          child: Stack(
            children: [
              AnimatedContainer(
                decoration: BoxDecoration(
                  color: isAnimated ? Colors.blue : Colors.grey.shade400,
                  borderRadius: BorderRadius.all(Radius.circular(50)),
                ),
                duration: Duration(milliseconds: 700),
                height: 50.0,
                width: width,
                child: Center(
                  child: Text(
                    isAnimated ? 'Marked as Read' : 'Mark as Read',
                    style: TextStyle(
                        color: isAnimated ? Colors.white : Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              AnimatedPositioned(
                left: isAnimated ? 208 : 8,
                top: 7,
                duration: Duration(milliseconds: 700),
                child: Center(
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(30))),
                    width: 35,
                    height: 35,
                    child: Icon(isAnimated ? Icons.check : Icons.visibility),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
