import 'package:flutter/material.dart';
import 'package:digital_wallet/widgets/TransactionCard.dart';
import 'package:digital_wallet/widgets/CalenderCard.dart';
import 'package:digital_wallet/widgets/GraphCard.dart';
class BudgetPage extends StatelessWidget {
  const BudgetPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
          child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
            Padding(
                      padding: const EdgeInsets.symmetric(vertical:20, horizontal: 10),
                      child: Text('Balance Your Budget!!', 
                                  style: TextStyle(
                                fontWeight: FontWeight.bold, 
                                fontSize:  Theme.of(context).textTheme.headline4.fontSize,
                                fontStyle: FontStyle.italic
                                ),
                              textAlign: TextAlign.left,
                              
                                  ),
                    ),
                     Padding(
               padding: const EdgeInsets.symmetric(vertical:10, horizontal:10),
               child: Text('Transaction BreakDown', style: Theme.of(context).textTheme.headline6,),
             ),
              PieCard(),
             Padding(
               padding: const EdgeInsets.symmetric(vertical:10, horizontal:10),
               child: Text('Daily Transactions', style: Theme.of(context).textTheme.headline6,),
             ),
             ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: 10,
                itemBuilder: (context, index)=> TransactionCard()),
   
            SizedBox(height:50)
          ],
          
          ),
        )
      ),
    );
  }
}