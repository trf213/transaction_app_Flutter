import 'package:digital_wallet/Pages/Mainpage.dart';
import 'package:digital_wallet/Pages/SetupPage.dart';
import 'package:digital_wallet/Services/NotesProvider.dart';
import 'package:digital_wallet/Utilities/PersistantData.dart';
import 'Utilities/BMIData.dart';
import 'package:flutter/material.dart';
import 'Pages/Mainpage.dart';
import 'package:digital_wallet/Utilities/constants.dart';
import 'package:provider/provider.dart';
import 'package:digital_wallet/Services/db.dart';
import 'package:splashscreen/splashscreen.dart';
import 'Services/TransactionProvider.dart';

import 'Services/UserProvider.dart';
void main(){
 
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider.value(value: PersistantThemeData()),
  ], child:MainApp()));
}
class MainApp extends StatelessWidget {
  
  Widget build(BuildContext context) {
    var theme = Provider.of<PersistantThemeData>(context);
    return  MultiProvider(
          providers: [
            ChangeNotifierProvider.value(value: Age()),
            ChangeNotifierProvider.value(value: Height()),
            ChangeNotifierProvider.value(value: Weight()),
            ChangeNotifierProvider.value(value: Bmi()),
            ChangeNotifierProvider.value(value: TransactionProvider()),
            ChangeNotifierProvider.value(value: NotesProvider()),
            ChangeNotifierProvider.value(value: UserProvider()),

   
          ],
          child: MaterialApp(
          theme: theme.getTheme,
          debugShowCheckedModeBanner: false,
          initialRoute: SplashPage.id,
          routes:{
            MainPage.id: (context) => MainPage(),
            SplashPage.id:(context) => SplashPage(),
            SetUpPage.id:(context)=> SetUpPage(),


          }
      ),
    );
  }
}

class SplashPage extends StatelessWidget {
  static String id = '/SplashPage';
  const SplashPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var user = Provider.of<UserProvider>(context);
    user.fetchUser();
    return SplashScreen(
      seconds: 3,
      navigateAfterSeconds: ( user.user != null)?new MainPage():SetUpPage(),
      loadingText: Text('LifeTracker by TAPPS'),
      image: new Image.asset('assets/logo.png'),
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      styleTextUnderTheLoader: new TextStyle(),
      photoSize: 100.0,
      loaderColor: Theme.of(context).accentColor

    );
  }
}
