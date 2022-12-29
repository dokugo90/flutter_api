import 'dart:html';
import 'dart:ui';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:sample/drawer.dart';
import 'dart:convert';

import 'package:sample/home_page.dart';
import 'package:sample/main.dart';
import 'package:sample/utils/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});
  static const String routeName = "/login";

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  final formKey = GlobalKey<FormState>();
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  String username = "";
  dynamic password = "";
  dynamic email = "";
  dynamic job = "";
  dynamic imageUrl = "";

  Future change() async {
     final SharedPreferences prefs = await SharedPreferences.getInstance();
     prefs.setBool("loggedIn", true);
  }

  Future handleUser() async {
    final SharedPreferences name = await SharedPreferences.getInstance();
    name.setString("username", username);
    name.setString("email", email);
    name.setString("job", job);
    name.setString("image", imageUrl);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login Page")
        ),
        body: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            Image.network("https://images.unsplash.com/photo-1532249991072-89f3389e8e80?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTZ8fHJhaW55JTIwbmlnaHR8ZW58MHx8MHx8&w=1000&q=80", fit: BoxFit.cover,),
            Center(
           child: Padding(
              padding: EdgeInsets.all(16.0),
            child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Center(
              child: Card(
                color: Colors.transparent,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
            child: Column(
            children: <Widget>[
              TextFormField(
                controller: _usernameController,
                onChanged: (value) {
                  setState(() {
                    username = value;
                  });
                },
                keyboardType: TextInputType.text,
                cursorColor: Colors.white,
                style: TextStyle(color: Colors.white),
                maxLength: 15,
                decoration: InputDecoration(
                  fillColor: Colors.white,
                  focusColor: Colors.white,
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                  labelText: "Username",
                  hintText: "Enter Username",
                  hintStyle: TextStyle(color: Colors.white),
                  labelStyle: TextStyle(color: Colors.white)
                ),
              ),
              Padding(padding: EdgeInsets.all(16)),
              TextFormField(
                onChanged: (value) {
                  setState(() {
                    email = value;
                  });
                },
                keyboardType: TextInputType.emailAddress,
                obscureText: false,
                cursorColor: Colors.white,
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  fillColor: Colors.white,
                  focusColor: Colors.white,
                    hintText: "Enter Email",
                    labelText: "Email",
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                    hintStyle: TextStyle(color: Colors.white),
                  labelStyle: TextStyle(color: Colors.white)
                ),
              ),
              Padding(padding: EdgeInsets.all(16)),
              TextFormField(
                onChanged: (value) {
                  setState(() {
                    job = value;
                  });
                },
                keyboardType: TextInputType.text,
                obscureText: false,
                cursorColor: Colors.white,
                style: TextStyle(color: Colors.white),
                maxLength: 30,
                decoration: InputDecoration(
                  fillColor: Colors.white,
                  focusColor: Colors.white,
                    hintText: "Enter Job",
                    labelText: "Job",
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                    hintStyle: TextStyle(color: Colors.white),
                  labelStyle: TextStyle(color: Colors.white)
                ),
              ),
              Padding(padding: EdgeInsets.all(16)),
              TextFormField(
                onChanged: (value) {
                  setState(() {
                    imageUrl = value;
                  });
                },
                keyboardType: TextInputType.url,
                obscureText: false,
                cursorColor: Colors.white,
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  fillColor: Colors.white,
                  focusColor: Colors.white,
                    hintText: "Enter Image Url",
                    labelText: "Image",
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                    hintStyle: TextStyle(color: Colors.white),
                  labelStyle: TextStyle(color: Colors.white)
                ),
              ),
              Padding(padding: EdgeInsets.all(16)),
              TextFormField(
                controller: _passwordController,
                keyboardType: TextInputType.text,
                obscureText: true,
                style: TextStyle(color: Colors.white),
                cursorColor: Colors.white,
                decoration: InputDecoration(
                  fillColor: Colors.white,
                  focusColor: Colors.white,
                    hintText: "Enter Password",
                    labelText: "Password",
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                    hintStyle: TextStyle(color: Colors.white),
                  labelStyle: TextStyle(color: Colors.white)
                ),
              ),
              SizedBox(height: 20,),
              OutlinedButton(
                onPressed:() {
                  change(); 
                  handleUser();
                  /*Navigator.push(context, MaterialPageRoute(builder: (context) => myHomePage()));*/
                  Navigator.pushNamed(context, myHomePage.routeName);
                },
                child: Text("Sign In"),
                )
            ]
            ),
            ),
              ),
            ),
          )
        ),
        ),
          ),
          ],
        )
    );
  }
}