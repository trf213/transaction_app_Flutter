import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
final kdarkTheme = ThemeData(
  
  brightness: Brightness.dark,
  primaryColor:  Color(0xFFF44336),
  primaryColorDark:  Color(0xFFD32F2F),
  primaryColorLight: Color(0xFFFFCDD2),
  accentColor: Color(0xFFFF5722),
  textTheme: kdarktextthemeData,
  iconTheme: IconThemeData(color: Colors.white),
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

final klightTheme = ThemeData(
  scaffoldBackgroundColor: Colors.grey[200],
  brightness: Brightness.light,
  primaryColor: Color(0xFFF44336),
  primaryColorDark: Color(0xFFD32F2F),
  primaryColorLight: Color(0xFFFFCDD2),
  accentColor: Color(0xFFFF5722),
  textTheme: klighttextthemeData,
  iconTheme: IconThemeData(color: Colors.black),
  appBarTheme: AppBarTheme(
   
    elevation: 5,
    brightness: Brightness.light,
    centerTitle: true
  ),
  bottomAppBarTheme: BottomAppBarTheme(
    
    elevation: 5,
  ) ,
  cardTheme: CardTheme(shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(10)
  ))
);

  final klighttextthemeData = new TextTheme(
  headline1: GoogleFonts.roboto(
      color:Colors.black,
      fontSize: 105,
      fontWeight: FontWeight.bold,
      letterSpacing: -1.5  ),
  headline2: GoogleFonts.roboto(
      color:Colors.black,
      fontSize: 66,
      fontWeight: FontWeight.bold,
      letterSpacing: -0.5  ),
  headline3: GoogleFonts.roboto(
      color:Colors.black,
      fontSize: 52,
      fontWeight: FontWeight.bold ),
  headline4: GoogleFonts.roboto(
      color: Colors.black,
      fontSize: 37,
      fontWeight: FontWeight.bold,
      letterSpacing: 0.25  ),
  headline5: GoogleFonts.roboto(
      color:Colors.black,
      fontSize: 26,
      fontWeight: FontWeight.bold   ),
  headline6: GoogleFonts.roboto(
      color: Colors.black,
      fontSize: 22,
      fontWeight: FontWeight.bold,
      letterSpacing: 0.15  ),
  subtitle1: GoogleFonts.roboto(
      color: Colors.black,
      fontSize: 17,
      fontWeight: FontWeight.bold,
      letterSpacing: 0.15  ),
  subtitle2: GoogleFonts.roboto(    color: Colors.black, fontSize: 15,    fontWeight: FontWeight.w500,    letterSpacing: 0.1  ),
  bodyText2: GoogleFonts.roboto(    color: Colors.black, fontSize: 17,    fontWeight: FontWeight.w400,    letterSpacing: 0.5  ),
  bodyText1: GoogleFonts.roboto(     color: Colors.black,   fontSize: 15,    fontWeight: FontWeight.w400,    letterSpacing: 0.25  ),
  button: GoogleFonts.roboto(  color: Colors.black,  fontSize: 18,    fontWeight: FontWeight.bold,    letterSpacing: 1.25  ),
  caption: GoogleFonts.roboto(  color: Colors.black,  fontSize: 13,    fontWeight: FontWeight.w400,    letterSpacing: 0.4  ),
  overline: GoogleFonts.roboto(  color: Colors.black,  fontSize: 11,    fontWeight: FontWeight.w400,    letterSpacing: 1.5  ),);

  final kdarktextthemeData = new TextTheme(
  headline1: GoogleFonts.roboto(
      color:Colors.white,
      fontSize: 105,
      fontWeight: FontWeight.bold,
      letterSpacing: -1.5  ),
  headline2: GoogleFonts.roboto(
      color:Colors.white,
      fontSize: 66,
      fontWeight: FontWeight.bold,
      letterSpacing: -0.5  ),
  headline3: GoogleFonts.roboto(
      color:Colors.white,
      fontSize: 52,
      fontWeight: FontWeight.bold ),
  headline4: GoogleFonts.roboto(
      color: Colors.white,
      fontSize: 37,
      fontWeight: FontWeight.bold,
      letterSpacing: 0.25  ),
  headline5: GoogleFonts.roboto(
      color:Colors.white,
      fontSize: 26,
      fontWeight: FontWeight.bold   ),
  headline6: GoogleFonts.roboto(
      color: Colors.white,
      fontSize: 22,
      fontWeight: FontWeight.bold,
      letterSpacing: 0.15  ),
  subtitle1: GoogleFonts.roboto(
      color: Colors.white,
      fontSize: 17,
      fontWeight: FontWeight.bold,
      letterSpacing: 0.15  ),
  subtitle2: GoogleFonts.roboto(    color: Colors.white, fontSize: 15,    fontWeight: FontWeight.w500,    letterSpacing: 0.1  ),
  bodyText2: GoogleFonts.roboto(    color: Colors.white, fontSize: 17,    fontWeight: FontWeight.w400,    letterSpacing: 0.5  ),
  bodyText1: GoogleFonts.roboto(     color: Colors.white,   fontSize: 15,    fontWeight: FontWeight.w400,    letterSpacing: 0.25  ),
  button: GoogleFonts.roboto(  color: Colors.white,  fontSize: 18,    fontWeight: FontWeight.bold,    letterSpacing: 1.25  ),
  caption: GoogleFonts.roboto(  color: Colors.white,  fontSize: 13,    fontWeight: FontWeight.w400,    letterSpacing: 0.4  ),
  overline: GoogleFonts.roboto(  color: Colors.white,  fontSize: 11,    fontWeight: FontWeight.w400,    letterSpacing: 1.5  ),);

  final List<String> categories = [
    'Income',
    'Misc.',
    'Expense',
    'Education',
    'Shopping',
    'Personal Care',
    'Health & Fitness',
    'Kids',
    'Food & Dining',
    'Gifts & Donations',
    'Investments',
 	  'Bills & Utilities',
 	  'Auto & Transport',
 	  'Travel',
    'Fees & Charges',
 	  'Business Services',
    'Taxes',
  ];

  final Map<String, dynamic> categoriesMap = {
    'Income':{
      'icon': FontAwesomeIcons.moneyCheckAlt,
      'color': Colors.green
    },
    'Misc.':{
      'icon': FontAwesomeIcons.userAlt,
      'color': Colors.blueGrey
    },
    'Expense':{
      'icon': FontAwesomeIcons.receipt,
      'color': Colors.redAccent
    },
    'Education':{
      'icon': FontAwesomeIcons.graduationCap,
      'color': Colors.blue
    },
    'Shopping':{
      'icon': FontAwesomeIcons.shoppingBag,
      'color': Colors.blue[800]
    },
    'Personal Care':{
      'icon': FontAwesomeIcons.walking,
      'color': Colors.deepPurple
    },
    'Health & Fitness':{
      'icon': FontAwesomeIcons.medkit,
      'color': Colors.purpleAccent[700]
    },
    'Kids':{
      'icon': FontAwesomeIcons.baby,
      'color': Colors.pink
    },
    'Food & Dining':{
      'icon': FontAwesomeIcons.utensils,
      'color': Colors.greenAccent[700]
    },
    'Gifts & Donations':{
      'icon': FontAwesomeIcons.gift,
      'color': Colors.deepOrange
    },
    'Investments':{
      'icon': FontAwesomeIcons.funnelDollar,
      'color': Colors.greenAccent
    },
 	  'Bills & Utilities':{
      'icon': FontAwesomeIcons.shower,
      'color': Colors.cyan
    },
 	  'Auto & Transport':{
      'icon': FontAwesomeIcons.car,
      'color': Colors.orange
    },
 	  'Travel':{
      'icon': FontAwesomeIcons.taxi,
      'color': Colors.yellow
    },
    'Fees & Charges':{
      'icon': FontAwesomeIcons.moneyCheckAlt,
      'color': Colors.redAccent[700]
    },
 	  'Business Services':{
      'icon': FontAwesomeIcons.businessTime,
      'color': Colors.red[900]
    },
    'Taxes':{
      'icon': FontAwesomeIcons.handHoldingUsd,
      'color': Colors.red
    },
  };

  List months = ['January','February','March','April','May','June','July','August','September','October','November','December'];