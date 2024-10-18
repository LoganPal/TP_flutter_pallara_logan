import 'package:flutter/material.dart';
import 'package:tintin/models/album.dart';

class AlbumDetails extends StatelessWidget {
  final Album album;

  AlbumDetails({required this.album});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(album.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView( 
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              album.image.isNotEmpty
                  ? Image.asset(album.image, width: 200, height: 300, fit: BoxFit.cover)
                  : Text('Image non disponible'),
              SizedBox(height: 20),
              Text('Titre : ${album.title}', style: TextStyle(fontSize: 22)),
              Text('Numéro : ${album.numero}', style: TextStyle(fontSize: 18)),
              Text('Année de parution : ${album.year}', style: TextStyle(fontSize: 18)),
              Text('Année en couleur : ${album.yearInColor}', style: TextStyle(fontSize: 18)),
              SizedBox(height: 20),
              Text(
                'Description :',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Text(
                album.resume, 
                style: TextStyle(fontSize: 16),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
