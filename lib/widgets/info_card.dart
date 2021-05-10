import 'package:flutter/material.dart';
import 'package:startup_namer/screens/choose_ingredients_page.dart';
import 'package:startup_namer/widgets/gradient_icon.dart';
import 'package:startup_namer/widgets/transition_animation.dart';

class InfoCard extends StatelessWidget {
  final String name;
  final IconData icon;
  // void Function() nextPage;
  final void Function() nextPage;

  InfoCard({this.name, this.icon, this.nextPage});

  Widget box() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(8.0),
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.black12,
            blurRadius: 10.0,
            offset: Offset(0.0, 10.0),
          ),
        ],
      ),
    );
  }

  Widget boxInfo(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            name,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.w800,
              color: Theme.of(context).accentColor,
            ),
          ),

          // the little line
          Container(
              margin: EdgeInsets.only(top: 8, bottom: 3),
              height: 2.0,
              width: 24.0,
              color: Theme.of(context).primaryColor
          ),

          Expanded(
            child: Align(
              alignment: Alignment.center,
              child: GradientIcon(
                  size: 100,
                  icon: icon,
                  gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        Theme.of(context).accentColor,
                        Theme.of(context).primaryColor
                      ])
              ),
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
          margin: const EdgeInsets.all(10),
          child: Stack(
            children: <Widget>[
              box(),
              boxInfo(context),
            ],
          )
      ),
      onTap: () {
        Navigator.push(
          context,
          FadeRoute(page: IngredientsPage()),
        );
      },
    );
  }
}