import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:todo/pages/home_page.dart';
import 'package:hive_flutter/hive_flutter.dart';


void main() { //async
//   WidgetsFlutterBinding.ensureInitialized();

// // init the hive
// Hive.initFlutter('C:\project_flutter\todo');

// // open a box 
// var box = await Hive.openBox<String>('myBox');


//   runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // ignore: prefer_const_constructors
      home: HomePage(),
      theme: ThemeData(primarySwatch: Colors.yellow),
    );
  }
}