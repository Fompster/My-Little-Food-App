import 'package:flutter/foundation.dart';
import 'package:startup_namer/widgets/title_cases.dart';

class Ingredient {
  int id;
  String name;
  String image;
  String readableName;

  Ingredient({@required this.id, this.name});

  Ingredient.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    name = json["name"];
    image = json["image"];
    readableName = name.toTitleCase();
  }

  // Will check if the id's are the same for two ingredients
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Ingredient && runtimeType == other.runtimeType && id == other.id;

  @override
  int get hashCode => id.hashCode;
}
