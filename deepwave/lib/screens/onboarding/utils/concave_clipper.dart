import 'dart:ui';

import 'package:flutter/material.dart';

class ConcaveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();

    // Start from the bottom left
    path.lineTo(0, size.height);

    // Draw a straight line to the bottom right
    path.lineTo(size.width, size.height);

    // Draw a line to the top right
    path.lineTo(size.width, 0);

    // Create the concave effect at the top to curve inwards
    var firstControlPoint = Offset(size.width * .5, size.height * .75);
    var firstEndPoint = Offset(size.width * .25, size.height * .75 - 50);
    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
        firstEndPoint.dx, firstEndPoint.dy);

    // Close the path (back to starting point)
    path.close();

    return path;
  }

  @override
  bool shouldReclip(ConcaveClipper oldClipper) => false;
}
