import 'package:digital_wallet/Pages/BudgetPage.dart';
import 'package:digital_wallet/Pages/Homepage.dart';
import 'package:digital_wallet/Pages/FitnessPage.dart';
import 'package:digital_wallet/Pages/ProfilePage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'ProfilePage.dart';

class MainPage extends StatefulWidget {
   static String id = "/Homepage";
  MainPage({Key key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {

  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    


    return Scaffold(
      

      body: [

        HomePage(),
        FitnessPage(),
        BudgetPage(),
        Profilepage(),
      ].elementAt(_selectedIndex),


      
      
      bottomNavigationBar: BottomNavigationBar(
        
        selectedItemColor: Theme.of(context).accentColor,
        currentIndex: _selectedIndex,
        onTap: (value){
          setState(() => _selectedIndex = value);
        },
        type:  BottomNavigationBarType.shifting,
        backgroundColor: Theme.of(context).appBarTheme.color,
        
        elevation: 1,
        items: [
          BottomNavigationBarItem(
            icon:  Icon(FontAwesomeIcons.home),
            title: Text('Home', style: TextStyle(fontWeight: FontWeight.bold),),
            backgroundColor: Theme.of(context).appBarTheme.color,
            ),
          BottomNavigationBarItem(
            icon:  Icon(FontAwesomeIcons.utensils),
            title: Text('Diet', style: TextStyle(fontWeight: FontWeight.bold),),
            backgroundColor: Theme.of(context).appBarTheme.color,
            ),
          BottomNavigationBarItem(
            icon:  Icon(FontAwesomeIcons.moneyBill),
            title: Text('Budget',style: TextStyle(fontWeight: FontWeight.bold),),
             backgroundColor: Theme.of(context).appBarTheme.color,
            ),
          BottomNavigationBarItem(
            icon:  Icon(FontAwesomeIcons.userAlt),
            title: Text('Profile',style: TextStyle(fontWeight: FontWeight.bold),),
             backgroundColor: Theme.of(context).appBarTheme.color,
            ),
          
          
      ],
      
      ),
    );
  }
}
