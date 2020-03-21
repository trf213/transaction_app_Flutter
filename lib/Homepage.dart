import 'package:digital_wallet/AddTransaction.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'List.dart';
import 'FABBottomBar.dart';
import 'TransactionItem.dart';
class Homepage extends StatelessWidget {
  static String id = "/Homepage";






  @override
  Widget build(BuildContext context) {
    final prices = Provider.of<Prices>(context);


    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,

        elevation: 5,
        centerTitle: false,
        title: Text("Daily Transactions", style: TextStyle(
          color: Colors.black87,
          fontWeight: FontWeight.w700,
          fontSize: 30,
        ),),

        actions: <Widget>[
          Icon(Icons.search,color: Colors.black87, size: 30,)
        ],
      ),

      body: SingleChildScrollView(
        child: SizedBox(
          height: 4*MediaQuery.of(context).size.height/5,
          child: Consumer <Prices>(
            builder: (context,prices,_) {
            return  ListView.builder(

              shrinkWrap: true,
                        scrollDirection: Axis.vertical,

                        itemCount: prices.Transactions.length,
                        itemBuilder: (BuildContext context, int index){
                       return TransactionItem(
                         description: prices.Transactions[index][0],
                         value: prices.Transactions[index][1],
                         time: prices.Transactions[index][2],
                         type: prices.Transactions[index][3],


                       );
          }
          );},
          )
        ),
      ),


      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        backgroundColor: Colors.pinkAccent,

        onPressed: (){
          showModalBottomSheet(context: context,isScrollControlled: true, builder: (context){




            return SingleChildScrollView(child:  AddTransactionSheet(price: prices,));
          });


      },
      ),
      bottomNavigationBar: FABBottomAppBar(
        color: Colors.grey,
        selectedColor: Colors.pinkAccent,

        items: [
          FABBottomAppBarItem(iconData: Icons.calendar_today, text: 'Daily'),
          FABBottomAppBarItem(iconData: Icons.insert_chart, text: 'Stat'),
          FABBottomAppBarItem(iconData: Icons.account_balance_wallet, text: 'Budget'),
          FABBottomAppBarItem(iconData: Icons.account_circle, text: 'Profile',),
        ],
      ),
    );
  }
}
