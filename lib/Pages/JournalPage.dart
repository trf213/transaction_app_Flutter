import 'package:digital_wallet/Models/JournalNotes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:digital_wallet/Services/NotesProvider.dart';
class JournalPage extends StatelessWidget {
JournalNotes journalNotes;
 JournalPage({Key key,@required this.journalNotes}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var notes = Provider.of<NotesProvider>(context);
    return Scaffold(
    
      body: SafeArea(
              child: Stack(
                fit: StackFit.expand,
                children: [
                    Image.asset(
                                  'assets/City.jpg',
                                  fit: BoxFit.cover,
                                ),
                             Align(
                                  alignment: Alignment.topLeft,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: BackButton(color: Colors.white,),
                                  )),
                                  Align(
                                  alignment: Alignment.topRight,
                                  child: Padding(
                                    padding: const EdgeInsets.all(0.0),
                                    child: ButtonBar(
                                      children: [
                                        IconButton(icon: Icon(Icons.delete, color: Colors.white, size: 30,), onPressed: () async{
                                          await notes.deleteNotes(journalNotes);
                                          Navigator.pop(context);
                                        }),
                                         IconButton(icon: Icon(Icons.edit, color: Colors.white,size: 30), onPressed: (){}),
                                      ],
                                    ),
                                  )),
                              Align(
                                  alignment: Alignment.center,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      journalNotes.contents?? '',
                                      style: TextStyle(
                                          fontSize: Theme.of(context)
                                              .textTheme
                                              .subtitle1
                                              .fontSize,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white),
                                      textAlign: TextAlign.center,
                                      
                                    ),
                                  ))
        ],),
      ),
    );
  }
}