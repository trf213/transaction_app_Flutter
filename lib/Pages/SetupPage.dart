import 'package:digital_wallet/Models/UserModal.dart';
import 'package:digital_wallet/Pages/Mainpage.dart';
import 'package:digital_wallet/Services/UserProvider.dart';
import 'package:flutter/material.dart';
import 'package:toggle_switch/toggle_switch.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:digital_wallet/widgets/DatePicker.dart';
import 'package:provider/provider.dart';
class SetUpPage extends StatefulWidget {
  static final String id = '/Setup';
  @override
  _SetUpPageState createState() => _SetUpPageState();
}

class _SetUpPageState extends State<SetUpPage> {
  final _pageController = PageController();
  final _nameController = TextEditingController();
  final _datePicker = DatePicker();
  String _gender = "";
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    var userProvider= Provider.of<UserProvider>(context);
    return Scaffold(
      appBar: null,
      body: SafeArea(
        child: PageView(
          physics: NeverScrollableScrollPhysics(),
          controller: _pageController,
          scrollDirection: Axis.horizontal,
          children: [
            Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
               Spacer(flex: 2),
              Container(
             
              child: Image(
              width: 200,
              height: 200,
              image: AssetImage("assets/logo.png"),
             

            ),
            ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  'Welcome to LifTracker',
                  style: Theme.of(context).textTheme.headline5,
                  textAlign: TextAlign.center,
                ),
              ),
               Spacer(flex: 1),
           
              Form(
                key: _formKey,
                  child: Padding(
                  padding: EdgeInsets.all(10),
                  child: TextFormField(
                    maxLength: 30,
                    controller: _nameController,
                    decoration: InputDecoration(
                      
                      hintText: 'What\'s your name?'),
                    validator: (value){
                      if(value == ''){
                        return 'Please tell us your name';
                      }
                      return null;
                    },
                  ),
                ),
              ),
            Spacer(flex: 3),
              ButtonBar(children: [
                FlatButton(
                  child: Text('Next', style: TextStyle(color:Theme.of(context).accentColor),),
                  onPressed: () {
                   if(_formKey.currentState.validate()){
                      _pageController.nextPage(
                        duration: Duration(milliseconds: 700), curve: Curves.ease);
                   }
                  },
                )
              ])
            ]),
            Column(
              mainAxisAlignment: MainAxisAlignment.start, 
              children: [
              Spacer(flex: 2),

               Container(
             
              child: Image(
              width: 200,
              height: 200,
              image: AssetImage("assets/logo.png"),
             

            ),
            ),
            
              
              Spacer(flex: 1),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                     Padding(
                       padding: const EdgeInsets.symmetric(horizontal:10.0),
                       child: Text(
                       'Date of Birth',
                       style: Theme.of(context).textTheme.headline6,
                       textAlign: TextAlign.justify
                  ),
                     ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: _datePicker,
                    ),
                  ],
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                    'Please Select a gender',
                    style: Theme.of(context).textTheme.headline6,
                    textAlign: TextAlign.left,
                ),
                  ),
                  
                  ToggleSwitch(
                    minWidth: 90.0,
                    minHeight: 70.0,
                    initialLabelIndex: 2,
                    cornerRadius: 20.0,
                    
                    activeFgColor: Theme.of(context).iconTheme.color,
                    inactiveBgColor: Theme.of(context).cardColor,
                    inactiveFgColor: Theme.of(context).iconTheme.color,
                    labels: ['', '', ''],
                    icons: [
                      FontAwesomeIcons.mars,
                      FontAwesomeIcons.venus,
                      FontAwesomeIcons.genderless
                    ],
                    iconSize: 30.0,
                    activeBgColors: [
                      Colors.blueAccent,
                      Colors.pinkAccent,
                      Colors.grey
                    ],
                    onToggle: (index) {
                      print(index);
                      if(index == 0)
                        _gender = 'Male';
                      else if(index == 1)
                        _gender = 'Female';
                
                      else if(index == 2)
                        _gender = 'Non-Binary';
                      
                      print(_gender);
                    },
                  ),
                ],
              ),
              
              Spacer(flex: 3),
              ButtonBar(children: [
                FlatButton(
                  child: Text('Previous'),
                  onPressed: () {
                    _pageController.previousPage(
                        duration: Duration(milliseconds: 700), curve: Curves.ease);
                  },
                ),
                FlatButton(
                  child: Text('Next',style: TextStyle(color:Theme.of(context).accentColor),),
                  onPressed: () {
                    _pageController.nextPage(
                        duration: Duration(milliseconds: 700), curve: Curves.ease);
                  },
                )
              ])
            ]),
           Column(
              mainAxisAlignment: MainAxisAlignment.start, 
              children: [
              Spacer(flex: 1),

               Column(
                 children: [
                   Container(
             
              child: Image(
              width: 200,
              height: 200,
              image: AssetImage("assets/logo.png"),
            ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text('You are all set up time to get living!', style: Theme.of(context).textTheme.headline6,),
            ),
                 ],
               ),
            
              
              Spacer(flex: 2,),
                ButtonBar(children: [
                FlatButton(
                  child: Text('Previous'),
                  onPressed: () {
                    _pageController.previousPage(
                        duration: Duration(milliseconds: 700), curve: Curves.ease);
                  },
                ),
                FlatButton(
                  child: Text('Finish', style: TextStyle(color: Theme.of(context).accentColor),),
                  onPressed: () {
                    User user = new User(
                      name: _nameController.text ?? '',
                      dob:(_datePicker.selectedDate !=null)?_datePicker.selectedDate.toString() ?? '':'',
                      gender: _gender,
                    );
                    userProvider.addUser(user);

                    Navigator.pushNamedAndRemoveUntil(context, MainPage.id, (route) => false);
                  },
                )
              ])
         
            ]),
          ],
        ),
      ),
    );
  }
}
