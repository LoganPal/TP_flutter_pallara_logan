import 'package:flutter/material.dart';
import 'package:pomme_poire_ananas/viewmodels/fruit_viewmodel.dart';

class FruitView extends StatefulWidget {
  @override
  _FruitViewState createState() => _FruitViewState();
}

class _FruitViewState extends State<FruitView> {
  final FruitViewModel viewModel = FruitViewModel();

  void _showFruitDialog(int index) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        final fruit = viewModel.fruits[index];
        return AlertDialog(
          backgroundColor: viewModel.getBackgroundColor(fruit.number),
          title: 
          Text('Voulez-vous supprimer le fruit ${fruit.number} ?',
          style: const TextStyle(color : Colors.white),
          ),
          content: Image.asset(fruit.imagePath),
          actions: <Widget>[
            TextButton(
              child: Text('Annuler',
              style: const TextStyle(color : Colors.white),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text('Supprimer',
              style: const TextStyle(color : Colors.white),
              ),
              onPressed: () {
                setState(() {
                  viewModel.fruits.removeAt(index);
                  Navigator.of(context).pop(); 
                });
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Marchant de Fruit Mathématicien'),
      ),
      body: ListView.builder(
        itemCount: viewModel.fruits.length,
        itemBuilder: (context, index) {
          final fruit = viewModel.fruits[index];
          return GestureDetector(
            onTap: () {
              _showFruitDialog(index); 
            },
            child: Container(
              color: viewModel.getBackgroundColor(fruit.number),
              child: ListTile(
                leading: Image.asset(fruit.imagePath),
                title: Text('Nombre ${fruit.number}'),
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            viewModel.addFruit(); 
          });
        },
        tooltip: 'Ajouter Fruit',
        child: Icon(Icons.add),
      ),
    );
  }
}
