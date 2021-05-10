import 'package:flutter/material.dart';
import 'package:startup_namer/actions/actions.dart';
import 'package:startup_namer/models/ingredients_state.dart';
import 'package:startup_namer/models/recipe_state.dart';
import 'package:startup_namer/reducers/Dispatcher.dart';
import 'package:startup_namer/widgets/bottom_navigation_bar.dart';
import '../widgets/recipe_card.dart';
import 'package:provider/provider.dart';

class RecipePage extends StatefulWidget {
  @override
  _RecipePageState createState() => _RecipePageState();
}

class _RecipePageState extends State<RecipePage> {
  @override
  void initState() {
    super.initState();
  }

  Widget displayRecipeCards() {
    return Consumer<RecipesState>(builder: (_, recipeState, __) {
      return SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children:
              recipeState.recipes.map((recipe) => RecipeCard(recipe)).toList(),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<Dispatcher>(builder: (_, dispatcher, __) {
      return Consumer<IngredientsState>(builder: (_, ingredientState, __) {
        dispatcher(FetchRecipesAction(ingredientState.selectedIngredients));

        return Consumer<RecipesState>(builder: (_, recipeState, __) {
          return Scaffold(
              appBar: AppBar(
                title: Text("Your Meals"),
                flexibleSpace: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [Theme.of(context).accentColor, Theme.of(context).primaryColor]),
                  ),
                ),
              ),
              body: recipeState.recipes.isEmpty
                  ? Center(
                      child: CircularProgressIndicator(),
                    )
                  : displayRecipeCards(),
              bottomNavigationBar: BottomNavBar(),
          );
        });
      });
    });
  }
}
