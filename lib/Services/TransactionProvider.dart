import 'package:digital_wallet/Models/TransactionDetails.dart';
import 'package:flutter/material.dart';

import 'db.dart';
import 'package:digital_wallet/Models/JournalNotes.dart';
class TransactionProvider with ChangeNotifier{

DBProvider db;
List<TransactionDetails> _transactions ;

TransactionProvider() {
  db = DBProvider.db;
  
  notifyListeners();
}

List<TransactionDetails> get transactionList => _transactions;

 updateTransactions() async{
    _transactions= await db.getTransactionList();
    notifyListeners();
}

  addTransaction(TransactionDetails n) async{
    await db.insertTransaction(n);
    updateTransactions();


  }

}

