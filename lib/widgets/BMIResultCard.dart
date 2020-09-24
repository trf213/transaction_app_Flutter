import 'package:digital_wallet/Utilities/BMIData.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class ResultCard extends StatefulWidget {
  
 double _result;
  ResultCard({Key key}) : super(key: key);

  @override
  _ResultCardState createState() => _ResultCardState();
}

class _ResultCardState extends State<ResultCard> {


  Widget bmiClass(){
    if( widget._result == null )
      return Icon(Icons.remove, color: Colors.red, size: 50,);
    else if (widget._result <= 16 ) return Icon(Icons.remove, color: Colors.red, size: 50,);
    else if( widget._result>16 && widget._result<=18.5 )
      return Text('Underweight', style: TextStyle(color: Colors.amber, fontWeight: FontWeight.bold, fontSize: 30),);
     else if( widget._result>18.5 && widget._result<25 )
      return Text('Normal', style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold,fontSize: 30),);
      else return Text('Overweight', style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold, fontSize: 30), );
  }
  void calculateBMI(int weight, double height)
  {
    setState(() {
     
      if(weight != 0 && height != 0)
        widget._result = (weight)/(height*height)*10000;
      else
        widget._result =0; 
    });
    print(widget._result);
  }
  @override
  Widget build(BuildContext context) {
    var _age = Provider.of<Age>(context);
    var _height = Provider.of<Height>(context);
    var _weight = Provider.of<Weight>(context);
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
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
                child: Text('BMI Result', style: Theme.of(context).textTheme.headline5,),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: bmiClass(),
              ),
              Padding(
                padding: const EdgeInsets.all(2.0),
                child: Text((widget._result != null)?widget._result.toStringAsFixed(1) ?? '0.0': '0.0',  style: Theme.of(context).textTheme.headline2,),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  width: double.infinity,
                  child: MaterialButton(
                    
                    color: Colors.red,
                    shape: StadiumBorder(),
                    onPressed: ()=>calculateBMI(_weight.currentWeight, _height.currentHeight),
                    child: Text('Calculate'),
                  ),
                ),
              ),
            ],),
          ),
        ),
      ),
    );
  }
}