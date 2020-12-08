import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'constants.dart';

class PersistantThemeData with ChangeNotifier
{
  ThemeData _mainTheme = kdarkTheme;
  bool _isThemeActivated = false;

  void setTheme(bool val) 
  {
    _isThemeActivated = val;
    if(val == false)
      _mainTheme= kdarkTheme;
    else 
    _mainTheme= klightTheme;

    notifyListeners();

  }

  ThemeData get getTheme => _mainTheme;

  
  bool getThemeData()
  {
    return _isThemeActivated;
  }



}