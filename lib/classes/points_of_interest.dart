// To parse this JSON data, do
//
//     final poi = poiFromJson(jsonString);

import 'dart:convert';

Poi poiFromJson(String str) => Poi.fromJson(json.decode(str));

String poiToJson(Poi data) => json.encode(data.toJson());

class Poi {
  Poi({
    this.poIs,
    this.found,
  });

  List<PoIs> poIs;
  bool found;

  factory Poi.fromJson(Map<String, dynamic> json) => Poi(
    poIs: List<PoIs>.from(json["POIs"].map((x) => PoIs.fromJson(x))),
    found: json["found"],
  );

  Map<String, dynamic> toJson() => {
    "POIs": List<dynamic>.from(poIs.map((x) => x.toJson())),
    "found": found,
  };
}

class PoIs {
  PoIs({
    this.name,
    this.lat,
    this.lon,
    this.category,
  });

  String name;
  double lat;
  double lon;
  Category category;

  factory PoIs.fromJson(Map<String, dynamic> json) => PoIs(
    name: json["name"],
    lat: json["lat"].toDouble(),
    lon: json["lon"].toDouble(),
    category: categoryValues.map[json["category"]],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "lat": lat,
    "lon": lon,
    "category": categoryValues.reverse[category],
  };
}

enum Category { RESTAURANT, SIGHTS, SHOPPING }

final categoryValues = EnumValues({
  "RESTAURANT": Category.RESTAURANT,
  "SHOPPING": Category.SHOPPING,
  "SIGHTS": Category.SIGHTS
});

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
