import 'package:digital_wallet/TransactionItem.dart';
import 'package:flutter/material.dart';
import 'DropDown.dart';
import 'List.dart';

class AddTransactionSheet extends StatefulWidget {

   Prices price;

   AddTransactionSheet({this.price});

  @override
  _AddTransactionSheetState createState() => _AddTransactionSheetState();
}

class _AddTransactionSheetState extends State<AddTransactionSheet> {
  String description;
  String cost;

  MyDropDown Type =   MyDropDown(dropdownValue: "+",items: ["+","-"],);
  final descriptionController = TextEditingController();
  final costController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    descriptionController.dispose();
    costController.dispose();
  }
  @override
  Widget build(BuildContext context) {
    String description;
    String cost;
    return Container(

      padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      decoration: BoxDecoration(
        color: Color(0xFF757575),

      ),
      child: Container(
        padding: EdgeInsets.only(bottom: 50),
        decoration: BoxDecoration(color: Colors.white,
          borderRadius:BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20)),),
        child:  Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text("Add Transaction", style: TextStyle(color: Colors.pinkAccent, fontSize: 30, fontWeight: FontWeight.w500),),
            Container(
              padding: EdgeInsets.only(left: 20, right: 20),
              child:  TextField(
                    controller: descriptionController,


                decoration: InputDecoration(hintText: "Description", hintStyle: TextStyle(fontWeight: FontWeight.w700),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.pinkAccent),
                  ),
                ),

              ),
            ),

            Container(child:Row(
              children: <Widget>[
                Type,
                Container(
                  width: 200,

                  padding: EdgeInsets.only(left: 20, right: 20),
                  child:  TextField(
                    controller: costController,
                    keyboardType: TextInputType.numberWithOptions(decimal: true),
                    decoration: InputDecoration(hintText: "Cost", hintStyle: TextStyle(fontWeight: FontWeight.w700),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.pinkAccent),
                      ),
                    ),
                    onChanged: (value){cost = value;},

                  ),
                ),



              ],
            ), padding: EdgeInsets.all(20),),

            MaterialButton(onPressed: (){widget.price.addElement([descriptionController.text,costController.text,"Mon 12", Type.dropdownValue]); Navigator.pop(context);},
              child: Text('Add', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500),),color: Colors.pinkAccent,elevation: 0,)

          ],

        ),
      ),
    );
  }
}
