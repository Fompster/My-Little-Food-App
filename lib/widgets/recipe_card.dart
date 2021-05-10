import 'package:flutter/material.dart';
import 'package:startup_namer/models/recipe_model.dart';

class RecipeCard extends StatelessWidget {
  final Recipe recipe;

  RecipeCard(this.recipe);

  Widget recipeThumbnail(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10.0),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0),
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Theme.of(context).accentColor,
                Theme.of(context).primaryColor
              ])
      ),
      child: Padding(
          padding: EdgeInsets.all(3),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(6.0),
            child: Image.network(
              recipe.image,
              fit: BoxFit.cover,
              height: 100,
              width: 90,
            ),
          ),
      ),
    );
  }

  Widget recipeBox(BuildContext context) {
    return Container(
      height: 124.0,
      margin: EdgeInsets.only(left: 46.0),
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor,
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(8.0),
        gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Theme.of(context).accentColor,
              Theme.of(context).primaryColor
            ]),
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.black12,
            blurRadius: 10.0,
            offset: Offset(0.0, 10.0),
          ),
        ],
      ),
      child: Container(
        margin: EdgeInsets.all(1),
        decoration: BoxDecoration(
          color: Colors.white,
        ),
      ),
    );
  }

  Widget recipeInfo(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(110.0, 16.0, 16.0, 16.0),
      //constraints: new BoxConstraints.expand(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(height: 4.0),
          Text(
            recipe.name,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w800,
              color: Theme.of(context).accentColor,
            ),
          ),
          Container(
              margin: EdgeInsets.symmetric(vertical: 8.0),
              height: 2.0,
              width: 18.0,
              color: Theme.of(context).primaryColor
          ),
          Container(height: 10.0),
          Text(
            "Some info about the recipe",
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        margin: const EdgeInsets.symmetric(
          vertical: 16.0,
          horizontal: 24.0,
        ),
        child: Stack(
          children: <Widget>[
            recipeBox(context),
            recipeThumbnail(context),
            recipeInfo(context),
          ],
        )
      ),
      onTap: () {
        print("Container was tapped");
        },
    );
  }
}