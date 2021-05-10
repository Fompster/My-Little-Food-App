// This file will handle all the API calls to the spoonacular API

import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:startup_namer/models/recipe_model.dart';
import 'package:startup_namer/models/ingredients_model.dart';

class APIService {
  final String _baseURL = 'api.spoonacular.com';
  static const String API_KEY = 'b0a38175416c4ef6bfaff03877dfb8f1';

  Future<List<Recipe>> generateRecipes({List<Ingredient> ingredients}) async {
    List<Recipe> _recipes = List<Recipe>();
    String ingredientsText = '';

    for (var ingredient in ingredients) {
      ingredientsText += ingredient.name;
      if ((ingredients.indexOf(ingredient)+1) < ingredients.length) {
        ingredientsText += ",+";
      }
    }

    Map<String, String> parameters = {
      'number': '10', // number of recipes to return
      'ingredients': ingredientsText,
      'apiKey': API_KEY,
    };
    //The Uri consists of the base url, the endpoint we are going to use. It has also
    //parameters
    Uri uri = Uri.https(
      _baseURL,
      '/recipes/findByIngredients',
      parameters,
    );

    //Our header specifies that we want the request to return a json object
    Map<String, String> headers = {
      HttpHeaders.contentTypeHeader: 'application/json',
    };

    try {

      //http.get to retrieve the response
      var response = await http.get(uri, headers: headers);

      if (response.statusCode == 200) {
        var data = json.decode(response.body);
        for (var recipeJson in data) {
          _recipes.add(Recipe.fromJson(recipeJson));
        }
      }

      return _recipes;

    } catch (err) {
      //If our response has error, we throw an error message
      throw err.toString();
    }
  }
}