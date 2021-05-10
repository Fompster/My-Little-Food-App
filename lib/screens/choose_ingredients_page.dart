
import 'package:flutter/material.dart';
import 'package:startup_namer/actions/actions.dart';
import 'package:startup_namer/models/ingredients_state.dart';
import 'package:startup_namer/reducers/Dispatcher.dart';
import 'package:startup_namer/widgets/bottom_navigation_bar.dart';
import 'package:startup_namer/widgets/search_bar.dart';
import '../widgets/chip.dart';
import '../widgets/ingredient_list.dart';
import 'recipe_page.dart';
import 'package:provider/provider.dart';
import '../widgets/search_bar.dart';
import 'package:redux/redux.dart';
import 'package:startup_namer/middleware/middleware.dart';
import '../models/recipe_state.dart';
import 'package:startup_namer/reducers/reducer.dart';

// Read up on Flutter testing: https://flutter.dev/docs/testing
// Stretchgoal: read up on Flutter + Redux + Provider
//    - https://github.com/brianegan/flutter_redux
//    - https://github.com/rrousselGit/provider

class IngredientsPage extends StatefulWidget {

  @override
  _IngredientsPageState createState() => _IngredientsPageState();
}

class _IngredientsPageState extends State<IngredientsPage> {
  @override
  void initState() {
    super.initState();
  }

  int toolBarLength = 2;

  void _searchRecipes() async {
    final storeRecipe = Store<RecipesState>(
      recipesReducer,
      initialState: RecipesState(recipes:[]),
      middleware: [recipesMiddleware],
    );

    final dispatcherRecipe = Dispatcher(storeRecipe.dispatch);

    Navigator.push(context,
        MaterialPageRoute(builder: (context) =>
            MultiProvider(
              providers: [
                StreamProvider(
                    create: (_) => storeRecipe.onChange.distinct(),
                    initialData: storeRecipe.state
                ),
                Provider.value(value: dispatcherRecipe)
              ],
              child: RecipePage(),
            )
        )
    );
  }

  Widget customAppBar() {
    return SliverAppBar(
        snap: true,
        forceElevated: true,
        pinned: true,
        floating: true,
        title: Text("Choose your ingredients"),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.arrow_forward_rounded),
              onPressed: () {
                // get all the recipes and go to the next page
                _searchRecipes();
              }),
        ],
        expandedHeight: toolBarLength * kToolbarHeight,
        flexibleSpace: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [Theme.of(context).accentColor, Theme.of(context).primaryColor])
          ),
          child: Padding(
            padding: const EdgeInsets.only(
                top: 1.75 * kToolbarHeight, left: 17, bottom: 8.0),
            child: Center(
              child: Consumer<Dispatcher>(
                builder: (_, dispatcher, __) => Consumer<IngredientsState>(
                  // We are not using the build context or child so we replace it with _
                  builder: (_, state, __) {
                    var chips = state.selectedIngredients
                        .map((ingredient) => CustomChip(
                            ingredient,
                            () =>
                                dispatcher(ToggleIngredientAction(ingredient))))
                        .toList();
                    bool areThereChips = chips.length > 0;

                    return Row(
                      children: <Widget>[
                        Expanded(
                          child: SearchBar(thereAreChips: areThereChips),
                          flex: 0,
                        ),
                        Expanded(
                          child: Padding(
                              padding: EdgeInsets.only(left: 1.0),
                              child: SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                clipBehavior: Clip.antiAlias,
                                child: Row(
                                  children: chips,
                                ),
                              )),
                        ),
                      ],
                    );
                  },
                ),
              ),
            ),
          ),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: CustomScrollView(
        slivers: <Widget>[
          customAppBar(),
          IngredientsList(),
        ],
      ),
      bottomNavigationBar: BottomNavBar()
    );
  }
}
