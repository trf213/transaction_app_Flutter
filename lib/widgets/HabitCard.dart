import 'package:flutter/material.dart';

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
              SizedBox(
                width: 100,
                height: 100,
                child: CircularProgressIndicator(
                  backgroundColor:Colors.black12,
                  value:0.5,
                  strokeWidth: 10,
                  semanticsValue: '10',
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text('Hate', style: Theme.of(context).textTheme.headline6,),
              )
            ],),
          )
          ),
        ),
    );
  }
}