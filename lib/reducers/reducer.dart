import 'package:startup_namer/actions/actions.dart';
import 'package:startup_namer/models/ingredients_state.dart';
import 'package:startup_namer/models/recipe_state.dart';

IngredientsState ingredientsReducer(IngredientsState state, dynamic action) {
  if (action is ToggleIngredientAction) {
    final selectedIngredients = state.selectedIngredients;
    if (selectedIngredients.contains(action.ingredient)) {
      selectedIngredients.remove(action.ingredient);
    }
    else {
      selectedIngredients.add(action.ingredient);
    }

    return IngredientsState(ingredients: state.ingredients, selectedIngredients: selectedIngredients);
  } else if (action is FetchedIngredientsAction) {
    final ingredients = action.ingredients;
    return IngredientsState(ingredients: ingredients, selectedIngredients: state.selectedIngredients);
  }

  return state;
}

RecipesState recipesReducer(RecipesState state, dynamic action) {
  if (action is FetchedRecipesAction) {
    final recipes = action.recipes;
    return RecipesState(recipes: recipes);
  }

  return state;
}