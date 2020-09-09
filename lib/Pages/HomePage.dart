import 'package:flutter/material.dart';
import 'package:digital_wallet/widgets/HabitCard.dart';
import 'package:digital_wallet/widgets/CalenderCard.dart';
class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
          child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
               
                Padding(
                  padding: const EdgeInsets.symmetric(vertical:20, horizontal: 10),
                  child: Text('Welcome Back!! Tabari', 
                              style: Theme.of(context).textTheme.headline6,
                              textAlign: TextAlign.justify,
                              ),
                ),
                 CalenderCard(),
                   Padding(
               padding: const EdgeInsets.symmetric(vertical:10, horizontal:10),
               child: Text('Your Habits', style: Theme.of(context).textTheme.headline6,),
             ),
                SizedBox(
                  height: 300,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemCount: 10,
                    itemBuilder: (context, index)=>HabitCard()
                    ),
                ),
                
                SizedBox(height: 50,)
          ],),
        )
      ),
    );
  }
}