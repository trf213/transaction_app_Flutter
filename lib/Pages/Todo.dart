import 'package:digital_wallet/Models/TodoModal.dart';
import 'package:flutter/material.dart';
import 'package:digital_wallet/widgets/TodoCard.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:digital_wallet/widgets/AddTodo.dart';
class TodoPage extends StatelessWidget {
  const TodoPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> todoMap;
    List<TodoModal> todos = [
      TodoModal(
        id:1,
        desc:'rnfre',
        isCompleted: false,
        dueDate: DateTime.now(),
        priorityLevel: 'low'

      ),
      TodoModal(
        id:2,
        desc:'rnfre',
        isCompleted: true,
        dueDate: DateTime(2020,11,01),
        priorityLevel: 'high'

      ),
      TodoModal(
        id:3,
        desc:'rnfdfw',
        isCompleted: true,
        dueDate: DateTime(2020,11,01),
        priorityLevel: 'fwefwf'

      )
    ];
    for (var item in todos) {
      
    }
    return SafeArea(child:
    SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical:20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
             Padding(
                padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                child: Text(
                  'TODOs',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: Theme.of(context).textTheme.headline5.fontSize,
                  ),
                  textAlign: TextAlign.left,
                ),
              ),
              AddTodo(
                onTap: (){
                  final _controller = TextEditingController();
                        final _formKey =GlobalKey<FormState>();
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
                                                  'Add Todos',
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
                                                          'Write what task you have to complete',
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
                                                    
                                                    Navigator.pop(context);
                                                  }
                                                },
                                                child: Text(
                                                  'Post',
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
              ),
              TodoCard(
                  todoModel: todos[0],
                ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child:  GroupedListView<TodoModal, DateTime>(
                  elements: todos,
                  groupBy: (element) => element.dueDate,
                  scrollDirection: Axis.vertical,
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  groupHeaderBuilder: (element){
                    if(element.dueDate.day ==  DateTime.now().day && element.dueDate.month ==  DateTime.now().month && element.dueDate.year ==  DateTime.now().year)
                      return Text('Today', style: Theme.of(context).textTheme.headline5,);
                    else if(element.dueDate.day ==  DateTime.now().day-1 && element.dueDate.month ==  DateTime.now().month && element.dueDate.year ==  DateTime.now().year) return Text('Yesterday',style: Theme.of(context).textTheme.headline5,);
                     else if(element.dueDate.day <  DateTime.now().day-1 || element.dueDate.month  <  DateTime.now().month || element.dueDate.year <  DateTime.now().year) return Text('hi',style: Theme.of(context).textTheme.headline5,);
                  },
                itemBuilder:(context, index)=> TodoCard(
                  todoModel: index,
                ),
                order: GroupedListOrder.DESC,
                ),
              )
          ],
        ),
      ),)
      );
  }
}