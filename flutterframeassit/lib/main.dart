import 'dart:async';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutterframeassit/Farm.dart';
import 'package:flutterframeassit/WaterPlants.dart';
import 'package:intl/intl.dart';
import 'package:flutterframeassit/test.dart';

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
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Orchid Care'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final String testaa = '1';
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var screens = [
      FarmScreen(),
      WaterPlantsScreen(),
    ];
  int selectedTab = 0;
  String _timeString;
  
  final DatabaseReference database = FirebaseDatabase.instance.reference().child("Click");
  int _counter = 0;
  
  void _incrementCounter() {
    setState(() {
      _counter++;
      //insert
      database.reference().update({'key'+(_counter).toString() : 'insert'+(_counter).toString()});
      //update
      database.reference().update({'key'+(_counter - 1).toString() : 'update'+(_counter-1).toString()});
      //delete
      database.child('key'+(_counter - 3).toString()).remove();
      //get
      database.child('key'+(_counter).toString()).once().then((DataSnapshot snapshot) {
        print('Data : ${snapshot.value}');
      });
      // database.push().set({'insert' : 'insert'+_counter.toString()});
    });
  }

 @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50), // here the desired height
        child: AppBar(
         title: Text(_timeString),
         backgroundColor: Colors.blue,
         centerTitle: true,
        ),
       ),
      backgroundColor: Color.fromRGBO(38, 81, 158, 1),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.map),
            title: Text('Farm'),
          ),

          BottomNavigationBarItem(
              icon: Icon(Icons.public),
              title: Text("Water Plants"),
          ),
        ],
        onTap: (index){
          setState(() {
            selectedTab = index;
          });
        },
        currentIndex: selectedTab,
        selectedItemColor: Colors.blue,
        showUnselectedLabels: true,
        iconSize: 30,
      ),
      body: screens[selectedTab],
    );
  }

  /////----------------------------------------
  @override
  void initState() {
    _timeString = _formatDateTime(DateTime.now());
    print(_timeString);
    Timer.periodic(Duration(seconds: 1), (Timer t) => _getTime());
    super.initState();
  }

  void _getTime() {
    final DateTime now = DateTime.now();
    final String formattedDateTime = _formatDateTime(now);
    setState(() {
      _timeString = formattedDateTime;
    });
  }

  String _formatDateTime(DateTime dateTime) {
    return DateFormat('hh:mm:ss').format(dateTime);
  }
  /////----------------------------------------

}
