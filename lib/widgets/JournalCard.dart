import 'package:flutter/material.dart';

class JournalCard extends StatelessWidget {
  const JournalCard({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
   return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        height: 400,
        width: MediaQuery.of(context).size.width,
        child: Card(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          child: Column(
            children:[
              
            ]
          ),
        ),
      ),
    );
  }
}