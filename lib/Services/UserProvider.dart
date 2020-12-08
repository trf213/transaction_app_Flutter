import 'package:digital_wallet/Models/UserModal.dart';
import 'package:flutter/material.dart';

import 'db.dart';
import 'package:digital_wallet/Models/JournalNotes.dart';
class UserProvider with ChangeNotifier{

DBProvider db;
User _user ;

UserProvider() {
  db = DBProvider.db;
  
  notifyListeners();
}

User get user => _user;

 fetchUser() async{
    _user = await db.getUser();
    notifyListeners();
}

updateUser(User user) async{
  await db.updateUser(user);
  fetchUser();
  
}

  addUser(User user) async{
    await db.insertUser(user);
    notifyListeners();


  }

}

