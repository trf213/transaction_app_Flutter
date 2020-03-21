import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

class Prices with ChangeNotifier{

  List<List<String>> Transactions =  [
    ['UWI Fees', '530.00','Mon 5AM', '-'],

    ['UWI Fees', '40.00','Mon 5AM', '-'],
    ['Bus Fare', '14.00','Mon 5AM', '-'],
    ['Chefettess', '530.00','Mon 5AM', '-'],
    ['Salary', '530.00','Mon 5AM', '+'],
  ];
  
  void addSameElement(){
    Transactions.add( ['Chefettess', '530.00','Mon 5AM']);
     notifyListeners();
  }
  
  void addElement(List<String> val){
    Transactions.add(val);
    notifyListeners();
  }
}
