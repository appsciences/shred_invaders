import 'dart:ui';

import 'package:flutter/material.dart';

class SpaceInvaders extends StatefulWidget {
  @override
  _SpaceInvadersState createState() => _SpaceInvadersState();
}

class _SpaceInvadersState extends State<SpaceInvaders> {
  // Create a list of aliens and their positions on the screen
  List<Rect> aliens = [];

  // Add the laser cannon to the bottom of the screen
  Rect laserCannon = Rect.fromLTWH(0, 0, 50, 50);

  @override
  void initState() {
    // Initialize the positions of the aliens
    for (int i = 0; i < 10; i++) {
      for (int j = 0; j < 5; j++) {
        aliens.add(Rect.fromLTWH(i * 50.0, j * 50.0, 50, 50));
      }
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.black,
        child: Stack(
          children: <Widget>[
            // Draw the aliens on the screen
            CustomPaint(
              painter: AlienPainter(aliens),
            ),
            // Draw the laser cannon on the screen
            Positioned(
              bottom: 0,
              child: Container(
                width: laserCannon.width,
                height: laserCannon.height,
                color: Colors.red,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class AlienPainter extends CustomPainter {
  final List<Rect> aliens;

  AlienPainter(this.aliens);

  @override
  void paint(Canvas canvas, Size size) {
    for (Rect alien in aliens) {
      canvas.drawRect(alien, Paint()..color = Colors.green);
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
