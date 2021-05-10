import 'package:redux/redux.dart';
import 'package:startup_namer/actions/actions.dart';
import 'package:startup_namer/models/ingredients_state.dart';
import 'package:startup_namer/services/ingredient_service.dart';
import 'package:startup_namer/models/recipe_state.dart';
import 'package:startup_namer/services/api_service.dart';

ingredientsMiddleware(Store<IngredientsState> store, dynamic action, NextDispatcher next) async {

  if (action is FetchIngredientsAction) {
    final service = IngredientsService();
    final ingredients = await service.getIngredients(query: action.query);
    store.dispatch(FetchedIngredientsAction(ingredients));
  }
  // Is finished and can do the next dispatch
  next(action);
}

recipesMiddleware(Store<RecipesState> store, dynamic action, NextDispatcher next) async {

  if (action is FetchRecipesAction) {
    final service = APIService();
    final recipes = await service.generateRecipes(ingredients: action.ingredients);
    store.dispatch(FetchedRecipesAction(recipes));
  }
  // Is finished and can do the next dispatch
  next(action);
}