import 'package:flutter/material.dart';
import 'package:startup_namer/widgets/curve_painter.dart';
import 'package:startup_namer/widgets/info_card.dart';

import 'choose_ingredients_page.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
        body: CustomPaint(
          painter: CurvePainter(
              Theme.of(context).primaryColor, Theme.of(context).accentColor),
          child: Flex(
            direction: Axis.vertical,
            children: [
              SafeArea(
                child: Padding(
                  padding: EdgeInsets.only(top: 45, bottom: 40),
                  child: Text(
                    "Welcome Back!",
                    style: TextStyle(color: Colors.white, fontSize: 49),
                  ),
                ),
              ),
              Flexible(
                  flex: 3,
                  child: Padding(
                    padding:
                        EdgeInsets.only(left: 30, right: 30, top: 0, bottom: 0),
                    child: Column(
                      children: [
                        Flexible(
                            child: Row(
                          children: [
                            Flexible(
                                child: InfoCard(
                              name: "What is in my Fridge",
                              icon: Icons.local_grocery_store_outlined,
                              nextPage: () {
                                IngredientsPage();
                              },
                            )),
                            Flexible(
                                child: InfoCard(
                              name: "Find a Meal",
                              icon: Icons.search_rounded,
                            ))
                          ],
                        )),
                        Flexible(
                          child: Padding(
                              padding: EdgeInsets.only(top: 10),
                              child: Row(
                                children: [
                                  Flexible(
                                      child: InfoCard(
                                    name: "Recipe of the Day",
                                    icon: Icons.set_meal_outlined,
                                  )),
                                  Flexible(
                                      child: InfoCard(
                                    name: "My Favorites",
                                    icon: Icons.favorite_border_rounded,
                                  ))
                                ],
                              )),
                        )
                      ],
                    ),
                  )),
              Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(top: 60),
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border(
                          top: BorderSide(
                            width: 3,
                            color: Theme.of(context).primaryColor,
                          ),
                        ),
                      ),
                      child: Padding(
                        padding: EdgeInsets.only(left: 40, right: 10, top: 10),
                        child: Column(
                          children: [
                            Text("Did you know you can eat food?"),
                            Text("Did you know you can eat food?"),
                          ],
                        ),
                      ),
                    ),
                  )),
            ],
          ),
        ));
  }
}