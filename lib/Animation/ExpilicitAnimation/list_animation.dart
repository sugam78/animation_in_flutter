import 'package:flutter/material.dart';

class ListAnimation extends StatefulWidget {
  const ListAnimation({super.key});

  @override
  State<ListAnimation> createState() => _ListAnimationState();
}

class _ListAnimationState extends State<ListAnimation>
    with SingleTickerProviderStateMixin {
  late final AnimationController animationController;
  late List<Animation<Offset>> animations;
  final int itemCount = 5;
  @override
  void initState() {
    super.initState();
    animationController =
        AnimationController(vsync: this, duration: Duration(seconds: 2));
    animations = List.generate(
        itemCount,
        (index) => Tween(begin: Offset(-1, 0), end: Offset.zero)
            .animate(CurvedAnimation(parent: animationController, curve: Interval((index/itemCount), 1,))));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('List Animation'),
      ),
      body: ListView.builder(
        itemCount: 5,
        itemBuilder: (context, index) {
          return SlideTransition(
            position:animations[index],
            child: ListTile(
              title: Text('Hello World. ${index.toString()}'),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if(animationController.isCompleted){
            animationController.reverse();
          }
          else{
            animationController.forward();
          }
        },
        child: const Icon(Icons.done),
      ),
    );
  }
}
