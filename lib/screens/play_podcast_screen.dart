import 'package:flutter/material.dart';
import 'package:podcast/widgets/rounded_path_clipper.dart';

class PlayPodcastScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screen = MediaQuery.of(context).size;
    final textTheme = Theme.of(context).textTheme;
    final singer = ModalRoute.of(context).settings.arguments as Map;

    return Scaffold(
      body: SizedBox(
        width: screen.width,
        height: screen.height,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            ClipPath(
              clipper: RoundedPathClipper(),
              child: Container(
                width: screen.width,
                height: screen.height * 0.45,
                color: singer['color'],
                child: Image.asset(
                  singer['image'],
                  fit: BoxFit.contain,
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(left: 12.0),
              child: RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: '11, 504 followers\n',
                    ),
                    TextSpan(
                      text: '${singer['name']}\n',
                      style: textTheme.headline6.copyWith(
                        fontSize: 28.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextSpan(
                      text: 'Playback Singer',
                    ),
                  ],
                  style: textTheme.bodyText1,
                ),
              ),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: Container(
                width: screen.width * 0.4,
                margin: const EdgeInsets.only(right: 12.0),
                height: 45,
                child: RaisedButton(
                  color: Colors.white,
                  onPressed: () {},
                  child: Text('Follow'),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(left: 12.0),
              child: Text(
                'All Episodes',
                style: textTheme.bodyText1,
              ),
            ),
            Container(
              width: 30,
              margin: const EdgeInsets.only(left: 12.0),
              child: Divider(
                color: Colors.white,
                thickness: 1.5,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
