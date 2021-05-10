import 'package:startup_namer/models/ingredients_model.dart';

typedef void ToggleIngredient(Ingredient ingredient);

class IngredientsState {
  final List<Ingredient> ingredients;
  final List<Ingredient> selectedIngredients;
  // final IngredientsService ingredientsService;

  // Checks that the values that are passed through are not null
  IngredientsState({this.ingredients, this.selectedIngredients,})
      : assert(ingredients != null),
        assert(selectedIngredients != null);
}
