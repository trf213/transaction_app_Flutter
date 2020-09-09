import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final darkTheme = ThemeData(
  
  brightness: Brightness.dark,
  primaryColor: Color(0xFFF44336),
  primaryColorDark: Color(0xFFD32F2F),
  primaryColorLight: Color(0xFFFFCDD2),
  accentColor: Color(0xFFFF5722),
  textTheme: kdarktextthemeData,
  appBarTheme: AppBarTheme(
    color: Colors.black12,
    elevation: 5,
    brightness: Brightness.dark,
    centerTitle: true
  ),
  bottomAppBarTheme: BottomAppBarTheme(
    color: Colors.black12,
    elevation: 5,
  ) ,
  cardTheme: CardTheme(shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(10)
  ))
);

  final kdarktextthemeData = new TextTheme(
  headline1: GoogleFonts.sourceSansPro(
      color:Colors.white,
      fontSize: 105,
      fontWeight: FontWeight.w300,
      letterSpacing: -1.5  ),
  headline2: GoogleFonts.sourceSansPro(
      color:Colors.white,
      fontSize: 66,
      fontWeight: FontWeight.w300,
      letterSpacing: -0.5  ),
  headline3: GoogleFonts.sourceSansPro(
      color:Colors.white,
      fontSize: 52,
      fontWeight: FontWeight.w400  ),
  headline4: GoogleFonts.sourceSansPro(
      color: Colors.white,
      fontSize: 37,
      fontWeight: FontWeight.w400,
      letterSpacing: 0.25  ),
  headline5: GoogleFonts.sourceSansPro(
      color:Colors.white,
      fontSize: 26,
      fontWeight: FontWeight.bold   ),
  headline6: GoogleFonts.sourceSansPro(
      color: Colors.white,
      fontSize: 22,
      fontWeight: FontWeight.bold,
      letterSpacing: 0.15  ),
  subtitle1: GoogleFonts.sourceSansPro(
      color: Colors.white,
      fontSize: 17,
      fontWeight: FontWeight.bold,
      letterSpacing: 0.15  ),
  subtitle2: GoogleFonts.sourceSansPro(    color: Colors.white, fontSize: 15,    fontWeight: FontWeight.w500,    letterSpacing: 0.1  ),
  bodyText2: GoogleFonts.sourceSansPro(    color: Colors.white, fontSize: 17,    fontWeight: FontWeight.w400,    letterSpacing: 0.5  ),
  bodyText1: GoogleFonts.sourceSansPro(     color: Colors.white,   fontSize: 15,    fontWeight: FontWeight.w400,    letterSpacing: 0.25  ),
  button: GoogleFonts.sourceSansPro(  color: Colors.white,  fontSize: 18,    fontWeight: FontWeight.bold,    letterSpacing: 1.25  ),
  caption: GoogleFonts.sourceSansPro(  color: Colors.white,  fontSize: 13,    fontWeight: FontWeight.w400,    letterSpacing: 0.4  ),
  overline: GoogleFonts.sourceSansPro(  color: Colors.white,  fontSize: 11,    fontWeight: FontWeight.w400,    letterSpacing: 1.5  ),);

