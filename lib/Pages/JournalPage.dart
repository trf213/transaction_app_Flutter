import 'package:digital_wallet/Models/JournalNotes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:digital_wallet/Services/NotesProvider.dart';
class JournalPage extends StatelessWidget {
JournalNotes journalNotes;
int selectedImage;
 JournalPage({Key key,@required this.journalNotes,@required this.selectedImage}) : super(key: key);
List<String> images = [
      'assets/City.jpg',
      'assets/Mountain.jpg',
      'assets/Sky.jpg',
      'assets/nightmountain.jpg',
      'assets/cliff.jpg',
      'assets/storm.jpg',
      'assets/undewater.jpg',
      'assets/waves.jpg',
    ];
  @override
  Widget build(BuildContext context) {
    var notes = Provider.of<NotesProvider>(context);

    return Scaffold(
      backgroundColor: Colors.black87,
      
      body: SafeArea(
        top: false,
        bottom: false,
              child: Stack(
          fit: StackFit.expand,
          children: [
              Opacity(
                opacity: 0.8,
                                    child: Image.asset(
                              images[selectedImage],
                              fit: BoxFit.cover,
                            ),
              ),
                       Padding(
                         padding: const EdgeInsets.only(top:50),
                         child: Align(
                              alignment: Alignment.topLeft,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: BackButton(color: Colors.white,),
                              )),
                       ),
                            Padding(
                              padding: const EdgeInsets.only(top:50),
                              child: Align(
                              alignment: Alignment.topRight,
                              child: Padding(
                                padding: const EdgeInsets.all(0.0),
                                child: ButtonBar(
                                  children: [
                                    IconButton(icon: Icon(Icons.delete, color: Colors.white, size: 30,), onPressed: () async{
                                      await notes.deleteNotes(journalNotes);
                                      Navigator.pop(context);
                                    }),
                                     IconButton(icon: Icon(Icons.edit, color: Colors.white,size: 30), 
                                     onPressed: ()async{
                                       final _controller = TextEditingController();
                                       _controller.text = journalNotes.contents.toString();
                  final _formKey =GlobalKey<FormState>();
                  await showModalBottomSheet(
                      context: context,
                      isScrollControlled: true,
                      builder: (BuildContext context) {
                        return SingleChildScrollView(
                          child: Container(
                                padding: EdgeInsets.only(
                                        bottom: MediaQuery.of(context)
                                            .viewPadding.bottom +  MediaQuery.of(context)
                                            .viewInsets.bottom),
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
                                            'What\'s on your mind today?',
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
                                                      'Write what\'s on your mind...',
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
                                            onPressed: ()async{
                                              if(_formKey.currentState.validate()){
                                                journalNotes.contents= _controller.text;
                                                await notes.updateNote(journalNotes);
                                                Navigator.pop(context);
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
                                     }),
                                  ],
                                ),
                              )),
                            ),
                        Align(
                            alignment: Alignment.center,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                journalNotes.contents?? '',
                                style: TextStyle(
                                    fontSize: Theme.of(context)
                                        .textTheme
                                        .headline5
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