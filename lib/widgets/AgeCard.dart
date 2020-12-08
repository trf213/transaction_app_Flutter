import 'package:digital_wallet/Models/UserModal.dart';
import 'package:digital_wallet/Services/UserProvider.dart';
import 'package:digital_wallet/Utilities/BMIData.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:holding_gesture/holding_gesture.dart';

class AgeCard extends StatelessWidget {
 
  AgeCard({Key key}) : super(key: key);

 int calculateAge(DateTime birthDate) {
  DateTime currentDate = DateTime.now();
  int age = currentDate.year - birthDate.year;
  int month1 = currentDate.month;
  int month2 = birthDate.month;
  if (month2 > month1) {
    age--;
  } else if (month1 == month2) {
    int day1 = currentDate.day;
    int day2 = birthDate.day;
    if (day2 > day1) {
      age--;
    }
  }
  return age;
}
  
  @override
  Widget build(BuildContext context) {
    var _age = Provider.of<Age>(context);
    var _user = Provider.of<UserProvider>(context);
  
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Card(
        elevation: 5,
        shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical:20 , horizontal:20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
            
            Padding(
              padding: const EdgeInsets.all(2.0),
              child: Text('Age', style: Theme.of(context).textTheme.subtitle1,),
            ),
             (_user.user == null || _user.user.dob == null || _user.user.dob == '' || _user.user.dob =='null')?Padding(
              padding: const EdgeInsets.all(2.0),
              child:  RichText(text: 
                      TextSpan(children: [
                        TextSpan(text:(_age.currentAge < 10)?'0${_age.currentAge}' ?? '00': _age.currentAge.toString() ?? '00', style: Theme.of(context).textTheme.headline2,),
                        
                        
                      ]
                      )
                      ),
            ):Padding(
              padding: const EdgeInsets.all(2.0),
              child:  RichText(text: 
                      TextSpan(children: [
                        TextSpan(text:(_user.user.dob != null && _user.user.dob != '' && _user.user.dob != 'null')?(calculateAge(DateTime.parse(_user.user.dob)) < 10)?'0${calculateAge(DateTime.parse(_user.user.dob))}' ?? '00': '${calculateAge(DateTime.parse(_user.user.dob))}' ?? '00':'00', style: Theme.of(context).textTheme.headline2,),
                        
                        
                      ]
                      )
                      ),
            ),
            (_user.user == null || _user.user.dob == null || _user.user.dob == '' || _user.user.dob == 'null')?Padding(
              padding: const EdgeInsets.all(2.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Flexible(
                    fit: FlexFit.loose,
                    child: HoldDetector(
                        onHold: _age.incrementAge,
                        enableHapticFeedback: true,
                        child: MaterialButton(
                          elevation: 2,
                          focusElevation: 0,
                          highlightElevation: 0,
                          color: Theme.of(context).primaryColor,
                          padding: EdgeInsets.all(10),
                          shape: CircleBorder(),
                            child:  Icon(Icons.add, size: 20, color: Colors.white,),
                          onPressed: _age.incrementAge,
                        
                        
                        ),
                    ),
                  ),
                  Flexible(
                    fit: FlexFit.loose,
                    child:HoldDetector(
                        onHold: _age.decrementAge,
                        enableHapticFeedback: true,
                        child: MaterialButton(
                      elevation: 2,
                      focusElevation: 0,
                      highlightElevation: 0,
                      color: Theme.of(context).primaryColor,
                      padding: EdgeInsets.all(10),
                      shape: CircleBorder(),
                      child: Icon(Icons.remove, size: 20, color: Colors.white,),
                      onPressed: _age.decrementAge,
                      onLongPress: _age.decrementAge,
                      ),)
                  ),
                ],),
            ): Container()
          ],),
        ),
      ),
    );
  }
}