import 'package:startup_namer/models/ingredients_model.dart';
import 'package:startup_namer/models/recipe_model.dart';

class ToggleIngredientAction {
  final Ingredient ingredient;

  ToggleIngredientAction(this.ingredient);
}

class FetchIngredientsAction {
  final String query;

  FetchIngredientsAction(this.query);
}

class FetchedIngredientsAction {
  final List<Ingredient> ingredients;

  FetchedIngredientsAction(this.ingredients);
}

//Recipe page
class FetchRecipesAction {
  final List<Ingredient> ingredients;

  FetchRecipesAction(this.ingredients);
}

class FetchedRecipesAction {
  final List<Recipe> recipes;

  FetchedRecipesAction(this.recipes);
}