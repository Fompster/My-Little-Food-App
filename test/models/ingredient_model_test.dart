import 'package:startup_namer/models/ingredients_model.dart';
import 'package:test/test.dart';
import 'package:startup_namer/models/ingredients_model.dart';

void main(){
  // Triple A principle
  test("Ingredient with the same ID should be considered equal", () {
    // Arrange
    final acorn1 = Ingredient(name: "Acorn 1", isSelected: false, id: 1);
    final acorn2 = Ingredient(name: "Acorn 2", isSelected: false, id: 1);

    // Act
    final areEqual = acorn1 == acorn2;

    // Assert
    expect(areEqual, isTrue);
  });


}