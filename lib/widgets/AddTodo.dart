import 'package:flutter/material.dart';

class AddTodo extends StatelessWidget {
  Function onTap;
  AddTodo({Key key, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: onTap,
        child: Card(
          color: Theme.of(context).accentColor,
          elevation: 5,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListTile(
              title: Text(
                'Add',
                style: TextStyle(color: Colors.white, fontSize: Theme.of(context).textTheme.headline6.fontSize),
              ),
              leading: Icon(Icons.add, size: 35, color: Colors.white,),
            ),
          ),
        ),
      ),
    );
  }
}
