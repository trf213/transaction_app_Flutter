import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:digital_wallet/Utilities/constants.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import 'package:date_util/date_util.dart';
import 'package:provider/provider.dart';
import 'package:digital_wallet/Services/TransactionProvider.dart';
class PieCard extends StatefulWidget {
  PieCard({Key key}) : super(key: key);
DateTime selectDate = new DateTime.now();
  @override
  _PieCardState createState() => _PieCardState();
}

class _PieCardState extends State<PieCard> {
  final ItemScrollController itemScrollController = ItemScrollController();
final ItemPositionsListener itemPositionsListener = ItemPositionsListener.create();
  
  List<PieChartSectionData> calculateSections(Map<String, dynamic> section){
    List<PieChartSectionData> pieList = new List<PieChartSectionData>();
    List<String> keys = section.keys.toList();
    keys.sort();
    for (String item in keys) {
      pieList.add(PieChartSectionData( showTitle: false,
                            color: categoriesMap[item]['color'], title:'\$${section[item]['price']}', value: section[item]['price'].toDouble() ??0, titleStyle: Theme.of(context).textTheme.button),);
      
    }
    return pieList;
  }

  List<int> getYears(){
    int initYear = 2000;
    int currentYear = DateTime.now().year;
    List<int> years = new List<int>();

    for(int i = initYear; i <= currentYear; i++)
      years.add(i);
   
    return years;

  }

  Widget calculateSavings(Map<String,dynamic> section){
    double income = 0;
    double expense = 0;
    for (String item in section.keys) {
      if(item.toLowerCase() == 'Income'.toLowerCase() || item.toLowerCase() == 'Investments'.toLowerCase())
        income += section[item]['price'];
      else 
        expense += section[item]['price'];
    }
    if((income-expense) >= 0 )
      return Text('+\$${(income-expense).toStringAsFixed(2)} Saved', style: TextStyle(fontSize: Theme.of(context).textTheme.headline6.fontSize,fontWeight: FontWeight.bold, color: Colors.greenAccent),textAlign: TextAlign.center,);
    else  return Text('-\$${(income-expense).abs().toStringAsFixed(2)} Loss', style: TextStyle(fontSize: Theme.of(context).textTheme.headline6.fontSize,fontWeight: FontWeight.bold, color: Colors.redAccent),textAlign: TextAlign.center,);
  }
  @override
  Widget build(BuildContext context) {
    var dateUtility = DateUtil();
    var transactions = Provider.of<TransactionProvider>(context);
    Map<String,dynamic> section = Map<String,dynamic>();
    if (transactions.transactionList == null)
      transactions.updateTransactions();
    else {
      for (var item in transactions.transactionList) {
        if(  widget.selectDate.month == DateTime.parse(item.transTimeStamp).month && item.transAmount != '\$0.00'&& widget.selectDate.year == DateTime.parse(item.transTimeStamp).year )
        {
          if(!section.containsKey(item.transCategory)){
            section[item.transCategory]={
              'count': 1,
              'price': double.parse(item.transAmount.substring(1).replaceAll(new RegExp(r','), '')),
            };
          }
          else{
            section[item.transCategory]['count']++;
             section[item.transCategory]['price'] += double.parse(item.transAmount.substring(1).replaceAll(new RegExp(r','), ''));

          }
        }
      }
    }
    
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        width: MediaQuery.of(context).size.width,
        child: Card(
          elevation: 5,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: DropdownButton<dynamic>(items:months.map((e) => DropdownMenuItem(child: Text(
                      e,
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    value:e ,
                    )).toList(),
                    value: months[widget.selectDate.month-1],
                    onChanged: (value){
                      setState(() {
                        widget.selectDate = new DateTime(widget.selectDate.year, months.indexOf(value)+1, widget.selectDate.day ) ;
                      });
                    },
                    )
                      ),
                      Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: DropdownButton<int>(
                        items:getYears().map((e) => DropdownMenuItem(child: Text(
                        e.toString(),
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      value:e ,
                      )).toList(),
                      value: widget.selectDate.year,
                      onChanged: (value){
                        setState(() {
                          widget.selectDate = new DateTime(value, widget.selectDate.month, widget.selectDate.day ) ;
                        });
                      },
                      )
                    ),
                  
                  ],
                ),
                (calculateSections(section).isEmpty)?Container(
                  height: 200,
                  padding: const EdgeInsets.all(10),
                  child:Center(child: Text('No Data', style: Theme.of(context).textTheme.headline5,))
                ):Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40.0),
                  child: PieChart(
                   
                    PieChartData(
                      centerSpaceRadius: 80,
                      pieTouchData: PieTouchData(enabled: true),
                      borderData: FlBorderData(show: false),
                      sections: calculateSections(section)),
                    swapAnimationDuration: Duration(milliseconds: 500),

                      ),
                      
                ),
                (calculateSections(section).isEmpty)?Container(
                  height: 0,
                  padding: const EdgeInsets.all(10),
                  child:Center(child: Text('No Data', style: Theme.of(context).textTheme.headline5,))
                ):Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      calculateSavings(section)
                    ],
                  ),
                ),
                (calculateSections(section).isEmpty)?Container(
                  height: 0,
                  padding: const EdgeInsets.all(10),
                  
                ):Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    height: 80,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      itemCount: section.keys.length ?? 0,
                      itemBuilder: (context, index){
                        List keys = section.keys.toList();
                        keys.sort();
                          return Container(
                            padding: EdgeInsets.all(10),
                            child: Column(
                              children: [
                                Icon(categoriesMap[keys[index]]['icon'],color: categoriesMap[keys[index]]['color'],),
                                Text(keys[index].toString() ?? '', style: Theme.of(context).textTheme.caption,),
                                Text('\$${section[keys[index]]['price'].toStringAsFixed(2)}' ?? '', style: Theme.of(context).textTheme.caption,)
                              ],
                            ), 
                          );
                    }),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: SizedBox(
                    height: 80,
                    child: ScrollablePositionedList.builder(
                     
                      
                      addRepaintBoundaries: true,
                   
                      scrollDirection: Axis.horizontal,
                      //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      itemCount: dateUtility.daysInMonth(widget.selectDate.month, widget.selectDate.year),
                      initialScrollIndex: widget.selectDate.day-1 ,
                  
                       
                      itemBuilder: (context, index) =>
                          (widget.selectDate.day == index + 1)
                              ? Card(
                                color: Theme.of(context).scaffoldBackgroundColor,
                                  elevation: 0,
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 8, horizontal: 5),
                                    child: Column(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              bottom: 8.0, top: 8.0),
                                          child: Text(
                                            months[widget.selectDate.month - 1]
                                                .toString()
                                                .substring(0, 3)
                                                .toUpperCase(),
                                            style: TextStyle(
                                                fontSize: 12,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                        Text(
                                          '${index + 1}',
                                          style: TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                  ))
                              : GestureDetector(
                                onTap: (){
                                  setState(() {
                                    
                                    widget.selectDate = widget.selectDate = new DateTime(widget.selectDate.year, widget.selectDate.month, index+1 ) ;
                                  });
                                },
                                    child: Card(
                                    elevation: 1,
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 8, horizontal: 5),
                                      child: Column(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                bottom: 8.0, top: 8.0),
                                            child: Text(
                                              months[widget.selectDate.month  - 1]
                                                  .toString()
                                                  .substring(0, 3)
                                                  .toUpperCase(),
                                              style: TextStyle(
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                          Text(
                                            '${index + 1}',
                                            style: TextStyle(
                                                fontSize: 12,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ],
                                      ),
                                    )),
                              ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}






