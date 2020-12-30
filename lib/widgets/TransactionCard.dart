import 'package:digital_wallet/Models/TransactionDetails.dart';
import 'package:digital_wallet/Utilities/constants.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';
import 'package:digital_wallet/widgets/TransactionCategory.dart';

class TransactionCard extends StatelessWidget {
  TransactionDetails transactionDetails;
  TransactionCard({Key key, this.transactionDetails});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        final lowPrice = MoneyMaskedTextController(
            decimalSeparator: '.', thousandSeparator: ',', leftSymbol: '\$');
        final transCategory = TransActionCategory();
        final _controller = TextEditingController();
        _controller.text = transactionDetails.transDesc;
        lowPrice.text =transactionDetails.transAmount;
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
                                  Padding(
                                padding: EdgeInsets.symmetric(
                                    vertical: 5, horizontal: 30),
                                child: TextFormField(
                                  textInputAction: TextInputAction.done,
                                  controller: lowPrice,
                                  keyboardType: TextInputType.numberWithOptions(
                                    decimal: true,
                                  ),
                                  textAlign: TextAlign.center,
                                  style: Theme.of(context).textTheme.headline6,
                                  decoration: InputDecoration(
                                      contentPadding: EdgeInsets.all(0),
                                      filled: true,
                                      fillColor: Colors.black26,
                                      border: OutlineInputBorder(
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(10.0)),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(10.0)),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(10.0)),
                                      ),
                                      errorBorder: OutlineInputBorder(
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(10.0)),
                                      ),
                                      disabledBorder: OutlineInputBorder(
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(10.0)),
                                      ),
                                      hintText: '\$0.00',
                                      hintStyle:
                                          Theme.of(context).textTheme.headline6,
                                      counterText: ''),
                                  maxLines: 1,
                                  maxLength: 10,
                                  minLines: 1,
                                  validator: (val) {
                                    if (val == '\$0.00')
                                      return 'Please specify an amount';
                                    return null;
                                  },
                                ),
                              ),
                            
                              Padding(
                                padding: const EdgeInsets.symmetric(vertical: 5,horizontal: 20),
                                child: Row(
                                  children: [
                                    Flexible(
                                      fit: FlexFit.loose,
                                      child: TextFormField(
                                        controller: _controller,
                                        keyboardType: TextInputType.text,
                                        decoration: InputDecoration(
                                            hintText:
                                                'Description',
                                            counterText: ''),
                                        maxLines: 6,
                                        maxLength: 20,
                                        minLines: 1,
                                        validator: (val) {
                                          if (val == '')
                                            return 'Please write down something';
                                          return null;
                                        },
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(1.0),
                                      child: IconButton(
                                        icon: Icon(
                                          Icons.delete,
                                          size: 30,
                                        ),
                                        onPressed: () {},
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              
                            SizedBox(
                                height: 50,
                                width: double.infinity,
                                child: MaterialButton(
                                  color: Theme.of(context).accentColor,
                                  onPressed: () => Navigator.pop(context),
                                  child: Text(
                                    'Done',
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ]),
                      )));
            });
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        child: GestureDetector(
          child: Card(
              elevation: 5,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              child: ListTile(
                isThreeLine: false,
                leading: CircleAvatar(
                    foregroundColor: Colors.transparent,
                    backgroundColor: Colors.transparent,
                    child: Icon(
                      categoriesMap[transactionDetails.transCategory]['icon'] ??
                          FontAwesomeIcons.question,
                      color: categoriesMap[transactionDetails.transCategory]
                          ['color'],
                    )),
                title: Text(
                  transactionDetails.transDesc ?? 'Having trouble loading',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                trailing: Text(
                  (transactionDetails.transCategory == 'Income' ||
                          transactionDetails.transCategory == 'Savings' ||
                          transactionDetails.transCategory == 'Investments')
                      ? '+${transactionDetails.transAmount}'
                      : '-${transactionDetails.transAmount}',
                  style: TextStyle(
                      color: (transactionDetails.transCategory == 'Income' ||
                              transactionDetails.transCategory == 'Savings' ||
                              transactionDetails.transCategory == 'Investments')
                          ? Colors.greenAccent
                          : Colors.redAccent,
                      fontWeight: FontWeight.bold),
                ),
                subtitle: Text(
                  DateFormat.yMMMMEEEEd().format(
                          DateTime.parse(transactionDetails.transTimeStamp)) ??
                        'Mon Oct, 13th 2020',
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
