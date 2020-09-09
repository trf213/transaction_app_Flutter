import 'package:digital_wallet/Pages/Mainpage.dart';

import 'package:flutter/material.dart';
import 'Pages/Mainpage.dart';
import 'package:digital_wallet/Utilities/constants.dart';

void main(){
  runApp(MainApp());
}
class MainApp extends StatelessWidget {
  
  Widget build(BuildContext context) {
    return  MaterialApp(
        theme: darkTheme,
        initialRoute: MainPage.id,
        routes:{
          MainPage.id: (context) => MainPage(),
          

        }
    );
  }
}
