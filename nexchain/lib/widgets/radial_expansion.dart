

import 'package:flutter/material.dart';

class RadialHeroAnimation extends StatelessWidget {
  final Widget child;
  final double radius;
  final Alignment alignment;
  final Animation<double> animation;

  RadialHeroAnimation({
    required this.child,
    required this.radius,
    required this.alignment,
    required this.animation,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animation,
      builder: (context, child) {
        return ClipOval(
          clipper: RadialClipper(
            radius: radius * animation.value,
            alignment: alignment,
          ),
          child: child,
        );
      },
      child: child,
    );
  }
}

class RadialClipper extends CustomClipper<Rect> {
  final double radius;
  final Alignment alignment;

  RadialClipper({required this.radius, required this.alignment});

  @override
  Rect getClip(Size size) {
    final center = alignment.inscribe(Size(radius * 2, radius * 2), Offset.zero & size).center;
    return Rect.fromCircle(center: center, radius: radius);
  }

  @override
  bool shouldReclip(CustomClipper<Rect> oldClipper) => true;
}