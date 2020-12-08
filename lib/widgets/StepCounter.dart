import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:provider/provider.dart';
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
        shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)) ,
        elevation: 5,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical:20 , horizontal:20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
            
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('Step Counter', style: Theme.of(context).textTheme.headline6,),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child:  CircularPercentIndicator(
                center: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal:20),
                          child: Icon(FontAwesomeIcons.walking, color: Colors.blueAccent,),
                        ),
                        Text('Steps\n0', textAlign: TextAlign.center,style: TextStyle(color: Colors.blueAccent, fontWeight: FontWeight.bold, fontSize: 20),),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal:20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Icon(FontAwesomeIcons.fire, color: Colors.amber[800],),
                          ),
                          Text('99999\nKcal', textAlign: TextAlign.center, style: TextStyle(color: Colors.amber[800], fontWeight: FontWeight.bold, fontSize: 20),),
                        ],
                      ),
                    ),
                    
                  ],
                ),
                radius: 250,
                lineWidth: 10,
                percent: 0.8,
                circularStrokeCap: CircularStrokeCap.round,
                progressColor: Colors.blueAccent,
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