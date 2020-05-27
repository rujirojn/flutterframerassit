import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutterframeassit/Farm.dart';
import 'package:flutterframeassit/WaterPlants.dart';

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
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Orchid Care'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  final DatabaseReference database = FirebaseDatabase.instance.reference().child("Click");

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

  var screens = [
      FarmScreen(),
      WaterPlantsScreen(),
    ];

  int selectedTab = 0;

 @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(38, 81, 158, 1),
      bottomNavigationBar: BottomNavigationBar(
        
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.map),
            title: Text("Farm"),
            
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
}

class EffectTab {
}