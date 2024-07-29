import 'package:flutter/material.dart';

class PulsatingCircleAnimation extends StatefulWidget {
  const PulsatingCircleAnimation({super.key});

  @override
  State<PulsatingCircleAnimation> createState() => _PulsatingCircleAnimationState();
}

class _PulsatingCircleAnimationState extends State<PulsatingCircleAnimation> {
  Tween<double> tween = Tween(begin: 20,end: 200);

  final double size = 200;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pulsating Circle Animation'),
      ),
      body: Center(
        child: TweenAnimationBuilder(
          tween: tween,
          duration: Duration(seconds: 2),
          builder: (context,val,widget){
            return Container(
              width: val,
              height: val,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.blue,
                boxShadow: [
                  BoxShadow(
                    color: Colors.blue.withOpacity(0.5),
                    blurRadius: val,
                    spreadRadius: val / 2,
                  ),
                ],
              ),
              child: widget,
            );
          },
          child: Center(child: Text('It doesnt need size')),
        ),
      ),
    );
  }
}