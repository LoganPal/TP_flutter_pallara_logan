import 'package:flutter/material.dart';
import 'package:tintin/models/album.dart';
import 'package:tintin/screens/album_details.dart';

class AlbumPreview extends StatelessWidget {
  final Album album;

  AlbumPreview({required this.album});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.black54,
      margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      child: ListTile(
        leading: ClipRRect(
          borderRadius: BorderRadius.circular(8.0),
          child: album.image.isNotEmpty
              ? Image.asset(album.image, width: 50, height: 50, fit: BoxFit.cover)
              : Text('Image non disponible', style: TextStyle(color: Colors.white)),
        ),
        title: Text(
          album.title,
          style: TextStyle(color: Colors.white),
          overflow: TextOverflow.ellipsis, 
        ),
        trailing: Icon(Icons.search, color: Colors.grey), 
        onTap: () {
        
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AlbumDetails(album: album),
            ),
          );
        },
      ),
    );
  }
}
