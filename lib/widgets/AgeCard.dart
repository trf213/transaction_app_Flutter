import 'package:digital_wallet/Utilities/BMIData.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class AgeCard extends StatelessWidget {
 
  AgeCard({Key key}) : super(key: key);

 
  
  @override
  Widget build(BuildContext context) {
    var _age = Provider.of<Age>(context);
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Card(
        elevation: 5,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical:20 , horizontal:20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
            
            Padding(
              padding: const EdgeInsets.all(2.0),
              child: Text('Age', style: Theme.of(context).textTheme.subtitle1,),
            ),
            Padding(
              padding: const EdgeInsets.all(2.0),
              child:  RichText(text: 
                      TextSpan(children: [
                        TextSpan(text:(_age.currentAge < 10)?'0${_age.currentAge}' ?? '00': _age.currentAge.toString() ?? '00', style: Theme.of(context).textTheme.headline2,),
                        
                        
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
                    child: MaterialButton(
                      elevation: 2,
                      focusElevation: 0,
                       highlightElevation: 0,
                      color: Theme.of(context).primaryColor,
                      padding: EdgeInsets.all(10),
                      shape: CircleBorder(),
                      child: Icon(Icons.add, size: 20,),
                      onPressed: _age.incrementAge,
                      
                      
                      ),
                  ),
                  Flexible(
                    fit: FlexFit.loose,
                    child: MaterialButton(
                      elevation: 2,
                      focusElevation: 0,
                      highlightElevation: 0,
                      color: Theme.of(context).primaryColor,
                      padding: EdgeInsets.all(10),
                      shape: CircleBorder(),
                      child: Icon(Icons.remove, size: 20,),
                      onPressed: _age.decrementAge,
                      onLongPress: _age.decrementAge,
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