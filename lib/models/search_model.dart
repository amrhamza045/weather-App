class SearchModel {
  String cityName;
  String country;
  double? lat;
  double? lon;

  SearchModel({
    required this.cityName,
    required this.country,
    this.lat,
    this.lon,
  });

  factory SearchModel.fromJson(json) {
    return SearchModel(
      cityName: json['name'],
      country: json['country'],
      lat: json['lat'] ?? '0',
      lon: json['lon'] ?? '0',
    );
  }
}
