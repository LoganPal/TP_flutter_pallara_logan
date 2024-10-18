import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:tintin/models/album.dart';

class AlbumService {
  static Future<List<Album>> fetchAlbums() async {

    final String response = await rootBundle.loadString('data/albums.json');
    final List<dynamic> data = jsonDecode(response);

    return data.map((json) => Album.fromJson(json)).toList();
  }
}
