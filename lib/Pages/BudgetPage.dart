import 'package:digital_wallet/Models/TransactionDetails.dart';
import 'package:digital_wallet/Services/TransactionProvider.dart';
import 'package:flutter/material.dart';
import 'package:digital_wallet/widgets/TransactionCard.dart';
import 'package:digital_wallet/widgets/GraphCard.dart';
import 'package:digital_wallet/widgets/TransactionCategory.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';
import 'package:provider/provider.dart';

class BudgetPage extends StatefulWidget {
  BudgetPage({Key key}) : super(key: key);

  @override
  _BudgetPageState createState() => _BudgetPageState();
}

class _BudgetPageState extends State<BudgetPage> {
  int _current = 0;
  var pieCard = PieCard();

  @override
  Widget build(BuildContext context) {
    var transactions = Provider.of<TransactionProvider>(context);
    var transactionsList = List();
    if (transactions.transactionList == null)
      transactions.updateTransactions();
    else {
      for (var item in transactions.transactionList) {
        if (DateTime.parse(item.transTimeStamp).month ==
                pieCard.selectDate.month &&
            DateTime.parse(item.transTimeStamp).day == pieCard.selectDate.day)
          transactionsList.add(TransactionCard(
            transactionDetails: item,
          ));
      }
    }
    return SafeArea(
      child: SingleChildScrollView(
          child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
              child: Text(
                'Balance your Budget',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: Theme.of(context).textTheme.headline5.fontSize,
                ),
                textAlign: TextAlign.left,
              ),
            ),
            pieCard,
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Daily Transactions',
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  FlatButton(
                      onPressed: () {
                        final lowPrice = MoneyMaskedTextController(
                            decimalSeparator: '.',
                            thousandSeparator: ',',
                            leftSymbol: '\$');
                        final transCategory = TransActionCategory();
                        final formKey = GlobalKey<FormState>();
                        final descController = TextEditingController();
                        showModalBottomSheet(
                            context: context,
                            isScrollControlled: true,
                            builder: (BuildContext context) {
                              return SingleChildScrollView(
                                child: Container(
                                    padding: EdgeInsets.only(
                                        bottom: MediaQuery.of(context)
                                            .viewPadding.bottom +  MediaQuery.of(context)
                                            .viewInsets.bottom),
                                    color: Colors.black54,
                                    child: Container(
                                      decoration: BoxDecoration(
                                          color: Theme.of(context)
                                              .scaffoldBackgroundColor,
                                          borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(30),
                                              topRight: Radius.circular(30))),
                                      child: Form(
                                        key: formKey,
                                        child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: [
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(10.0),
                                                child: Text(
                                                  'Add Transaction',
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .headline6,
                                                  textAlign: TextAlign.center,
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsets.symmetric(
                                                    vertical: 10,
                                                    horizontal: 30),
                                                child: TextFormField(
                                                  textInputAction:
                                                      TextInputAction.done,
                                                  controller: lowPrice,
                                                  keyboardType: TextInputType
                                                      .numberWithOptions(
                                                    decimal: true,
                                                  ),
                                                  textAlign: TextAlign.center,
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .headline6,
                                                  decoration: InputDecoration(
                                                    
                                                      contentPadding:
                                                          EdgeInsets.all(0),
                                                      filled: true,
                                                      fillColor: Colors.black26,
                                                      border:
                                                          OutlineInputBorder(
                                                        borderRadius:
                                                            const BorderRadius
                                                                    .all(
                                                                Radius.circular(
                                                                    10.0)),
                                                      ),
                                                      focusedBorder:
                                                          OutlineInputBorder(
                                                        borderRadius:
                                                            const BorderRadius
                                                                    .all(
                                                                Radius.circular(
                                                                    10.0)),
                                                      ),
                                                      enabledBorder:
                                                          OutlineInputBorder(
                                                        borderRadius:
                                                            const BorderRadius
                                                                    .all(
                                                                Radius.circular(
                                                                    10.0)),
                                                      ),
                                                      errorBorder:
                                                          OutlineInputBorder(
                                                        borderRadius:
                                                            const BorderRadius
                                                                    .all(
                                                                Radius.circular(
                                                                    10.0)),
                                                      ),
                                                      disabledBorder:
                                                          OutlineInputBorder(
                                                        borderRadius:
                                                            const BorderRadius
                                                                    .all(
                                                                Radius.circular(
                                                                    10.0)),
                                                      ),
                                                      hintText: '\$0.00',
                                                      hintStyle:
                                                          Theme.of(context)
                                                              .textTheme
                                                              .headline6,
                                                      counterText: ''),
                                                  maxLines: 1,
                                                  maxLength: 10,
                                                  minLines: 1,
                                                  validator:(val){
                                                    if(val == '\$0.00')
                                                     return 'Please specify an amount';
                                                    return null;
                                                  },
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsets.symmetric(
                                                    vertical: 10,
                                                    horizontal: 30),
                                                child: TextFormField(
                                                  controller: descController,
                                                  keyboardType:
                                                      TextInputType.text,
                                                  decoration: InputDecoration(
                                                      hintText:
                                                          'Description(Short)',
                                                      counterText: ''),
                                                  maxLines: 2,
                                                  maxLength: 20,
                                                  minLines: 1,
                                                  validator: (val){
                                                    if(val == '')
                                                      return 'Please write a description';
                                                    return null;
                                                  },
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsets.symmetric(
                                                    vertical: 10,
                                                    horizontal: 30),
                                                child: transCategory,
                                              ),
                                              SizedBox(
                                                height: 50,
                                                width: double.infinity,
                                                child: MaterialButton(
                                                  color: Theme.of(context)
                                                      .accentColor,
                                                  onPressed: () {
                                                    if(formKey.currentState.validate()){
                                                      transactions.addTransaction(
                                                        TransactionDetails(
                                                      transDesc:
                                                          descController.text,
                                                      transAmount:
                                                          lowPrice.text,
                                                      transCategory:
                                                          transCategory
                                                              .category,
                                                      transTimeStamp:
                                                          DateTime.now()
                                                              .toString(),
                                                    ));
                                                    Navigator.pop(context);
                                                    }
                                                  },
                                                  child: Text(
                                                    'Add Transaction',
                                                    style: TextStyle(
                                                      color: Colors.white,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ]),
                                      ),
                                    )),
                              );
                            });
                      },
                      child: Text(
                        'ADD',
                        style: TextStyle(color: Theme.of(context).accentColor),
                      ))
                ],
              ),
            ),
            (transactionsList.length == 0)
                ? Container(
                    height: 100,
                    child: Center(
                      child: Text('No Transactions as of yet'),
                    ))
                : ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    reverse: true,
                    itemCount: transactionsList.length ?? 0,
                    itemBuilder: (context, index) => transactionsList[index]),
            SizedBox(height: 50)
          ],
        ),
      )),
    );
  }

  void addTransaction(BuildContext context) {}
}
