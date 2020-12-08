import 'package:digital_wallet/Utilities/BMIData.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ResultCard extends StatelessWidget {

  ResultCard({Key key}) : super(key: key);


  Widget bmiClass( double val) {
    if (val == null )
      return Icon(
        Icons.remove,
        color: Colors.red,
        size: 50,
      );
    else if (val <= 16)
      return Icon(
        Icons.remove,
        color: Colors.red,
        size: 50,
      );
    else if (val> 16 && val <= 18.5)
      return Text(
        'Underweight',
        style: TextStyle(
            color: Colors.amber, fontWeight: FontWeight.bold, fontSize: 30),
      );
    else if (val > 18.5 && val < 25)
      return Text(
        'Normal',
        style: TextStyle(
            color: Colors.green, fontWeight: FontWeight.bold, fontSize: 30),
      );
    else
      return Text(
        'Overweight',
        style: TextStyle(
            color: Colors.red, fontWeight: FontWeight.bold, fontSize: 30),
      );
  }

  void calculateBMI(int weight, double height) {}
  @override
  Widget build(BuildContext context) {
    var _height = Provider.of<Height>(context);
    var _weight = Provider.of<Weight>(context);
    var _bmi = Provider.of<Bmi>(context);
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        width: double.infinity,
        child: Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          elevation: 5,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'BMI Result',
                    style: Theme.of(context).textTheme.headline5,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: bmiClass(_bmi.bmi),
                ),
                Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Text(
                    (_bmi != null && _bmi.bmi != null)
                        ? _bmi.bmi.toStringAsFixed(1) ?? '0.0'
                        : '0.0',
                    style: Theme.of(context).textTheme.headline2,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    width: double.infinity,
                    child: MaterialButton(
                      color: Theme.of(context).primaryColorDark,
                      shape: StadiumBorder(),
                      onPressed: () {
                        
                          if (_weight.currentWeight != 0 &&
                              _height.currentHeight != 0)
                           _bmi.updateBMI((_weight.currentWeight) /
                                (_height.currentHeight *
                                    _height.currentHeight) *
                                10000); 
                          else
                           _bmi.updateBMI(0);
                      
                        print(_bmi.bmi);
                      },
                      child: Text(
                        'Calculate',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
