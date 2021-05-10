import 'package:flutter/material.dart';
import 'package:startup_namer/models/ingredients_model.dart';
import 'package:startup_namer/models/ingredients_state.dart';

class CustomChip extends StatelessWidget {
  // final String chipName;
  final Ingredient ingredient;
  final VoidCallback toggleIngredient;

  CustomChip(this.ingredient, this.toggleIngredient);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(left: 9.0, right: 9.0),
        child: Container(
          child: Chip(
            clipBehavior: Clip.hardEdge,
            padding:
                EdgeInsets.only(left: 6.0, top: 2.0, right: 1.0, bottom: 2.0),
            backgroundColor: Colors.lightBlue,
            label: Text(
              ingredient.readableName,
              style: TextStyle(color: Colors.white, fontSize: 15),
            ),
            elevation: 6.0,
            deleteIcon: Icon(
              Icons.cancel,
              color: Colors.white,
              size: 17,
            ),
            onDeleted: toggleIngredient
            ,
          ),
        ));
  }
}
