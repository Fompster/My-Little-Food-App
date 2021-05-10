class Recipe {
  int id;
  String name;
  String image;

  Recipe({
    this.id,
    this.name,
    this.image,
  });

  Recipe.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    name = json["title"];
    image = json["image"];
  }
}