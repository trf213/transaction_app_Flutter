import 'dart:ui';
import 'package:digital_wallet/Models/JournalNotes.dart';
import 'package:digital_wallet/Pages/JournalPage.dart';
import 'package:digital_wallet/Services/NotesProvider.dart';
import 'package:digital_wallet/Services/db.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'dart:math';
import 'package:digital_wallet/Services/db.dart';
import 'package:provider/provider.dart';


class JournalCard extends StatefulWidget {
  JournalCard({Key key}) : super(key: key);

  @override
  _JournalCardState createState() => _JournalCardState();
}

class _JournalCardState extends State<JournalCard> {


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
    Random random = new Random();
    int imageSelected;
  
  @override
  void initState() {
    
    super.initState();
    imageSelected = random.nextInt(images.length);
  }

  @override
  Widget build(BuildContext context) {
    var notes = Provider.of<NotesProvider>(context);

    
    
  
   
    if (notes.notes == null) notes.updateNotes();
    //print(notes.notes);

   
   
    return (notes.notes == null || notes == null)
        ? Container(
            height: 400,
            child: Center(
              child: CircularProgressIndicator(),
            ))
        : CarouselSlider.builder(
            itemCount: notes.notes.length + 1 ?? 1,
            itemBuilder: (context, index) {
             
              if (index == 0)
                return Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 0, vertical: 10),
                  child: Container(
                    padding: EdgeInsets.all(0),
                    height: 400,
                    width: MediaQuery.of(context).size.width,
                    child: GestureDetector(
                      onTap: () {
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
                                                onPressed: () {
                                                  if(_formKey.currentState.validate()){
                                                    notes.addNotes(JournalNotes(
                                                      contents:
                                                          _controller.text));
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
                      child: Card(
                          elevation: 5,
                          color: Theme.of(context).accentColor,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'A safe place to express your thoughts.',
                                style: TextStyle(
                                  fontSize: Theme.of(context)
                                      .textTheme
                                      .subtitle1
                                      .fontSize,
                                  color: Colors.white,
                                ),
                                textAlign: TextAlign.center,
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Icon(
                                  LineAwesomeIcons.plus_circle,
                                  size: 50,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          )),
                    ),
                  ),
                );
              else
                return Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 0, vertical: 10),
                  child: GestureDetector(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>JournalPage(journalNotes: notes.notes[index-1], selectedImage: imageSelected,)));
                    },
                                      child: Container(
                      padding: EdgeInsets.all(0),
                      height: 400,
                      width: MediaQuery.of(context).size.width,
                      child: Card(
                        elevation: 5,
                        color: Colors.black45,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Stack(
                            fit: StackFit.expand,
                            children: [
                              Opacity(
                                opacity: 0.7,
                                child: Image.asset(
                                  images[imageSelected],
                                  fit: BoxFit.cover,
                                ),
                              ),
                             
                              Align(
                                  alignment: Alignment.center,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      notes.notes[index-1].contents ?? '',
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
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                );
            },
            options: CarouselOptions(
                viewportFraction: 0.8,
                height: 400,
                enlargeCenterPage: true,
                autoPlay: false,
                enableInfiniteScroll: true,
                reverse: false));
  }
}


