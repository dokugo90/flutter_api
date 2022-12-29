import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'dart:html';
import 'dart:ui';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:sample/drawer.dart';
import 'dart:convert';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  dynamic url = "https://jsonplaceholder.typicode.com/todos/1";
  dynamic otherUrl = "https://jsonplaceholder.typicode.com/comments";
  var data;

  @override
  void initState() {
    super.initState();
    fetchData();
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
      backgroundColor: Colors.white,
      appBar: AppBar(   
        title: Text("Blog Post", style: TextStyle(color: Colors.black, fontWeight: FontWeight.w900, fontSize: 20), textAlign: TextAlign.center,),
      ),
      body: data != null ? 
      ListView.builder(
        itemBuilder: (context, index) {
          return ListTile(
            onTap: () {},
            hoverColor: Colors.grey,
            title: Text(data[index]["name"], style: TextStyle(color: Colors.white),),
            subtitle: Text(data[index]["email"].toString(), style: TextStyle(color: Colors.white)),
            trailing: Icon(Icons.ads_click, color: Colors.white,),
            leading:  Image.network("https://images.unsplash.com/photo-1571366657764-16ca342d3284?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8cmFpbnklMjBzdHJlZXR8ZW58MHx8MHx8&w=1000&q=80"),
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