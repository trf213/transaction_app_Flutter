import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
class GoalCard extends StatelessWidget {
  const GoalCard({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical:10),
      child: Card(
        elevation: 5,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10)), 
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: ListTile(
              title: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('Make Money'),
              ),
              
             
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                Flexible(
                     fit: FlexFit.loose,
                     child: IconButton(icon: Icon(LineAwesomeIcons.alternate_redo, size: 30), onPressed: ()=>print('hi')),
                   ),
                   Flexible(
                     fit: FlexFit.loose,
                     child: IconButton(icon: Icon(LineAwesomeIcons.vertical_ellipsis, size: 30), onPressed: ()=>print('hi')),
                   ),
              ],)
              ),
          ),
          ),
    );
  }
}