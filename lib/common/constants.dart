import 'package:flutter/material.dart';

const String baseImageUrl = 'https://image.tmdb.org/t/p/w500';

// colors
const Color kRichBlack = Color(0xFF000814);
const Color kOxfordBlue = Color(0xFF001D3D);
const Color kPrussianBlue = Color(0xFF003566);
const Color kMikadoYellow = Color(0xFFffc300);
const Color kDavysGrey = Color(0xFF4B5358);
const Color kGrey = Color(0xFF303030);

// text style
const TextStyle kHeading5 =
    TextStyle(fontFamily: 'Poppins', fontSize: 23, fontWeight: FontWeight.w400);
const TextStyle kHeading6 = 
    TextStyle(fontFamily: 'Poppins', fontSize: 19, fontWeight: FontWeight.w500, letterSpacing: .15);

const TextStyle kSubtitle = 
    TextStyle(fontFamily: 'Poppins', fontSize: 15, fontWeight: FontWeight.w400, letterSpacing: .15);
const TextStyle kBodyText = 
    TextStyle(fontFamily: 'Poppins', fontSize: 13, fontWeight: FontWeight.w400, letterSpacing: .25);

// text theme
final kTextTheme = TextTheme(
  headline5: kHeading5,
  headline6: kHeading6,
  subtitle1: kSubtitle,
  bodyText2: kBodyText,

  
);

const kColorScheme = ColorScheme(
  primary: kMikadoYellow,
  primaryContainer: kMikadoYellow,
  secondary: kPrussianBlue,
  secondaryContainer: kPrussianBlue,
  surface: kRichBlack,
  background: kRichBlack,
  error: Colors.red,
  onPrimary: kRichBlack,
  onSecondary: Colors.white,
  onSurface: Colors.white,
  onBackground: Colors.white,
  onError: Colors.white,
  brightness: Brightness.dark,
);
