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
               child: Row(
                 mainAxisAlignment: MainAxisAlignment.spaceBetween ,
                 children: [
                   Text('Your Habits', style: Theme.of(context).textTheme.headline6,),
                   FlatButton(onPressed: ()=>print('hi'), child: Text('ADD', style:TextStyle(color: Theme.of(context).accentColor),))
                 ],
               ),
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
                Padding(
               padding: const EdgeInsets.symmetric(vertical:10, horizontal:10),
               child: Row(
                 mainAxisAlignment: MainAxisAlignment.spaceBetween ,
                 children: [
                   Text('Your Goals', style: Theme.of(context).textTheme.headline6,),
                   FlatButton(onPressed: ()=>print('hi'), child: Text('ADD', style:TextStyle(color: Theme.of(context).accentColor),))
                 ],
               ),
             ),
                 Padding(
                   padding: const EdgeInsets.symmetric(vertical:0, horizontal:10),
                   child: ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      itemCount: 10,
                      itemBuilder: (context, index)=>Card(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)), child: ListTile(title: Text('Hi'),),)
                      ),
                 ),
      
                
                SizedBox(height: 50,)
          ],),
        )
      ),
    );
  }
}