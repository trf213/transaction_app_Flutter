import 'package:digital_wallet/Models/TransactionDetails.dart';
import 'package:digital_wallet/Utilities/constants.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
class TransactionCard extends StatelessWidget {
  TransactionDetails transactionDetails;
   TransactionCard({Key key, this.transactionDetails}) ;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ()=>showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        builder: (BuildContext context) {
          return  SingleChildScrollView(
                          child: Container(
                
                   padding: EdgeInsets.only(
                        bottom: MediaQuery.of(context).viewInsets.bottom),
                        color: Colors.black54,
                  
                
           
                        child:Container(
                            decoration: BoxDecoration(
                        color: Theme.of(context).scaffoldBackgroundColor,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(30),
                            topRight: Radius.circular(30))),
                    
                          child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: Text(
                                'Transaction Details',
                                style: Theme.of(context).textTheme.headline6,
                                textAlign: TextAlign.center,
                              ),
                            ),
                            
                            
                            SizedBox(
                              
                              height: 50,
                              width: double.infinity,
                              child: MaterialButton(
                                color: Theme.of(context).accentColor,
                                onPressed: () => Navigator.pop(context),
                                child: Text('Done', style: TextStyle( color: Colors.white,),),
                              ),
                            ),
                          ]),
                        )
                        
                ));
      }),
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        child: GestureDetector(
          child: Card(
              elevation: 5,
              shape:
                  RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              child: ListTile(
                isThreeLine: false,
                leading: CircleAvatar(
                  foregroundColor: Colors.transparent,
                  backgroundColor: Colors.transparent,
                  child: Icon( categoriesMap[transactionDetails.transCategory]['icon'] ?? FontAwesomeIcons.question, color: categoriesMap[transactionDetails.transCategory]['color'],)),
                title: Text(transactionDetails.transDesc ?? 'Having trouble loading', maxLines: 1,overflow: TextOverflow.ellipsis,),
                trailing: Text(
                    (transactionDetails.transCategory == 'Income'||transactionDetails.transCategory == 'Savings' || transactionDetails.transCategory == 'Investments' )?'+${transactionDetails.transAmount}': '-${transactionDetails.transAmount}',
                  style: TextStyle(
                      color:(transactionDetails.transCategory == 'Income'||transactionDetails.transCategory == 'Savings' || transactionDetails.transCategory == 'Investments'  )? Colors.greenAccent
                      : Colors.redAccent,
                       fontWeight: FontWeight.bold),
                ),
                subtitle: Text(
                  DateFormat.yMMMMEEEEd().format(DateTime.parse(transactionDetails.transTimeStamp) ) ?? ' Mon Oct, 13th 2020',
                  style: Theme.of(context).textTheme.bodyText1,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              )),
        ),
      ),
    );
  }

}
