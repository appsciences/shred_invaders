import 'package:flutter/material.dart';

class GuitarNeck extends StatelessWidget {
  final int numFrets;

  GuitarNeck({this.numFrets = 21});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: double.infinity,
      child: CustomPaint(
        painter: GuitarNeckPainter(numFrets),
      ),
    );
  }
}

class GuitarNeckPainter extends CustomPainter {
  final int numFrets;

  GuitarNeckPainter(this.numFrets);

  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..color = Colors.black
      ..strokeWidth = 2;

    // Draw the guitar neck
    canvas.drawLine(
      Offset(0, 0),
      Offset(0, size.height),
      paint,
    );

    // Draw the frets
    for (int i = 0; i < numFrets; i++) {
      var fretY = size.height * (i + 1) / (numFrets + 1);
      canvas.drawLine(
        Offset(0, fretY),
        Offset(size.width, fretY),
        paint,
      );
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
