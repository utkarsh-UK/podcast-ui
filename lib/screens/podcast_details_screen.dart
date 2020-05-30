import 'package:flutter/material.dart';
import 'package:podcast/constants/assets.dart';
import 'package:podcast/screens/play_podcast_screen.dart';

import '../widgets/custom_background.dart';
import '../widgets/rounded_path_clipper.dart';

class PodcastDetailsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screen = MediaQuery.of(context).size;
    final textTheme = Theme.of(context).textTheme;

    final singersList = Assets.singers;

    return Scaffold(
      body: SizedBox(
        width: screen.width,
        height: screen.height,
        child: Stack(
          children: <Widget>[
            ClipPath(
              clipper: RoundedPathClipper(),
              child: CustomPaint(
                painter: CustomBackground(orangeToBottom: true),
                child: Container(
                  width: screen.width,
                  height: screen.height * 0.55,
                  child: Stack(
                    children: <Widget>[
                      Positioned(
                        top: 30,
                        left: 10,
                        child: IconButton(
                          icon: Icon(
                            Icons.arrow_back,
                            size: 30,
                            color: Colors.white,
                          ),
                          onPressed: () => Navigator.of(context).pop(),
                        ),
                      ),
                      Positioned(
                        top: 70,
                        left: 20,
                        child: SizedBox(
                          width: screen.width * 0.7,
                          child: Text(
                            'Famous People',
                            style: textTheme.headline4,
                            softWrap: true,
                          ),
                        ),
                      ),
                      Positioned(
                        top: 120,
                        left: 20,
                        child: SizedBox(
                          width: screen.width * 0.8,
                          child: Text(
                            'We have selected some of our favorite episodes as recommended places to start listening to the show',
                            style: textTheme.headline6.copyWith(
                              fontWeight: FontWeight.normal,
                              fontSize: 18.0,
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 240,
                        left: 20,
                        child: SizedBox(
                          width: 30,
                          child: Divider(
                            color: Colors.white,
                            thickness: 1.5,
                          ),
                        ),
                      ),
                      Positioned(
                        top: 260,
                        left: 20,
                        child: Text(
                          'Trending',
                          style: textTheme.headline6,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              top: 310,
              child: Container(
                height: screen.height * 0.6,
                width: screen.width,
                margin: const EdgeInsets.symmetric(horizontal: 12.0),
                child: GridView.builder(
                  physics: BouncingScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 12.0,
                    mainAxisSpacing: 20.0,
                  ),
                  itemCount: singersList.length,
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  itemBuilder: (ctx, index) {
                    return InkWell(
                      onTap: () => Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => PlayPodcastScreen(),
                          settings:
                              RouteSettings(arguments: singersList[index]),
                        ),
                      ),
                      child: Hero(
                        tag: singersList[index]['name'],
                        child: GridTile(
                          child: Container(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 8.0),
                            decoration: BoxDecoration(
                              color: singersList[index]['color'],
                              borderRadius: BorderRadius.circular(30.0),
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(30.0),
                              child: Image.asset(
                                singersList[index]['image'],
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                          footer: Container(
                            alignment: Alignment.center,
                            padding: const EdgeInsets.symmetric(
                              horizontal: 12.0,
                              vertical: 6.0,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.white24,
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(30),
                                bottomRight: Radius.circular(30),
                              ),
                            ),
                            child: FittedBox(
                              child: Text(
                                singersList[index]['name'],
                                style: textTheme.headline6
                                    .copyWith(fontSize: 18.0),
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
