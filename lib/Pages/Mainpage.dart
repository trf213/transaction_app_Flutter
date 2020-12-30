import 'package:digital_wallet/Pages/BudgetPage.dart';
import 'package:digital_wallet/Pages/Homepage.dart';
import 'package:digital_wallet/Pages/FitnessPage.dart';
import 'package:digital_wallet/Pages/ProfilePage.dart';
import 'package:digital_wallet/Pages/Todo.dart';
import 'package:digital_wallet/Services/UserProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'ProfilePage.dart';
import 'package:digital_wallet/Utilities/PersistantData.dart';
class MainPage extends StatefulWidget {
   static String id = "/Homepage";
  MainPage({Key key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {

  int _selectedIndex = 0;
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    
    var theme = Provider.of<PersistantThemeData>(context);
    var user = Provider.of<UserProvider>(context);
    user.fetchUser();

    return Scaffold(
      key: scaffoldKey,

      body: [

        HomePage(),
       // TodoPage(),
        FitnessPage(),
        BudgetPage(),
        Profilepage(),
      ].elementAt(_selectedIndex),


      
     
      bottomNavigationBar: Container(
        
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
        ),
        child: BottomNavigationBar(
          unselectedItemColor: Theme.of(context).iconTheme.color,
          selectedItemColor: Theme.of(context).accentColor,
          currentIndex: _selectedIndex,
          onTap: (value){
            setState(() => _selectedIndex = value);
          },
          type:  BottomNavigationBarType.shifting,
          backgroundColor: Theme.of(context).appBarTheme.color,
        
          elevation: 0,
          items: [
            BottomNavigationBarItem(
              icon:  Icon(FontAwesomeIcons.home,),
              label: 'Home', 
              backgroundColor: Theme.of(context).appBarTheme.color,
              ),
             /*   BottomNavigationBarItem(
              icon:  Icon(FontAwesomeIcons.listOl),
              label: 'Todo', 
              backgroundColor: Theme.of(context).appBarTheme.color,
              ),  */
            BottomNavigationBarItem(
              icon:  Icon(FontAwesomeIcons.dumbbell,),
              label: 'Fitness', 
              backgroundColor: Theme.of(context).appBarTheme.color,
              ),
            BottomNavigationBarItem(
              icon:  Icon(FontAwesomeIcons.moneyBill),
             label: 'Budget',
               backgroundColor: Theme.of(context).appBarTheme.color,
              ),
            BottomNavigationBarItem(
              icon:  Icon(FontAwesomeIcons.userAlt),
              label: 'Profile',
               backgroundColor: Theme.of(context).appBarTheme.color,
              ),
            
            
        ],
        
        ),
      ),
    );
  }
}
