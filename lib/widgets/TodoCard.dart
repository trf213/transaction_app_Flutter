import 'package:digital_wallet/Models/TodoModal.dart';
import 'package:flutter/material.dart';

class TodoCard extends StatefulWidget {
  TodoModal todoModel;
  
  TodoCard({Key key, this.todoModel, }) : super(key: key);

  @override
  _TodoCardState createState() => _TodoCardState();
}

class _TodoCardState extends State<TodoCard> {
    bool checkBox = false;
  @override
  Widget build(BuildContext context) {
  
    
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Card(
        
        elevation: 5,
         child: InkWell(
           onTap: () {
            setState(() {
              checkBox = !checkBox;
            });
        },
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical:0, horizontal:10),
                      child: ListTile(
             contentPadding: EdgeInsets.all(8),
            leading: Container(
                height: 25,
                width: 25,
                decoration:checkBox
                        ?  BoxDecoration(
                          shape: BoxShape.circle, 
                          color: Colors.blue,
                          

                          )
                          :BoxDecoration(
                            shape: BoxShape.circle, 
                            color: Colors.transparent,
                            border: Border.all(color: Theme.of(context).iconTheme.color,width: 2)
                            ),
                child: Padding(
                  padding: const EdgeInsets.all(1.0),
                  child: checkBox
                        ? Icon(
                            Icons.check,
                            size: 20.0,
                            color: Colors.white,
                          )
                        :Container()
                ),
            ),
        title: Text(widget.todoModel.desc ?? '', 
        style: TextStyle(
            decoration: checkBox? 
            TextDecoration.lineThrough

            :
            TextDecoration.none
            , 
            fontSize: Theme.of(context).textTheme.headline6.fontSize, 
            fontWeight: Theme.of(context).textTheme.bodyText2.fontWeight
        ),),
       
       
      
      ),
                    ),
         )
      ),
    );
  }
}