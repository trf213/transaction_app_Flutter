import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
class GoalCard extends StatelessWidget {
  const GoalCard({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(

        onTap: (){
          showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        builder: (BuildContext context) {
          return  SingleChildScrollView(
                          child: Container(
                
                   padding: EdgeInsets.only(
                        bottom: MediaQuery.of(context).viewInsets.bottom),
                        color: Colors.black54,
                  
                
           
                        child:Container(
                            decoration: BoxDecoration(
                        color: Theme.of(context).scaffoldBackgroundColor,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20))),
                    
                          child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: Text(
                                'What\'s on your mind today?',
                                style: Theme.of(context).textTheme.headline6,
                                textAlign: TextAlign.center,
                              ),
                            ),
                            Padding(
                              padding:  EdgeInsets.all(20),
                              child: TextField(
                                keyboardType: TextInputType.text,
                                decoration: InputDecoration(
                                    hintText: 'Write what\'s on your mind...',
                                    counterText: ''),
                                maxLines: 6,
                                maxLength: 200,
                                minLines: 1,
                              ),
                            ),
                            
                            SizedBox(
                              
                              height: 50,
                              width: double.infinity,
                              child: MaterialButton(
                                color: Theme.of(context).accentColor,
                                onPressed: () => print('hi'),
                                child: Text('Post',
                                style: TextStyle( color: Colors.white,),),
                                
                              ),
                            ),
                          ]),
                        )
                        
                ),
            
           
          );
        });
        },
          child: Container(
        height: 150,
        padding: const EdgeInsets.symmetric(vertical:10),
        child: Card(
          elevation: 5,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20)), 
            child: Container(
               decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
              gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [Color(0xFFFF7925), Color(0xFFF94141)])),
              child: Center(
                child: ListTile(
                  
                  title: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('Make Money' ,style: TextStyle(color:Colors.white),),
                  ),
                  
                 
                  trailing: Text('90 Mins', style: TextStyle(color:Colors.white),),
                       ),
              ),
            ),
              ),
            
            
      ),
    );
  }
}