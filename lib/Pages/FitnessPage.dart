import 'package:flutter/material.dart';
import 'package:digital_wallet/widgets/HeightCard.dart';
import 'package:digital_wallet/widgets/WeightCard.dart';
import 'package:digital_wallet/widgets/BMIResultCard.dart';
import 'package:digital_wallet/widgets/AgeCard.dart';
import 'package:digital_wallet/widgets/StepCounter.dart';
class FitnessPage extends StatelessWidget {
  const FitnessPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final weight = WeightCard();
    final height = HeightCard();

    final reslt = ResultCard();

    return SafeArea(
      child: SingleChildScrollView(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
            child: Text(
              'Welcome Back!! Tabari',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: Theme.of(context).textTheme.headline4.fontSize,
                  fontStyle: FontStyle.italic),
              textAlign: TextAlign.left,
            ),
          ),
           Padding(
               padding: const EdgeInsets.symmetric(vertical:10, horizontal:10),
               child: Row(
                 mainAxisAlignment: MainAxisAlignment.spaceBetween ,
                 children: [
                   Text('Your Calorie Count', style: Theme.of(context).textTheme.headline6,),
                   FlatButton(onPressed: ()=>print('hi'), child: Text('ADD', style:TextStyle(color: Theme.of(context).accentColor),))
                 ],
               ),
             ),
             StepCounterCard(),
             
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'BMI Calculator',
                  style: Theme.of(context).textTheme.headline6,
                ),
              ],
            ),
          ),
          Row(
            children: [
              Flexible(fit: FlexFit.loose, child: weight),
              Flexible(fit: FlexFit.loose, child: AgeCard()),
            ],
          ),
          height,
          reslt,
          
        ],
      )),
    );
  }
}
