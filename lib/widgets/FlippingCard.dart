import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/widgets/CardContent.dart';

class Flippingcard extends StatefulWidget {
  const Flippingcard({super.key});

  @override
  State<Flippingcard> createState() => _FlippingcardState();
}

class _FlippingcardState extends State<Flippingcard>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation _rotationAnimation;

  // index 0 contains ans at intial state

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 500));
    _rotationAnimation = Tween(begin: 0.0, end: pi).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: _rotationAnimation,
        builder: (context, child) {
          return Transform(
            transform: Matrix4.rotationY(_rotationAnimation.value),
            alignment: Alignment.center,
            child: GestureDetector(
              onTap: () {
                _controller.forward();
                if (_rotationAnimation.isCompleted) _controller.toggle();
              },
              child: Stack(
                children: [
                  // Back Face
                  Transform.flip(
                    flipX: _rotationAnimation.value > pi / 2,
                    child: Container(
                      color: Colors.red,
                      height: _rotationAnimation.value < pi / 2 ? 0 : 300,
                      width: 250,
                      child: Text('back'),
                    ),
                  ),
                  // Front Face
                  Container(
                    color: const Color.fromARGB(255, 33, 149, 243),
                    height: _rotationAnimation.value > pi / 2 ? 0 : 300,
                    width: 250,
                    child: Text('front ${_rotationAnimation.value}'),
                  )
                ],
              ),
            ),
          );
        });
  }
}
