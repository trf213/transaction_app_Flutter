import 'package:flutter/material.dart';

class HabitSlider extends StatefulWidget {
  HabitSlider({Key key}) : super(key: key);
  double value = 10;
  @override
  _HabitSliderState createState() => _HabitSliderState();
}

class _HabitSliderState extends State<HabitSlider> {
  @override
  Widget build(BuildContext context) {
    return  Padding(
              padding: const EdgeInsets.all(2.0),
              child: SliderTheme(
                data: SliderThemeData(
                  valueIndicatorColor: Theme.of(context).accentColor
                ),
                  child: Slider(
                  inactiveColor: Theme.of(context).primaryColorDark,
                  activeColor: Theme.of(context).accentColor,
                  max: 300,
                  min: 10,
                  divisions: 290,
                  value: widget.value, 
                  
                  label: '${widget.value.round()} Days',
                  onChanged:(val){
                    setState(() {
                      widget.value = val;
                    });
                  },
                ),
              ),
            );
  }
}