import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
class HabitCard extends StatelessWidget {
  const HabitCard({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Container(
          
          
          child: Padding(
            padding: const EdgeInsets.all(30.0),
            child: Column(
             
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
              CircularPercentIndicator(
                radius: 100,
                lineWidth: 10,
                percent: 0.8,
                circularStrokeCap: CircularStrokeCap.round,
                progressColor: Theme.of(context).accentColor,
                backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                
              ),
              
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text('Hate', style: Theme.of(context).textTheme.subtitle1,),
              )
            ],),
          )
          ),
        ),
    );
  }
}