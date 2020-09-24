import 'package:digital_wallet/Utilities/BMIData.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class HeightCard extends StatelessWidget {
 
  HeightCard({Key key}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    var _height= Provider.of<Height>(context);
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
              child: Text('Height', style: Theme.of(context).textTheme.subtitle1,),
            ),
            Padding(
              padding: const EdgeInsets.all(2.0),
              child:  RichText(text: 
                      TextSpan(children: [
                        TextSpan(text:_height.currentHeight.round().toString(), style: Theme.of(context).textTheme.headline2,),
                        TextSpan(text:'cm', style: Theme.of(context).textTheme.bodyText1,),
                        
                      ]
                      )
                      )  // Text(sliderVal.round().toString() ?? '00',  style: Theme.of(context).textTheme.headline2,),
            ),
            Padding(
              padding: const EdgeInsets.all(2.0),
              child: Slider(
                inactiveColor: Theme.of(context).primaryColorDark,
                activeColor: Theme.of(context).accentColor,
                max: 300,
                min: 50,
                value: _height.currentHeight, 
                onChanged: _height.updateHeight
              ),
            )
          ],),
        ),
      ),
    );
  }
}