// To parse this JSON data, do
//
//     final safety = safetyFromJson(jsonString);

import 'dart:convert';

Safety safetyFromJson(String str) => Safety.fromJson(json.decode(str));

String safetyToJson(Safety data) => json.encode(data.toJson());

class Safety {
  Safety({
    this.women,
    this.physical,
    this.theft,
    this.political,
    this.lgbtq,
    this.medical,
    this.overall,
    this.found,
  });

  int women;
  int physical;
  int theft;
  int political;
  int lgbtq;
  int medical;
  int overall;
  bool found;

  factory Safety.fromJson(Map<String, dynamic> json) => Safety(
    women: json["women"],
    physical: json["physical"],
    theft: json["theft"],
    political: json["political"],
    lgbtq: json["lgbtq"],
    medical: json["medical"],
    overall: json["overall"],
    found: json["found"],
  );

  Map<String, dynamic> toJson() => {
    "women": women,
    "physical": physical,
    "theft": theft,
    "political": political,
    "lgbtq": lgbtq,
    "medical": medical,
    "overall": overall,
    "found": found,
  };
}
