
import 'package:digital_wallet/Services/UserProvider.dart';
import 'package:digital_wallet/widgets/DatePicker.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:digital_wallet/Utilities/PersistantData.dart';
import 'package:digital_wallet/Models/UserModal.dart';
class Profilepage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var theme = Provider.of<PersistantThemeData>(context);
    var user = Provider.of<UserProvider>(context);

    return (user != null && user.user != null)?SafeArea(
      child: SingleChildScrollView(
        child:Column(children: [
          Container(
          padding: EdgeInsets.all(0),
          width: double.infinity,
          height: 250,
          child: Stack(
          
          fit: StackFit.expand,
            children: [
              Container(
            
            decoration: BoxDecoration(
           gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [Color(0xFFFF7925), Color(0xFFF94141)]),
          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(50), bottomRight:Radius.circular(50))),
            
              ),
            Align(
          alignment: Alignment.center,
                          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: CircleAvatar(radius: 60,
            backgroundColor: Colors.grey[400],
            backgroundImage: AssetImage('assets/Mountain.jpg'),
            child: Icon(FontAwesomeIcons.userAlt, size: 50, color: Colors.white,),
            ),
          ),
            ),
            Align(
             alignment: Alignment.bottomCenter,
                          child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Text(user.user.name??'User', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20,  color: Colors.white,),),
          ),
            )
          ],),
            ),

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              elevation:5,
              child: Container(
                width: double.infinity,
                child: Column(children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('Personal Information', style: Theme.of(context).textTheme.headline6),
                  ),
                  ListTile(
                    title:Text('Name'),
                    subtitle:Text(user.user.name??'User'),
                    trailing: FlatButton(child: Text('Edit', style: TextStyle(color: Colors.blueAccent),),
                    onPressed: (){
                         final _controller = TextEditingController();
                        final _formKey =GlobalKey<FormState>();

                        _controller.text = user.user.name;
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
                                                'What\'s your name?',
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
                                                  controller: _controller,
                                                  keyboardType:
                                                      TextInputType.text,
                                                  decoration: InputDecoration(
                                                      hintText:
                                                          'What\'s your name?',
                                                      counterText: ''),
                                                  maxLines: 6,
                                                  maxLength: 200,
                                                  minLines: 1,
                                                  validator: (val){
                                                    if(val == '')
                                                      return 'Please write down something';
                                                    return null;
                                                  },
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              height: 50,
                                              width: double.infinity,
                                              child: MaterialButton(
                                                color: Theme.of(context)
                                                    .accentColor,
                                                onPressed: () {
                                                  if(_formKey.currentState.validate()){
                                                    if(_controller != null && _controller.text != ''){
                                                        user.updateUser(User(
                                                          name: _controller.text,
                                                          gender: user.user.gender,
                                                          dob: user.user.dob
                                                        ));
                                                    Navigator.pop(context);
                                                  }
                                                  }
                                                },
                                                child: Text(
                                                  'Update',
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
                    },)
                  ),
                  ListTile(
                    title:Text('Date of Birth'),
                    subtitle:Text((user.user.dob != null && user.user.dob != '' && user.user.dob != 'null')?'${DateTime.parse(user.user.dob).day}/${DateTime.parse(user.user.dob).month}/${DateTime.parse(user.user.dob).year}':'', overflow: TextOverflow.fade,),
                    trailing: FlatButton(child: Text('Edit', style: TextStyle(color: Colors.blueAccent),),onPressed: () async
                    {
                       DateTime dob = await showDatePicker(context: context, initialDate: DateTime.now(), firstDate: DateTime(1990,1,1), lastDate: DateTime.now());
                       if(dob != null){
                         user.updateUser(User(
                           name: user.user.name,
                           gender: user.user.gender,
                           dob: dob.toString()
                         ));
                         //user.user.dob = dob.toString();
                       }
                    },)
                  ),
                  ListTile(
                    title:Text('Gender'),
                    subtitle:Text(user.user.gender??'', overflow: TextOverflow.fade,),
                    
                  ),
                ],),
              )
              ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              elevation:5,
              child: Container(
                width: double.infinity,
                child: Column(children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('Settings', style: Theme.of(context).textTheme.headline6),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children:[
                        Text((!theme.getThemeData())?'Change to Light Theme?':'Change to Dark Theme?'),
                        Switch(value: theme.getThemeData(), onChanged: (value){
                          theme.setTheme(value);
                        })
                      ]
                    ),
                  )
                ],),
              )
              ),
          )
        ],)
      )):SafeArea(child: Center(child: CircularProgressIndicator(),));
  }
}
