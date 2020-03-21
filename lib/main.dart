import 'package:digital_wallet/Homepage.dart';
import 'package:digital_wallet/List.dart';
import 'package:flutter/material.dart';
import 'Homepage.dart';
import 'package:provider/provider.dart';

void main(){
  runApp(MainPage());
}
class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [

      ChangeNotifierProvider(create: (_)=>Prices(),),
    ],
    child:  MaterialApp(
        initialRoute: Homepage.id,
        routes:{
          Homepage.id: (context) => Homepage(),

        }
    ),
    );
  }
}
