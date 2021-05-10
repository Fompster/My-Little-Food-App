// This file will handle all the ingredient API calls to the spoonacular API

import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:startup_namer/models/ingredients_model.dart';

class IngredientsService{
  // IngredientsService._instanciate();
  // static final IngredientsService instance = IngredientsService._instanciate();

  final String _baseURL = 'api.spoonacular.com';
  static const String API_KEY = 'b0a38175416c4ef6bfaff03877dfb8f1';

  Future<List<Ingredient>> getIngredients({String query}) async {
    List<Ingredient> _ingredients = List<Ingredient>();

    Map<String, String> parameters = {
      'query': query,
      'number': '20', // number of items to return
      'apiKey': API_KEY,
    };
    //https://api.spoonacular.com/food/ingredients/autocomplete?query=m&number=5&apiKey=b0a38175416c4ef6bfaff03877dfb8f1
    //The Uri consists of the base url, the endpoint we are going to use. It has also
    //parameters
    Uri uri = Uri.https(
      _baseURL,
      '/food/ingredients/search',
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
        //get the array in the results array
        for (var ingredientJson in data["results"]) {
          _ingredients.add(Ingredient.fromJson(ingredientJson));
        }
      }
      return _ingredients;

    } catch (err) {
      //If our response has error, we throw an error message
      throw err.toString();
    }
  }
}