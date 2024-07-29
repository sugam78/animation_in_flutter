
import 'package:animation/Animation/CustomPainter/bouncing_ball.dart';
import 'package:animation/Animation/ExpilicitAnimation/list_animation.dart';
import 'package:animation/Animation/ExpilicitAnimation/loading_animation.dart';
import 'package:animation/Animation/ExpilicitAnimation/login_animation.dart';
import 'package:animation/Animation/PageRouteBuilder/splash_animation.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Animations',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const BouncingBallAnimation(),
    );
  }
}

