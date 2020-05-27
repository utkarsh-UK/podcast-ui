import 'package:flutter/material.dart';

import '../widgets/custom_background.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screen = MediaQuery.of(context).size;
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      body: Column(
        children: <Widget>[
          ClipPath(
            clipper: RoundedPathClipper(),
            child: CustomPaint(
              painter: CustomBackground(),
              child: Container(
                width: screen.width,
                height: screen.height * 0.45,
                child: Stack(
                  children: <Widget>[
                    Positioned(
                      top: 70,
                      left: 20,
                      child: SizedBox(
                        width: screen.width * 0.7,
                        child: Text(
                          'What you want to hear?',
                          style: textTheme.headline4,
                          softWrap: true,
                        ),
                      ),
                    ),
                    Positioned(
                      top: 190,
                      left: 20,
                      child: Text(
                        'Flagship Collection',
                        style: textTheme.headline6,
                      ),
                    ),
                    Positioned(
                      top: 230,
                      left: 20,
                      child: SizedBox(
                        width: 30,
                        child: Divider(
                          color: Colors.white,
                          thickness: 1.5,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class RoundedPathClipper extends CustomClipper<Path> {
  @override
  getClip(Size size) {
    final width = size.width;
    final height = size.height;

    Path path = Path();
    path.lineTo(0.0, height - 60);
    path.quadraticBezierTo(width * 0.8, height * 0.9, width, height * 0.15);
    path.lineTo(width, 0.0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper oldClipper) => false;
}
