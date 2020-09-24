import 'package:digital_wallet/Pages/Mainpage.dart';
import 'Utilities/BMIData.dart';
import 'package:flutter/material.dart';
import 'Pages/Mainpage.dart';
import 'package:digital_wallet/Utilities/constants.dart';
import 'package:provider/provider.dart';
void main(){
  runApp(MainApp());
}
class MainApp extends StatelessWidget {
  
  Widget build(BuildContext context) {
    return  MultiProvider(
          providers: [
            ChangeNotifierProvider.value(value: Age()),
            ChangeNotifierProvider.value(value: Height()),
            ChangeNotifierProvider.value(value: Weight()),
            
          ],
          child: MaterialApp(
          theme: darkTheme,
          initialRoute: MainPage.id,
          routes:{
            MainPage.id: (context) => MainPage(),
            

          }
      ),
    );
  }
}
