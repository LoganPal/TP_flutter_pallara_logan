import 'package:flutter/material.dart'; 
import 'package:pomme_poire_ananas/models/fruit_model.dart'; 

class FruitViewModel {
  int _counter = 0;
  List<FruitModel> _fruits = [];

  List<FruitModel> get fruits => _fruits;

  void addFruit() {
    _counter++;
    String imagePath = _getImageForNumber(_counter);
    _fruits.add(FruitModel(_counter, imagePath));
  }

  void removeFruit() {
    if (_fruits.isNotEmpty) {
      _fruits.removeLast();
    }
  }

  bool _isPrime(int number) {
  if (number <= 1) return false;
  for (int i = 2; i <= number ~/ 2; i++) {
    if (number % i == 0) return false;
  }
  return true;
}

  String _getImageForNumber(int number) {
    if (_isPrime(number)) {
      return 'images/ananas.png';
    } else if (number % 2 == 0) {
      return 'images/poire.png';
    } else {
      return 'images/pomme.png';
    }
  }

  Color getBackgroundColor(int number) {
    if (_isPrime(number)) {
      return Colors.green;
    } else if (number % 2 == 0) {
      return Colors.indigo;
    } else {
      return Colors.cyan;
    }
  }


}