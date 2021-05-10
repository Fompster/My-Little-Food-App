// Copyright 2018 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:startup_namer/middleware/middleware.dart';
import 'package:startup_namer/models/ingredients_state.dart';
import 'package:startup_namer/reducers/Dispatcher.dart';
import 'package:startup_namer/reducers/reducer.dart';
import 'package:startup_namer/screens/home_screen.dart';
import '../screens/choose_ingredients_page.dart';
import 'bottom_navigation_bar.dart';
import 'package:redux/redux.dart';

void main() {
  final store = Store<IngredientsState>(
    ingredientsReducer,
    initialState: IngredientsState(ingredients:[], selectedIngredients:[]),
    middleware: [ingredientsMiddleware],
  );

  final dispatcher = Dispatcher(store.dispatch);

  runApp(
      MultiProvider(
          providers: [
            StreamProvider(
                create: (_) => store.onChange.distinct(),
                initialData: store.state
            ),
            Provider.value(value: dispatcher)
          ],
        child: MyApp(),
      )
  );
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
        primaryColor: Colors.green,
        accentColor: Colors.cyan[600],//Color(0xff00c6ff)
          backgroundColor: Color(0xf5ffffff), //Color(0xf5f5f5ff)
        ),
        debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}