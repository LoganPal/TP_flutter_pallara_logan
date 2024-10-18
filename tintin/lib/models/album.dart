import 'package:tintin/models/gps.dart';

class Album {
  final String title;
  final int numero;
  final int year;
  final int? yearInColor;
  final String image;
  final String resume;
  final Gps gps;
  final String location;

  Album({required this.title, required this.numero, required this.year, required this.yearInColor, required this.image, required this.resume, required this.gps, required this.location,});

  factory Album.fromJson(Map<String, dynamic> json) {
    return Album(
      title: json['title']  ?? '',
      numero: json['numero'] ?? 0,
      year: json['year'] ?? 0,
      yearInColor: json['yearInColor'] ?? 0,
      image: json['image'] ?? '',
      resume: json['resume'] ?? '',
      gps: Gps.fromJson(json['gps']),
      location: json['location'] ?? '',
    );
  }
}
