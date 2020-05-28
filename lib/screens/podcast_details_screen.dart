import 'package:flutter/material.dart';

import '../widgets/custom_background.dart';
import '../widgets/podcast_list.dart';
import '../widgets/rounded_path_clipper.dart';

class PodcastDetailsScreen extends StatelessWidget {
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
              painter: CustomBackground(orangeToBottom: true),
              child: Container(
                width: screen.width,
                height: screen.height * 0.55,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
