import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import './constants/colors.dart';
import './screens/home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Podcast',
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
      theme: ThemeData(
        scaffoldBackgroundColor: MyColors.bgColor,
        primarySwatch: Colors.purple,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        textTheme: TextTheme(
          headline4: GoogleFonts.kanit(
            fontSize: 34.0,
            color: MyColors.fontColor,
            fontWeight: FontWeight.w800,
          ),
          headline6: GoogleFonts.kanit(
            fontSize: 20.0,
            color: MyColors.fontColor,
            fontWeight: FontWeight.w500,
            letterSpacing: 0.9,
          ),
        ),
      ),
    );
  }
}
