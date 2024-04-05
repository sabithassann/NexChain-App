

import 'package:flutter/material.dart';
import 'package:nexchain/widgets/radial_expansion.dart';

class RadialScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Radial Hero Animation Demo'),
      ),
      body: Center(
        child: GestureDetector(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => DetailScreen()));
          },
          child: Hero(
            tag: 'heroTag',
            child: RadialHeroAnimation(
              radius: 100.0,
              alignment: Alignment.center,
              animation: AlwaysStoppedAnimation(1.0),
              child: CircleAvatar(
                backgroundImage: AssetImage('images/flippers-alpha.png'),
                radius: 100.0,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class DetailScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail Screen'),
      ),
      body: Center(
        child: Hero(
          tag: 'heroTag',
          child: RadialHeroAnimation(
            radius: 300.0,
            alignment: Alignment.center,
            animation: AlwaysStoppedAnimation(1.0),
            child: CircleAvatar(
              backgroundImage: AssetImage('images/flippers-alpha.png'),
              radius: 300.0,
            ),
          ),
        ),
      ),
    );
  }
}