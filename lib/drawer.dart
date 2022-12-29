import 'dart:html';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:sample/login.dart';
import 'package:shared_preferences/shared_preferences.dart';

 class MyDrawer extends StatefulWidget {

  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  dynamic userName = "User";
  dynamic email = "example@gmail.com";
  dynamic job = "Developer";
  dynamic imageUrl = "https://pbs.twimg.com/media/FiMJQIEXoAA8W3W.jpg";
  bool showDetails = false;
  dynamic likes = 10;
  dynamic bookmarks = 20;
  dynamic read = 20;

  @override
  void initState() {
    super.initState();
    getUser();
  } 

  Future getUser() async {
    final SharedPreferences name = await SharedPreferences.getInstance();
    final SharedPreferences content = await SharedPreferences.getInstance();
    setState(() {
      userName = name.getString("username");
      email = name.getString("email");
      job = name.getString("job");
      imageUrl = name.getString("image");
      likes = content.getInt("likes");
      bookmarks = content.getInt("bookmarks");
      read = content.getInt("read");
    });
  }

  @override 
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.black,
        child: showDetails == true ?
        ListView(
          children: <Widget>[
            
              UserAccountsDrawerHeader(accountName: Text('$userName'), accountEmail: Text('$email'),
              currentAccountPicture: CircleAvatar(
                backgroundImage: NetworkImage('$imageUrl'),
              ),
              decoration: BoxDecoration(color: Colors.black),
              onDetailsPressed: () {
                 if (showDetails == false) {
                  setState(() {
                    showDetails = true;
                  });
                } else {
                  setState(() {
                    showDetails = false;
                  });
                }
              },
              ),
            
            ListTile(
              onTap: () {
                Navigator.pushNamed(context, LoginPage.routeName);
              },
              hoverColor: Colors.grey,
              leading: Icon(Icons.person, color: Colors.white),
              title: Text('$userName', style: TextStyle(color: Colors.white)),
              subtitle: Text('$job', style: TextStyle(color: Colors.white)),
              trailing: Icon(Icons.edit, color: Colors.white),
            ),
            ListTile(
              onTap: () {
                Navigator.pushNamed(context, LoginPage.routeName);
              },
              hoverColor: Colors.grey,
              leading: Icon(Icons.email, color: Colors.white),
              title: Text("Email", style: TextStyle(color: Colors.white),),
              subtitle: Text('$email', style: TextStyle(color: Colors.white)),
              trailing: Icon(Icons.edit, color: Colors.white),
            ),
            Padding(padding: EdgeInsets.all(8.0)),
            Text("Friends (6)", style: TextStyle(fontWeight: FontWeight.w600, fontSize: 15, color: Colors.white), textAlign: TextAlign.center, ), 
            Padding(padding: EdgeInsets.all(8.0)),
            ListTile(
              onTap: () {},
              hoverColor: Colors.grey,
              leading: Icon(Icons.person, color: Colors.white),
              title: Text("Jojo Amfo Sackey", style: TextStyle(color: Colors.white)),
              subtitle: Text("Friend", style: TextStyle(color: Colors.white)),
              trailing: Icon(Icons.delete, color: Colors.white),
            ),
            ListTile(
              onTap: () {},
              hoverColor: Colors.grey,
              leading: Icon(Icons.person, color: Colors.white),
              title: Text("Lankai", style: TextStyle(color: Colors.white)),
              subtitle: Text("Friend", style: TextStyle(color: Colors.white)),
              trailing: Icon(Icons.delete, color: Colors.white),
            ),
            ListTile(
              onTap: () {},
              hoverColor: Colors.grey,
              leading: Icon(Icons.person, color: Colors.white),
              title: Text("Andy Kafui", style: TextStyle(color: Colors.white)),
              subtitle: Text("Friend", style: TextStyle(color: Colors.white)),
              trailing: Icon(Icons.delete, color: Colors.white),
            ),
            ListTile(
              onTap: () {},
              hoverColor: Colors.grey,
              leading: Icon(Icons.person, color: Colors.white),
              title: Text("Joel Jones", style: TextStyle(color: Colors.white)),
              subtitle: Text("Friend", style: TextStyle(color: Colors.white)),
              trailing: Icon(Icons.delete, color: Colors.white),
            ),
            ListTile(
              onTap: () {},
              hoverColor: Colors.grey,
              leading: Icon(Icons.person, color: Colors.white,),
              title: Text("Nene", style: TextStyle(color: Colors.white)),
              subtitle: Text("Friend", style: TextStyle(color: Colors.white)),
              trailing: Icon(Icons.delete, color: Colors.white),
            ),
            ListTile(
              onTap: () {},
              hoverColor: Colors.grey,
              leading: Icon(Icons.person, color: Colors.white),
              title: Text("Emma", style: TextStyle(color: Colors.white)),
              subtitle: Text("Friend", style: TextStyle(color: Colors.white)),
              trailing: Icon(Icons.delete, color: Colors.white),
            ),
          ],
        )
        : ListView( 
          children: <Widget>[
            UserAccountsDrawerHeader(accountName: Text('$userName'), accountEmail: Text('$email'),
              currentAccountPicture: CircleAvatar(
                backgroundImage: NetworkImage('$imageUrl'),
              ),
              decoration: BoxDecoration(color: Colors.black),
              onDetailsPressed: () {
                if (showDetails == false) {
                  setState(() {
                    showDetails = true;
                  });
                } else {
                  setState(() {
                    showDetails = false;
                  });
                }
                  
              },
              ),
              ListTile(
                onTap: () {},
              hoverColor: Colors.grey,
              leading: Icon(Icons.book, color: Colors.white),
              title: Text("Your Post", style: TextStyle(color: Colors.white)),
              subtitle: Text("0 Post", style: TextStyle(color: Colors.white)),
              trailing: Icon(Icons.add, color: Colors.white),
              ),
              ListTile(
                onTap: () {},
              hoverColor: Colors.grey,
              leading: Icon(Icons.heart_broken, color: Colors.white),
              title: Text("All Liked Blog Post", style: TextStyle(color: Colors.white)),
              subtitle: Text("$likes Liked Post", style: TextStyle(color: Colors.white)),
              ),
              ListTile(
                onTap: () {},
              hoverColor: Colors.grey,
              leading: Icon(Icons.bookmark, color: Colors.white),
              title: Text("All Bookmarked Blog Post", style: TextStyle(color: Colors.white)),
              subtitle: Text("$bookmarks Bookmarked Post", style: TextStyle(color: Colors.white)),
              ),
              ListTile(
                onTap: () {},
              hoverColor: Colors.grey,
              leading: Icon(Icons.library_books, color: Colors.white),
              title: Text("All Read Blog Post", style: TextStyle(color: Colors.white)),
              subtitle: Text("$read Read Post", style: TextStyle(color: Colors.white)),
              ),
              Padding(padding: EdgeInsets.all(8.0)),
              Text("Settings", style: TextStyle(color: Colors.white, fontSize: 20), textAlign: TextAlign.center,),
              Padding(padding: EdgeInsets.all(8.0)),
              ListTile(
                onTap: () {},
              hoverColor: Colors.grey,
              leading: Icon(Icons.settings, color: Colors.white),
              title: Text("Settings", style: TextStyle(color: Colors.white)),
              ),
              Padding(padding: EdgeInsets.all(6.5)),
              ListTile(
                onTap: () {},
              hoverColor: Colors.grey,
              leading: Icon(Icons.dark_mode, color: Colors.white),
              title: Text("Dark Mode", style: TextStyle(color: Colors.white)),
              trailing: Icon(Icons.edit, color: Colors.white,),
              ),
          ],
        )
      );
  } 
}