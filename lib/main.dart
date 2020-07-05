import 'package:flutter/material.dart';
import 'package:hackation/pages/home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        fontFamily: "OpenSans",
        primaryColor: Colors.deepPurpleAccent,
        canvasColor: Colors.deepPurpleAccent//Changing this will change the color of the TabBar
      ),
      home: Home(index: 1,),
    );
  }
}
