import 'package:flutter/material.dart';

class BouncingBallAnimation extends StatefulWidget {
  const BouncingBallAnimation({super.key});

  @override
  State<BouncingBallAnimation> createState() => _BouncingBallAnimationState();
}

class _BouncingBallAnimationState extends State<BouncingBallAnimation> with SingleTickerProviderStateMixin {
  late final AnimationController animationController;
  late final Animation<double> animation;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(vsync: this,duration: Duration(seconds: 1));
    animation = Tween<double>(begin: 0,end: 1).animate(animationController);
    animation.addStatusListener((status){
      if(status == AnimationStatus.completed){
        animationController.reverse();
      }
      else if(animation.isDismissed){
        animationController.forward();
      }
    });
    animationController.forward();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            AnimatedBuilder(
              animation: animation,
              builder: (context,child) {
                return CustomPaint(
                  size: Size(200, 200),
                painter: BouncingBallPainter(animation.value),
                        );
              }
            ),
          ],
        ),
      ),
    );
  }
}

class BouncingBallPainter extends CustomPainter{
  final double animationValue;

  BouncingBallPainter(this.animationValue);
  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawCircle(Offset(size.width /2, -size.height+ size.height *animationValue), 20, Paint()..color = Colors.blue);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
  
}