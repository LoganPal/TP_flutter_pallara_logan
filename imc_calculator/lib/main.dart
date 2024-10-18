import 'package:flutter/material.dart';
import 'package:imc_calculator/views/BMIForm.dart';

void main() {
  runApp(MyApp());
}

const title = 'Calculateur IMC';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculateur IMC',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const BMIForm(),  
    );
  }
}
