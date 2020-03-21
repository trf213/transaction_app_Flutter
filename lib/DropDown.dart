import 'package:flutter/material.dart';

class MyDropDown extends StatefulWidget {
  String dropdownValue;
  List<String> items;
  MyDropDown({this.dropdownValue, this.items});
  @override
  _MyDropDownState createState() => _MyDropDownState();

}

class _MyDropDownState extends State<MyDropDown> {


  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: widget.dropdownValue,

      iconSize: 24,
      elevation: 16,
      style: TextStyle(
        fontSize: 20,
          color: Colors.grey
      ),
      underline: Container(
        height: 2,
        color: Colors.pinkAccent,
      ),
      onChanged: (String newValue) {
        setState(() {
          widget.dropdownValue = newValue;
        });
      },
      items: widget.items
          .map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      })
          .toList(),
    );
  }
}
