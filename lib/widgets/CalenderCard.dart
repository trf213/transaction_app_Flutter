import 'package:flutter/material.dart';


class CalenderCard extends StatelessWidget {
  const CalenderCard({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        height: 400,
        width: MediaQuery.of(context).size.width,
        child: Card(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          child: Column(
            children:[
              
            ]
          ),
        ),
      ),
    );
  }
}