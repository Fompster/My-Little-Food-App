import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final String buttonName;

  Button(this.buttonName);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0, right: 12),
      child: Container(
        margin: EdgeInsets.all(10),
        height: 50.0,
        child: RaisedButton.icon(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(18.0),
              side: BorderSide(color: Color.fromRGBO(0, 160, 227, 1))),
          onPressed: () {},
          elevation: 4.0,
          padding: const EdgeInsets.only(left: 8.0, right: 10),
          color: Color.fromRGBO(0, 160, 227, 1),
          textColor: Colors.black,
          label: Text("...", style: TextStyle(fontSize: 15)),
          icon: Icon(Icons.backspace_outlined),
        ),
      ),
      // RaisedButton(child: Text("Button One"), onPressed: () {}),
    );
  }
}
