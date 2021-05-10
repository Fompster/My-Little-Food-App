import 'package:startup_namer/models/recipe_model.dart';

class RecipesState {
  final List<Recipe> recipes;

  // Checks that the values that are passed through are not null
  RecipesState({this.recipes,})
      : assert(recipes != null);
}