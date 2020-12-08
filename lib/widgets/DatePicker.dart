import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DatePicker extends StatefulWidget {
  final String title;
   DateTime selectedDate;
  DatePicker({this.title});
  @override
  _DatePickerState createState() => _DatePickerState();
}

class _DatePickerState extends State<DatePicker> {
  String convertDateTimeDisplay(String date) {
    final DateFormat displayFormater = DateFormat('yyyy-MM-dd HH:mm:ss.SSS');
    final DateFormat serverFormater = DateFormat('yyyy/MM/dd');
    final DateTime displayDate = displayFormater.parse(date);
    final String formatted = serverFormater.format(displayDate);
    return formatted;
  }
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListTile(title: Text(widget.title ?? 'Please select a date') , 
        trailing: FlatButton(
          child: Text((widget.selectedDate != null || widget.selectedDate.toString() != 'null')?convertDateTimeDisplay(widget.selectedDate.toString()) ??'Select':'Select',style: TextStyle(color:Theme.of(context).accentColor),),
          onPressed: () async{
            final DateTime picked = await showDatePicker(
        context: context,
        initialDate: DateTime(2000,1,1),
        firstDate: DateTime(1900, 1,1),
        lastDate: DateTime(2101));
    if (picked != null && picked != widget.selectedDate)
      setState(() {
        widget.selectedDate = picked;
      });
          },
        ),
        ),
      ),
    );
  }
}