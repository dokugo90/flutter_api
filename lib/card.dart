

import 'package:flutter/material.dart';

class MyCardState extends StatefulWidget {
  const MyCardState({super.key});

@override 
  State<MyCardState> createState() => myCard();
}

class myCard extends State<MyCardState> {

  dynamic finalUsername = "Duke";
  dynamic username = "Duke";

  @override 
  Widget build(BuildContext context) {
    return Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
        child: Card(
          child: Column(
            children: <Widget>[
              Image.network("https://cdn.shopify.com/s/files/1/0306/6419/6141/articles/coding_languages.png?v=1619126283",
              ),
              SizedBox(height: 10,),
              Text('You Posted Yesterday', style: TextStyle(color: Colors.black, fontWeight: FontWeight.w900), textAlign: TextAlign.center,),
              Padding(
                padding: const EdgeInsets.all(16.0),
              ),
              Image.network("https://images.unsplash.com/photo-1615751072497-5f5169febe17?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8Y3V0ZSUyMGRvZ3xlbnwwfHwwfHw%3D&w=1000&q=80",
              ),
              SizedBox(height: 10, ),
              Text('Jojo Posted Yesterday',  style: TextStyle(color: Colors.black, fontWeight: FontWeight.w900), textAlign: TextAlign.center,),
              Padding(
                padding: const EdgeInsets.all(16.0),
              ),
              Image.network("https://images.unsplash.com/photo-1541963463532-d68292c34b19?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxleHBsb3JlLWZlZWR8Mnx8fGVufDB8fHx8&w=1000&q=80",
              ),
              SizedBox(height: 10, ),
              Text('Jojo Posted Yesterday',  style: TextStyle(color: Colors.black, fontWeight: FontWeight.w900), textAlign: TextAlign.center,),
              Padding(
                padding: const EdgeInsets.all(16.0),
              ),
              Image.network("https://images.unsplash.com/photo-1581456495146-65a71b2c8e52?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8OHx8aHVtYW58ZW58MHx8MHx8&w=1000&q=80",
              ),
              SizedBox(height: 10, ),
              Text('Jojo Posted Yesterday',  style: TextStyle(color: Colors.black, fontWeight: FontWeight.w900), textAlign: TextAlign.center,),
              Padding(
                padding: const EdgeInsets.all(16.0),
              )
            ],
          ),
        ),
        ),
        );
  }
}