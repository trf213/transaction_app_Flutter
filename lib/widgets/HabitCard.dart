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
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Container(
          
          width: 200,
          height: 250,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal:5,vertical: 10),
            child: Column(
            
             mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [

              
              Padding(
                padding: const EdgeInsets.symmetric(vertical:15),
                child: CircularPercentIndicator(
                  radius: 150,
                  lineWidth: 15,
                  percent: 0.8,
                  circularStrokeCap: CircularStrokeCap.round,
                  progressColor: Theme.of(context).accentColor,
                  backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                  center:  Padding(
                  padding: EdgeInsets.all(8),
                  child: Text('90\nDays', style: TextStyle(color: Theme.of(context).accentColor, fontWeight: FontWeight.bold, fontSize: 20), textAlign: TextAlign.center,),
                ),
                ),
              ),
              
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text('Hate', style: Theme.of(context).textTheme.subtitle1,),
              ),
              Spacer(),
             Padding(
               padding: const EdgeInsets.all(8.0),
               child: Row(
                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                 children: [
                   Flexible( fit: FlexFit.loose, child: IconButton(icon: Icon(LineAwesomeIcons.edit, size: 30), onPressed: ()=>print('hi'))),
                   Flexible(
                     fit: FlexFit.loose,
                     child: IconButton(icon: Icon(LineAwesomeIcons.alternate_redo, size: 30), onPressed: ()=>print('hi')),
                   ),
                   Flexible(
                     fit: FlexFit.loose,
                     child: IconButton(icon: Icon(LineAwesomeIcons.vertical_ellipsis, size: 30), onPressed: ()=>print('hi')),
                   ),
                 ],
               ),
             )
              
             ],
            
            ),
          )
          ),
        ),
    );
  }
}