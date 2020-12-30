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
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical:30),
              child: Text("Coming Soon", style: Theme.of(context).textTheme.headline5,),
            )
            
          ],
          ),
        ),
      ),
    );
  }
}