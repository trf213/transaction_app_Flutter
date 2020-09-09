import 'package:flutter/material.dart';

class TransactionCard extends StatelessWidget {
  const TransactionCard({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal:10, vertical:5),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child:ListTile(
          title: Text('Money Nigga'),
          trailing: Text('-\$50.00', style: TextStyle(color: Colors.redAccent, fontWeight: FontWeight.bold),),
          subtitle: Text('Aug 7th, 2020'),
        )
      ),
    );
  }
}