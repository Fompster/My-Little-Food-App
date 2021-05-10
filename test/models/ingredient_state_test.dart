import 'package:startup_namer/models/ingredients_state.dart';
import 'package:startup_namer/models/ingredients_model.dart';
import 'package:test/test.dart';
import 'package:mockito/mockito.dart';

class MockState extends Mock implements IngredientsState {
  @override
  Future searchIngredients({String query}) {
    return Stream.fromIterable(elements
    )
  }
}

void main(){
  final MockState mockState = MockState();

  // Triple A principle
  test("Ingredient with the same ID should be considered equal", () {

  });
}

// TODO if there is stuff in the search bar then return " could not find __"
// TODO create mock model

