import 'dart:math';
import 'package:flutter/material.dart';
import 'package:casino/models/casino_model.dart';  

class MyCasino extends StatefulWidget {
  const MyCasino({super.key, required this.title});

  final String title;

  @override
  State<MyCasino> createState() => _MyCasinoState();
}

class _MyCasinoState extends State<MyCasino> {
  CasinoRandom casinoRandom = CasinoRandom();

  var _RandomRight = CasinoRandom().RandomRight;  
  var _RandomCenter = CasinoRandom().RandomCenter;
  var _RandomLeft = CasinoRandom().RandomLeft;

  var _message = CasinoRandom().message;

  void _incrementRandom() {
    setState(() {
      _RandomRight = Random().nextInt(7) + 1;  
      _RandomCenter = Random().nextInt(7) + 1;
      _RandomLeft = Random().nextInt(7) + 1;

      _ShowTextWin(); 
    });
  }

  void _ShowTextWin() {
    String message;

    if (_RandomRight == 7 && _RandomCenter == 7 && _RandomLeft == 7) {
      message = 'BIG Jackpot !';
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('BIG Jackpot !'),
            content: Text('You won the BIG JACKPOT !'),
            actions: <Widget>[
              TextButton(
                child: Text('OK'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    } else if (_RandomRight == _RandomCenter && _RandomCenter == _RandomLeft) {
      message = 'Jackpot !';
    } else {
      message = 'You lost, try again !';
    }

    setState(() {
      _message = message;
    });
  }

    String _getImageForNumber(int number) {

    if (number == 1) {
      
      return 'lib/images/bar.png';
    } else if (number == 2) {
      return 'lib/images/cerise.png';
    } else if (number == 3) {
      return 'lib/images/cloche.png';
    } else if (number == 4) {
      return 'lib/images/diamant.png';
    } else if (number == 5) {
      return 'lib/images/fer-a-cheval.png';
    } else if (number == 6) {
      return 'lib/images/pasteque.png';
    } else if (number == 7) {
      return 'lib/images/sept.png';
    } else {
      return '';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Casino',
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image.asset(
                  _getImageForNumber(_RandomLeft),
                  width: 50,
                  height: 50,
                ),
                SizedBox(width: 10),
                Image.asset(
                  _getImageForNumber(_RandomCenter),
                  width: 50,
                  height: 50,
                ),
                SizedBox(width: 10),
                Image.asset(
                  _getImageForNumber(_RandomRight),
                  width: 50,
                  height: 50,
                ),
              ],
            ),
            SizedBox(height: 20),
            Text(
              _message,  // Affiche le message de victoire ou de défaite
              style: TextStyle(fontSize: 24, color: Colors.red),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementRandom,
        tooltip: 'Increment',
        child: Text('Jouez !'),
      ),
    );
  }
}
