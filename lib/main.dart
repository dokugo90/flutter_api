import 'dart:html';
import 'dart:io';
import 'dart:ui';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:sample/drawer.dart';
import 'package:sample/home_page.dart';
import 'dart:convert';

import 'package:sample/login.dart';
import 'package:sample/utils/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  runApp(MaterialApp(
    home: prefs.getBool("loggedIn") == true ? myHomePage() : LoginPage(),
    debugShowCheckedModeBanner: false,
    theme: ThemeData( 
      primarySwatch: Colors.blue,
     ),
     routes: {
      LoginPage.routeName: (context) => LoginPage(),
      myHomePage.routeName:(context) => myHomePage(),
     },
  ));
}

class myHomePage extends StatefulWidget {
  const myHomePage({super.key}); 
  static const String routeName = "/home";

  @override
  State<myHomePage> createState() => _myHomePageState();
}

class _myHomePageState extends State<myHomePage> {

  dynamic url = "https://jsonplaceholder.typicode.com/todos/1";
  dynamic otherUrl = "https://jsonplaceholder.typicode.com/comments";
  var data;
  dynamic userName = "User";
  int likes = 0;
  int bookmarks = 0;
  int read = 0;

  Future change() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool("loggedIn", false);
  }

  @override
  void initState() {
    super.initState();
    fetchData();
    setContent();
  } 

  Future getUser() async {
    final SharedPreferences name = await SharedPreferences.getInstance();
    setState(() {
      userName = name.getString("username");
    });
  }

  Future setContent() async {
    final SharedPreferences content = await SharedPreferences.getInstance();
    content.setInt("likes", likes);
    content.setInt("bookmarks", bookmarks);
    content.setInt("read", read);
  }

   fetchData() async {
    var res = await http.get(Uri.parse(otherUrl));

    if (res.statusCode == 200) {
      setState(() {
        data = jsonDecode(res.body);
      });
    } else {
      setState(() {
        data = [
          {
            "title": "Failed Fetching Data",
          }
        ];
      });
    }
    //data = jsonDecode(res.body);
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override 
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(   
        title: Text("Blog Post", style: TextStyle(color: Colors.black, fontWeight: FontWeight.w900, fontSize: 20), textAlign: TextAlign.center,),
        actions: <Widget>[
          IconButton(
            onPressed: (() {
                change();
                Navigator.pushNamed(context, LoginPage.routeName);
            }), 
          icon: Icon(Icons.exit_to_app))
        ],
      ),
      body: data != null ? 
      ListView.builder(
        itemBuilder: (context, index) {
          return GestureDetector(
            onDoubleTap: () {
              setState(() {
                likes++;
                setContent();
              });
            },
            onSecondaryLongPressEnd: (details) {
              setState(() {
                bookmarks++;
                setContent();
              });
            },
            child: ListTile(
              onTap: () {
                setState(() {
                  read++;
                   setContent();
                });
              },
              hoverColor: Colors.grey,
              title: Text(data[index]["name"], style: TextStyle(color: Colors.white),),
              subtitle: Text(data[index]["email"].toString(), style: TextStyle(color: Colors.white)),
              trailing: Icon(Icons.ads_click, color: Colors.white,),
              leading:  Icon(Icons.book, color: Colors.white,),
            ),
          );
        },
        itemCount: data.length,
      )
      : Center(
        child: CircularProgressIndicator(strokeWidth: 5.0,),
      ),
      drawer: MyDrawer(),
      floatingActionButton: FloatingActionButton(
        onPressed: fetchData,
        tooltip: "Refresh",
        child: Icon(Icons.refresh),),
    );
  }
}

class SavedWidgets extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /* 
      height: 600,
        margin: EdgeInsets.only(
          top: 0,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(0),
          gradient: LinearGradient(colors: [
            Colors.black,
            Colors.black
          ])
        ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
        padding: EdgeInsets.all(20),
        width: 250,
        height: 300,
        clipBehavior: Clip.antiAlias,
        alignment: Alignment.bottomCenter,
        child: Text("Last Week", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w900, color: Colors.white, shadows: [Shadow(color: Colors.black, blurRadius: 10)]), textAlign: TextAlign.center,),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.red,
          gradient: LinearGradient(
            colors: [
              Colors.pink,
              Colors.blue
            ]
          ),
          image: DecorationImage(
            image: NetworkImage("https://images.unsplash.com/photo-1615751072497-5f5169febe17?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8Y3V0ZSUyMGRvZ3xlbnwwfHwwfHw%3D&w=1000&q=80"),
            fit: BoxFit.cover,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.grey,
              blurRadius: 5
            )
          ]
        ),
      ),
      Container(
        padding: EdgeInsets.all(20),
        width: 250,
        height: 300,
        clipBehavior: Clip.antiAlias,
        alignment: Alignment.bottomCenter,
        child: Text("This Week", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w900, color: Colors.white, shadows: [Shadow(color: Colors.black, blurRadius: 10)]), textAlign: TextAlign.center,),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage("https://images.unsplash.com/photo-1572108882288-fd62a28f42c8?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1yZWxhdGVkfDE5fHx8ZW58MHx8fHw%3D&w=1000&q=80"),
            fit: BoxFit.cover,
          ),
          borderRadius: BorderRadius.circular(10),
          color: Colors.red,
          gradient: LinearGradient(
            colors: [
              Colors.purple,
              Colors.red
            ]
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.grey,
              blurRadius: 5
            )
          ]
        ),
      ),
        ],
        )
      */
    );
  }
}

/*void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  dynamic essay = "";

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ListView(
        shrinkWrap: true,
        padding: const EdgeInsets.fromLTRB(2.0, 10.0, 2.0, 10.0),
          children: <Widget>[
           GestureDetector(
            onTap: () => setState(() {
                _counter ++;
            }),
              child: Container(
                child: Text(
                  '$essay'
                ),
            width: 0,
            height: 250,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(0), color: Colors.blue),
          )),
          TextField(
            decoration: InputDecoration(
              labelText: "Enter your text",
            ),
            onChanged: ((value) {
              setState(() {
                essay = value;
              });
            }),
          )
          ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}*/
