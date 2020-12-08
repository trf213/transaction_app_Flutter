import 'package:flutter/material.dart';
import 'package:digital_wallet/widgets/HabitCard.dart';
import 'package:digital_wallet/widgets/CalenderCard.dart';
import 'package:digital_wallet/widgets/GoalsCard.dart';
import 'package:provider/provider.dart';
import 'package:digital_wallet/Services/UserProvider.dart';
import 'package:digital_wallet/widgets/HabitSlider.dart';
import 'package:digital_wallet/widgets/JournalCard.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var user = Provider.of<UserProvider>(context);
    return SafeArea(
      child: SingleChildScrollView(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
              child: Text(
                (user != null && user.user != null)
                    ? 'Welcome Back!! ${user.user.name}'
                    : 'Welcomr Back!!',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: Theme.of(context).textTheme.headline5.fontSize,
                ),
                textAlign: TextAlign.left,
              ),
            ),
            JournalCard(),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Your Habits',
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  FlatButton(
                      onPressed: () {
                        final _formKey = GlobalKey<FormState>();
                        showModalBottomSheet(
                            context: context,
                            isScrollControlled: true,
                            builder: (BuildContext context) {
                              return SingleChildScrollView(
                                child: Container(
                                    padding: EdgeInsets.only(
                                        bottom: MediaQuery.of(context)
                                            .viewInsets
                                            .bottom),
                                    color: Colors.black54,
                                    child: Container(
                                      decoration: BoxDecoration(
                                          color: Theme.of(context)
                                              .scaffoldBackgroundColor,
                                          borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(20),
                                              topRight: Radius.circular(20))),
                                      child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(20.0),
                                              child: Text(
                                                'Add Habit',
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .headline6,
                                                textAlign: TextAlign.center,
                                              ),
                                            ),
                                            Form(
                                              key: _formKey,
                                              child: Padding(
                                                padding: EdgeInsets.all(20),
                                                child: TextFormField(
                                                  keyboardType:
                                                      TextInputType.text,
                                                  validator: (val) {
                                                    if (val == '')
                                                      return 'Please input a name for the habit';
                                                    else
                                                      return null;
                                                  },
                                                  decoration: InputDecoration(
                                                      hintText:
                                                          'The name of the habit...',
                                                      counterText: ''),
                                                  maxLines: 6,
                                                  maxLength: 20,
                                                  minLines: 1,
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 8,
                                                      horizontal: 20),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    'Time Period',
                                                    style: TextStyle(
                                                        fontSize:
                                                            Theme.of(context)
                                                                .textTheme
                                                                .bodyText2
                                                                .fontSize,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            HabitSlider(),
                                            SizedBox(
                                              height: 50,
                                              width: double.infinity,
                                              child: MaterialButton(
                                                color: Theme.of(context)
                                                    .accentColor,
                                                onPressed: () {
                                                  if (_formKey.currentState
                                                      .validate()) {
                                                    Navigator.pop(context);
                                                  }
                                                },
                                                child: Text(
                                                  'Add Habit',
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ]),
                                    )),
                              );
                            });
                      },
                      child: Text(
                        'ADD',
                        style: TextStyle(color: Theme.of(context).accentColor),
                      ))
                ],
              ),
            ),
            SizedBox(
              height: 350,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemCount: 10,
                  itemBuilder: (context, index) => HabitCard()),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Your Goals',
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  FlatButton(
                      onPressed: () => print('hi'),
                      child: Text(
                        'ADD',
                        style: TextStyle(color: Theme.of(context).accentColor),
                      ))
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 10),
              child: ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemCount: 4,
                  itemBuilder: (context, index) => GoalCard()),
            ),
          ],
        ),
      )),
    );
  }
}
