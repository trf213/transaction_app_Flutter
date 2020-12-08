import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class Age with ChangeNotifier
{
  int _age =0;

  int get currentAge => _age;

 void decrementAge() {
    if(_age <= 0 )
      _age = 0;
    else --_age;
    notifyListeners();
  }
  void incrementAge(){
    if(_age >= 110 )
      _age = 110;
    else ++_age;
     notifyListeners();
  }

}

class Weight with ChangeNotifier
{
  int _weight = 0;

  int get currentWeight => _weight;

   void decrementWeight() {
    if(_weight<= 0 )
      _weight = 0;
    else --_weight;
    notifyListeners();
  }
  void incrementWeight() {
    if(_weight >=300 )
     _weight = 300;
    else ++_weight;
    notifyListeners();
  }


   void decrementWeightByTen() {
    if(_weight<= 0 )
      _weight = 0;
    else _weight -= 10;
    notifyListeners();
  }
  void incrementWeightByTen() {
    if(_weight >=300 )
     _weight = 300;
    else _weight +=10;
    notifyListeners();
  }
}

class Height with ChangeNotifier
{
  double _height = 50;

  double get currentHeight => _height;

  void updateHeight(double val)
  {
    _height = val;
    notifyListeners();
  }

  

}

class Bmi with ChangeNotifier{

  double _bmi = 0.0;

  double get bmi => _bmi;

  void updateBMI(double val){
    _bmi = val;
    notifyListeners();
  }

}