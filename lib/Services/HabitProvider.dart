import 'package:flutter/material.dart';

import 'db.dart';
import 'package:digital_wallet/Models/HabitModal.dart';
class HabitProvider with ChangeNotifier{

DBProvider db;
List<HabitModal> _habits ;

HabitProvider() {
  db = DBProvider.db;
  
  notifyListeners();
}

List<HabitModal> get habitsList => _habits;

 updateHabit() async{
    _habits = await db.getHabitList();
    notifyListeners();
}

  addHabit(HabitModal n) async{
    await db.insertHabit(n);
    updateHabit();


  }

  deleteHabit(HabitModal n) async{
    await db.deleteHabit(n.id);
    updateHabit();
   
  }

}

