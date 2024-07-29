import 'dart:math';

import 'package:flutter/material.dart';

class RotateImageTwo extends StatefulWidget {
  const RotateImageTwo({super.key});

  @override
  State<RotateImageTwo> createState() => _RotateImageTwoState();
}

class _RotateImageTwoState extends State<RotateImageTwo>
    with SingleTickerProviderStateMixin {
  late AnimationController animController;
  late Animation<double> animation;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    animController =
        AnimationController(duration: Duration(seconds: 5), vsync: this);
    final curvedAnimation =
        CurvedAnimation(parent: animController, curve: Curves.bounceInOut,
        reverseCurve: Curves.fastEaseInToSlowEaseOut);
    animation = Tween<double>(begin: 0, end: 2 * pi).animate(curvedAnimation)
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          animController.reverse();
        } else if (status == AnimationStatus.dismissed) {
          animController.forward();
        }
      });
    animController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RotatingTransition(
        child: ImageWidget(),
        angle: animation,
      ),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    animController.dispose();
    super.dispose();
  }
}

class RotatingTransition extends StatelessWidget {
  RotatingTransition({super.key, required this.angle, required this.child});

  final Widget child;
  final Animation<double> angle;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: angle,
        child: child,
        builder: (context, child) {
          return Transform.rotate(
            angle: angle.value,
            child: child,
          );
        });
  }
}

class ImageWidget extends StatelessWidget {
  const ImageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Image(
        image: AssetImage('Images/pp.jpg'),
      ),
    );
  }
}
