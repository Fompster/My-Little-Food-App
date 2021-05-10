import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:startup_namer/actions/actions.dart';
import 'package:startup_namer/models/ingredients_model.dart';
import 'package:startup_namer/models/ingredients_state.dart';
import 'package:startup_namer/reducers/Dispatcher.dart';
import 'gradient_icon.dart';

class IngredientsList extends StatelessWidget {
  // Doesnt need access to the state so we pass down a function
  Widget listItem(Ingredient ingredient, VoidCallback onTap) {
    return Consumer<IngredientsState>(
      builder: (_, state, __) {
        bool isSelected = state.selectedIngredients.contains(ingredient);
        return ListTile(
          contentPadding: EdgeInsets.symmetric(horizontal: 25.0),
          title: Text(
            ingredient.readableName,
            style: TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          leading: Image.network(
            'https://spoonacular.com/cdn/ingredients_100x100/${ingredient.image}',
            fit: BoxFit.fitHeight,
            height: 100,
            width: 90,
          ),
          trailing: Icon(
            isSelected
                  ? Icons.check_box_rounded
                  : Icons.check_box_outline_blank_rounded,
            color: isSelected? Colors.green : null,
            size: 30,
          ),
          onTap: onTap,
        );
      }
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<IngredientsState>(
      builder: (_, state, __)
    {
      // Sliverlist has to return some kind of list so if there is none we return loading text
      if (state.ingredients.isEmpty) {
        return SliverFillRemaining(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                GradientIcon(
                    size: 100,
                    icon: Icons.fastfood_rounded,
                    gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          Theme.of(context).accentColor,
                          Theme.of(context).primaryColor
                        ])
                ),
                Text(
                  "Search for an ingredient to add it to your list",
                  textAlign: TextAlign.center,
                ),
              ],
            )
        );
      }

      return Consumer<Dispatcher>(
          builder: (_, dispatch, __) => SliverList(
                delegate: SliverChildBuilderDelegate(
                  (BuildContext context, int index) {
                    return Column(
                      children: [
                        Divider(),
                        listItem(state.ingredients[index],
                            () => dispatch(ToggleIngredientAction(
                                state.ingredients[index]))),
                      ],
                    );
                  },
                  childCount: state.ingredients.length,
                ),
              ));
    });
  }
}
// TODO: make it so that the appbar searchbar bit doesnt leave when there are no results