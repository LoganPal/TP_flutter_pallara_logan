class Gps {
  final double latitude;
  final double longitude;

  Gps({required this.latitude, required this.longitude});

  factory Gps.fromJson(String gpsString) {
    final coordinates = gpsString.split(',');
    final latitude = double.tryParse(coordinates[0]) ?? 0.0;
    final longitude = double.tryParse(coordinates[1]) ?? 0.0;
    return Gps(latitude: latitude, longitude: longitude);
  }

  @override
  String toString() {
    return 'Gps{latitude: $latitude, longitude: $longitude}';
  }
}
