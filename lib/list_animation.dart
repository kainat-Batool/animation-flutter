import 'package:flutter/material.dart';

class ListAnimation extends StatefulWidget {
  const ListAnimation({super.key});

  @override
  State<ListAnimation> createState() => _ListAnimationState();
}

class _ListAnimationState extends State<ListAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late List<Animation<Offset>> animations = [];
  final itemcount = 5;

  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(vsync: this, duration: Duration(seconds: 5));

    animations = List.generate(itemcount, (index) {
      return Tween(begin: Offset(-1, 0), end: Offset.zero).animate(
          CurvedAnimation(
              parent: controller, curve: Interval(index * (1 / itemcount), 1)));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: itemcount,
        itemBuilder: (context, index) {
          return SlideTransition(
              position: animations[index],
              child:
                  ListTile(title: Text('${index.toString()}) Hello World '),));
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          controller.forward();
        },
        child: Icon(Icons.check),
      ),
    );
  }
}
