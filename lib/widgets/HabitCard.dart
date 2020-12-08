import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
class HabitCard extends StatelessWidget {
  const HabitCard({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        elevation: 5,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: Container(
          
          width: 200,
          height: 250,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal:5,vertical: 10),
            child: Column(
            
             mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [

              
              Padding(
                padding: const EdgeInsets.symmetric(vertical:15),
                child: CircularPercentIndicator(
                  radius: 150,
                  lineWidth: 10,
                  percent: 1,
                  circularStrokeCap: CircularStrokeCap.round,
                  progressColor:Colors.greenAccent,
                  backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                  center:  Padding(
                  padding: EdgeInsets.all(8),
                  child: Icon(Icons.check, size:50, color: Colors.greenAccent,),//Text('90\nDays', style: TextStyle( fontWeight: FontWeight.bold, fontSize: 20,), textAlign: TextAlign.center,),
                ),
                ),
              ),
              
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text('Hate', style: Theme.of(context).textTheme.subtitle1,),
              ),
           
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  width: double.infinity,
                  child: MaterialButton(
                    
                    color: Theme.of(context).primaryColor,
                    shape: StadiumBorder(),
                    onPressed: ()=>print('Hi'),
                    child: Text('Edit', style: TextStyle(color:Colors.white),),
                  ),
                ),
              ),
             ],
            
            ),
          )
          ),
        ),
    );
  }
}