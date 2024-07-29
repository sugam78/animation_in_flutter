import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class StaggredAnimation extends StatelessWidget {

  const StaggredAnimation({super.key,});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Column(
        children: [
          SlidingContainer(color: Colors.purpleAccent, beginInterval: 0, endInterval: 0.5, offsetX: 1),
          SlidingContainer(color: Colors.yellow, beginInterval: 0.5, endInterval: 1, offsetX: -1),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.arrow_back
        ),
        onPressed: (){
          Navigator.of(context).pop();
        },
      ),
    );
  }
}

class SlidingContainer extends StatelessWidget {
  final double offsetX;
  final double beginInterval;
  final double endInterval;
  final Color color;
  const SlidingContainer({super.key,required this.color,required this.beginInterval,required this.endInterval,required this.offsetX});

  @override
  Widget build(BuildContext context) {
    final Animation<double> animation = Provider.of<Animation<double>>(context,listen: false);
    return Expanded(child: AnimatedBuilder(
      animation: animation,
      builder: (context,child){
        return SlideTransition(
          position: Tween<Offset>(begin: Offset(offsetX,0),end: Offset(0, 0))
              .animate(CurvedAnimation(parent: animation, curve: Interval(beginInterval,endInterval))),
          child: child,

        );
      },
      child: Container(
        color: color,
      ),
    ));
  }
}

