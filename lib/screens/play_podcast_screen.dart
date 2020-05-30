import 'package:flutter/material.dart';

import '../constants/assets.dart';
import '../constants/colors.dart';
import '../widgets/rounded_path_clipper.dart';

class PlayPodcastScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screen = MediaQuery.of(context).size;
    final textTheme = Theme.of(context).textTheme;
    final singer = ModalRoute.of(context).settings.arguments as Map;
    final songs = Assets.songs;

    return Scaffold(
      body: SizedBox(
        width: screen.width,
        height: screen.height,
        child: Stack(
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                ClipPath(
                  clipper: RoundedPathClipper(),
                  child: Hero(
                    tag: singer['name'],
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
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.only(bottom: 60.0),
                    child: ListView.builder(
                      physics: BouncingScrollPhysics(),
                      itemCount: songs.length,
                      itemBuilder: (context, index) {
                        return Container(
                          width: screen.width,
                          child: ListTile(
                            title: Text(
                              songs[index],
                              style: textTheme.bodyText1.copyWith(
                                fontSize: 18.0,
                                color: index == 3
                                    ? Colors.yellow
                                    : MyColors.fontColor,
                              ),
                            ),
                            trailing: SizedBox(
                              width: screen.width * 0.3,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: <Widget>[
                                  Text(
                                    '30:45',
                                    style: textTheme.button.copyWith(
                                      color: index == 3
                                          ? Colors.yellow
                                          : MyColors.fontColor,
                                    ),
                                  ),
                                  Icon(
                                    index == 3
                                        ? Icons.music_note
                                        : Icons.play_arrow,
                                    color: index == 3
                                        ? Colors.yellow
                                        : Colors.white,
                                    size: 30.0,
                                  ),
                                ],
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
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                width: screen.width,
                height: 60,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Colors.blue[400],
                      Colors.yellow[700],
                      Colors.orange[400],
                    ],
                    stops: [
                      0.15,
                      0.3,
                      0.7,
                    ],
                  ),
                ),
                child: ListTile(
                  leading: Icon(
                    Icons.arrow_drop_up,
                    size: 60,
                    color: Colors.white,
                  ),
                  title: Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: 'Break My Heart\n',
                        ),
                        TextSpan(
                          text: 'Cristian Olson',
                          style: textTheme.bodyText1.copyWith(fontSize: 15.0),
                        ),
                      ],
                    ),
                    style: textTheme.bodyText1.copyWith(fontSize: 18.0),
                  ),
                  trailing: Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.transparent,
                      border: Border.all(width: 3, color: Colors.orange[300]),
                    ),
                    child: Icon(
                      Icons.pause,
                      color: Colors.white,
                      size: 30,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
