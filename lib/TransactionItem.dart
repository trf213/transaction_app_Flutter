

import 'package:flutter/material.dart';

class TransactionItem extends StatelessWidget {

 final  String description;
  final String value;
  final String time;
  final String type;


  TransactionItem({this.description, this.value,this.time, this.type});


  @override
  Widget build(BuildContext context) {
    return Card(

      elevation: 5,
      child: Column(

        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
         ListTile(

            leading: CircleAvatar(),
            title:    Text(description ?? "Default",style: TextStyle( fontWeight: FontWeight.w700),) ,
            subtitle: Text(time ?? "Default" ),
            trailing: Text(value ?? "Default", style:  TextStyle(color:  type == "+"? Colors.greenAccent: Color(0xffff6347)   , fontWeight: FontWeight.w700),),
          ),
        ],
      ),
    );
  }
}
