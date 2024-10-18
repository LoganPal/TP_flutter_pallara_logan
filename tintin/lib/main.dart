import 'package:flutter/material.dart';
import 'package:tintin/screens/albums_master.dart'; 

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tintin Albums',
      theme: ThemeData(
        brightness: Brightness.dark, 
        primarySwatch: Colors.red,   
      ),
      home: AlbumsMaster(), 
    );
  }
}
