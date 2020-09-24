import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';


class PieCard extends StatelessWidget {
  const PieCard({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        
        width: MediaQuery.of(context).size.width,
        child: Card(
          elevation: 5,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          child:  Column(
            children: [
              
              Padding(
                padding: const EdgeInsets.all(50.0),
                child: PieChart(
                  PieChartData(
                    centerSpaceRadius: 80,
                    borderData: FlBorderData(show:false),
                    sections: [
                      PieChartSectionData(
                        color: Colors.redAccent,
                        title: 'Food',
                        value: 10
                    
                        ),
                      PieChartSectionData(
                        color: Colors.blueAccent,
                        title: 'Tech',
                        value: 20
                        ),
                      PieChartSectionData(
                        color: Colors.purpleAccent,
                        title: 'Luxary',
                        value: 10
                        ),
                    ]
                )),
              ),

              
              
            ],
          ),
        ),
      ),
    );
  }
}

class Indicator 
extends StatelessWidget {
  const Indicator(
    {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
    
    );
  }
}