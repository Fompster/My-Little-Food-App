import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:startup_namer/actions/actions.dart';
import 'package:startup_namer/reducers/Dispatcher.dart';

class SearchBar extends StatefulWidget {
  final bool thereAreChips;

  SearchBar({this.thereAreChips});

  @override
  _SearchBarState createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  final icon = Icon(Icons.search_rounded, color: Colors.white);

  // Create a text controller and use it to retrieve the current value
  // of the TextField.
  final myController = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    myController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    bool thereAreChips = widget.thereAreChips;

    return ClipRect(
      clipBehavior: Clip.hardEdge,
      child: AnimatedContainer(
        width: thereAreChips ? 180.0 : 390.0,
        duration: const Duration(milliseconds: 500),
        child: Consumer<Dispatcher>(
          builder: (_, dispatcher, __) {
            return TextFormField(
              controller: myController,
              cursorColor: Colors.white,
              decoration: InputDecoration(
                hintText: "Search",
                filled: true,
                fillColor: Color.fromRGBO(142, 142, 142, .25),
                // prefixIcon: thereAreChips ? null : icon,
                // icon: thereAreChips ? icon : null,
                prefixIcon: icon,
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
              ),
              onEditingComplete: () {
                dispatcher(FetchIngredientsAction(myController.text));
              },
            );
          },
        ),
      ),
    );
  }
}
