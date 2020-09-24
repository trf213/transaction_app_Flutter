import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class StepCounterCard extends StatefulWidget {
  StepCounterCard({Key key}) : super(key: key);


  @override
  _StepCounterCardState createState() => _StepCounterCardState();
}

class _StepCounterCardState extends State<StepCounterCard> {
  
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10.0),
      width: double.infinity,
      child: Card(
        elevation: 5,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical:20 , horizontal:20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
            
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('Step Counter', style: Theme.of(context).textTheme.headline6,),
            ),
            Padding(
              padding: const EdgeInsets.all(2.0),
              child:  CircularPercentIndicator(
                center: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Icon(FontAwesomeIcons.walking, color: Colors.lightGreenAccent[400],),
                        ),
                        Text('Steps\n10000', textAlign: TextAlign.center,style: TextStyle(color: Colors.lightGreenAccent[400], fontWeight: FontWeight.bold, fontSize: 20),),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Icon(FontAwesomeIcons.fire, color: Colors.amber[800],),
                          ),
                          Text('99999\nKcal', textAlign: TextAlign.center, style: TextStyle(color: Colors.amber[800], fontWeight: FontWeight.bold, fontSize: 20),),
                        ],
                      ),
                    ),
                    
                  ],
                ),
                radius: 250,
                lineWidth: 15,
                percent: 0.8,
                circularStrokeCap: CircularStrokeCap.round,
                progressColor: Colors.lightGreenAccent[400],
                backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                
              ),
            ),
           
          ],
          ),
        ),
      ),
    );
  }
}