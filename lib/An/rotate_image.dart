import 'dart:math';

import 'package:flutter/material.dart';

class RotateImage extends StatefulWidget {
  const RotateImage({super.key});

  @override
  State<RotateImage> createState() => _RotateImageState();
}

class _RotateImageState extends State<RotateImage> with SingleTickerProviderStateMixin{
  late AnimationController animController;
  late Animation<double> animation;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    animController = AnimationController(
        duration: Duration(seconds: 5),
        vsync: this
    );
    final curvedAnimation = CurvedAnimation(parent: animController, curve: Curves.bounceInOut);
    animation = Tween<double>(begin: 0,end: 2 *pi).animate(curvedAnimation)
      ..addListener(() {
      setState(() {

      });
    })..addStatusListener((status) {
      if(status == AnimationStatus.completed){
        animController.reverse();
      }
      else if(status == AnimationStatus.dismissed){
        animController.forward();
      }
      });
    animController.forward();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Transform.rotate(
          angle: animation.value,
        child: Center(
          child: Image(
            image: AssetImage('Images/pp.jpg'),
          ),
        ),
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
