import 'package:startup_namer/models/ingredients_model.dart';
import 'package:startup_namer/services/ingredient_service.dart';
import 'package:test/test.dart';

void main() {
  group("Given there is a $IngredientsService", () {
    IngredientsService service;

    setUp(() {
      service = IngredientsService();
    });
  });
}
