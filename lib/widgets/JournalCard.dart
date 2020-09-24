import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

class JournalCard extends StatelessWidget {
  const JournalCard({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<String> images = [
      'assets/City.jpg',
      'assets/Mountain.jpg',
      'assets/Sky.jpg'
    ];
    return CarouselSlider.builder(
        itemCount: 4,
        itemBuilder: (context, index) {
          if (index == 0)
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 10),
              child: Container(
                padding: EdgeInsets.all(0),
                height: 400,
                width: MediaQuery.of(context).size.width,
                child: GestureDetector(
                  onTap: () => addJournal(context),
                  child: Card(
                      elevation: 5,
                      color: Theme.of(context).accentColor,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'A safe place to express your thoughts.',
                            style: Theme.of(context).textTheme.subtitle1,
                            textAlign: TextAlign.center,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Icon(
                              LineAwesomeIcons.plus_circle,
                              size: 50,
                            ),
                          ),
                        ],
                      )),
                ),
              ),
            );
          else
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 10),
              child: Container(
                padding: EdgeInsets.all(0),
                height: 400,
                width: MediaQuery.of(context).size.width,
                child: Card(
                  elevation: 5,
                  color: Colors.black26,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Stack(
                      fit: StackFit.expand,
                      children: [
                        Opacity(
                          opacity: 0.7,
                          child: Image.asset(
                            images[index - 1],
                            fit: BoxFit.cover,
                          ),
                        ),
                        Align(
                            alignment: Alignment.center,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                'A safe place to express your thoughts.',
                                style: Theme.of(context).textTheme.subtitle1,
                                textAlign: TextAlign.center,
                              ),
                            ))
                      ],
                    ),
                  ),
                ),
              ),
            );
        },
        options: CarouselOptions(
            height: 400,
            enlargeCenterPage: true,
            autoPlay: false,
            enableInfiniteScroll: false));

    /*  */
  }

  void addJournal(BuildContext context) {
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
                                child: Text('Post'),
                              ),
                            ),
                          ]),
                        )
                        
                ),
            
           
          );
        });
  }
}
