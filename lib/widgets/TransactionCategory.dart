import 'package:flutter/material.dart';
import 'package:digital_wallet/Utilities/constants.dart';
class TransActionCategory extends StatefulWidget {
  TransActionCategory({Key key}) : super(key: key);
  
  String category = categories[0];
  @override
  _TransActionCategoryState createState() => _TransActionCategoryState();
}

class _TransActionCategoryState extends State<TransActionCategory> {

   
  @override
  Widget build(BuildContext context) {
    
    return DropdownButton(
      isExpanded: true,
      value: widget.category,
      onChanged:(val){
        setState(() {
            widget.category = val;
          });
      },
      hint: Text('Select A Category'),
      items: categories.map((val) => DropdownMenuItem<String>(
        value: val,
        child: Text(val),
      
      )).toList(), 
     );
  }
}