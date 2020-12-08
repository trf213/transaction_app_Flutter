import 'package:digital_wallet/Utilities/BMIData.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:holding_gesture/holding_gesture.dart';

class WeightCard extends StatelessWidget {
   


  @override
  Widget build(BuildContext context) {
    var _weight = Provider.of<Weight>(context);
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Card(
        shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
        elevation: 5,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical:20 , horizontal:20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
            
            Padding(
              padding: const EdgeInsets.all(2.0),
              child: Text('Weight', style: Theme.of(context).textTheme.subtitle1,),
            ),
            Padding(
              padding: const EdgeInsets.all(2.0),
              child:  RichText(text: 
                      TextSpan(children: [
                        TextSpan(text: (_weight.currentWeight < 10)?'0${_weight.currentWeight}' ?? '00': _weight.currentWeight.toString() ?? '00', style: Theme.of(context).textTheme.headline2,),
                        TextSpan(text:'kg', style: Theme.of(context).textTheme.bodyText1,),
                        
                      ]
                      )
                      ),
            ),
            Padding(
              padding: const EdgeInsets.all(2.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Flexible(
                    fit: FlexFit.loose,
                    child: HoldDetector(
                    onHold: _weight.incrementWeightByTen,
                    enableHapticFeedback: true,
                    child:MaterialButton(
                      elevation: 2,
                      focusElevation: 0,
                       highlightElevation: 0,
                      color: Theme.of(context).primaryColor,
                      padding: EdgeInsets.all(10),
                      shape: CircleBorder(),
                      child: Icon(Icons.add, size: 20, color: Colors.white,),
                      onPressed: _weight.incrementWeight
                      ),)
                  ),
                  Flexible(
                    fit: FlexFit.loose,
                    child: HoldDetector(
                      onHold: _weight.decrementWeightByTen,
                      enableHapticFeedback: true,
                        child: MaterialButton(
                        elevation: 2,
                        focusElevation: 0,
                        highlightElevation: 0,
                        color: Theme.of(context).primaryColor,
                        padding: EdgeInsets.all(10),
                        shape: CircleBorder(),
                        child: Icon(Icons.remove, size: 20, color: Colors.white,),
                        onPressed: _weight.decrementWeight
                        
                        ),
                    ),
                  ),
                ],),
            )
          ],),
        ),
      ),
    );
  }
}