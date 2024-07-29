import 'dart:async';

import 'package:flutter/material.dart';

class SplashAnimation extends StatefulWidget {
  const SplashAnimation({super.key});

  @override
  State<SplashAnimation> createState() => _SplashAnimationState();
}

class _SplashAnimationState extends State<SplashAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<double> animation;
  @override
  void initState() {
    super.initState();
    animationController =
        AnimationController(vsync: this, duration: Duration(seconds: 1));
    animation = Tween<double>(begin: 1, end: 10).animate(animationController);
    animation.addListener(() {
      //animationCOntroller also can be used instead of animation
      if (animation.isCompleted) {
        Navigator.push(
          context,
          MyCustomRouteTransition(route: Destination()),
          /*   PageRouteBuilder(
                pageBuilder: (context,animation,secondaryAnimation){
              return Destination();
            },
                transitionsBuilder: (context,animation,secondaryAnimation,child){ //animation tells the progress of transition from previous page
                  Animation<Offset> position = Tween(begin: Offset(-1,-1),end: Offset.zero).animate(animation);
                  return SlideTransition(position: position,child: child,);
                 // return FadeTransition(opacity: animation,child: child,);
          },),*/
        );
        Timer(Duration(seconds: 1), () {
          animationController.reset();
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: GestureDetector(
          onTap: () {
            animationController.forward();
          },
          child: ScaleTransition(
            scale: animation,
            child: Container(
              width: 100,
              height: 100,
              decoration: const BoxDecoration(
                color: Colors.blue,
                shape: BoxShape.circle,
              ),
              child: Container(
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.blue,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class Destination extends StatelessWidget {
  const Destination({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      appBar: AppBar(
        title: const Text('Go Back'),
      ),
      body: Center(
        child: Text("Hello"),
      ),
    );
  }
}

class MyCustomRouteTransition extends PageRouteBuilder {
  final Widget route;
  MyCustomRouteTransition({required this.route})
      : super(
          pageBuilder: (context, animation, secondaryAnimation) {
            return route;
          },
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            //animation tells the progress of transition from previous page
            Animation<Offset> position =
                Tween(begin: Offset(-1, -1), end: Offset.zero)
                    .animate(animation);
            return SlideTransition(
              position: position,
              child: child,
            );
            // return FadeTransition(opacity: animation,child: child,);
          },
        );
}
