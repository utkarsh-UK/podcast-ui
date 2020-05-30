import 'dart:math';

import 'package:flutter/material.dart';
import 'package:animations/animations.dart';
import 'package:podcast/constants/colors.dart';

import '../constants/assets.dart';
import '../screens/podcast_details_screen.dart';

class PodcastList extends StatelessWidget {
  final singersList = Assets.singers;
  final podcastList = Assets.podcastList;
  final Random random = Random();

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return ListView(
      physics: BouncingScrollPhysics(),
      children: podcastList.map((podcast) {
        int randomIndex = random.nextInt(6 - 0) + 0;

        return OpenContainer(
          closedColor: MyColors.bgColor,
          closedBuilder: (context, action) => ListTile(
            /* onTap: () => Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => PodcastDetailsScreen(),
              ),
            ), */
            title: Text(
              podcast['name'],
              style: textTheme.headline6,
            ),
            subtitle: Text(
              '${podcast['followers']} followers',
              style: textTheme.subtitle1,
            ),
            trailing: Container(
              width: 45,
              height: 45,
              margin: const EdgeInsets.only(right: 8.0),
              decoration: BoxDecoration(
                color: singersList[randomIndex]['color'],
                borderRadius: BorderRadius.circular(12.0),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12.0),
                child: Image.asset(
                  singersList[randomIndex]['image'],
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ),
          openBuilder: (context, action) => PodcastDetailsScreen(),
          transitionDuration: const Duration(milliseconds: 400),
        );
      }).toList(),
    );
  }
}
