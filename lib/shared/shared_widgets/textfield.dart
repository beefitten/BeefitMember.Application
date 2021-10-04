
import 'package:flutter/material.dart';

class TextFieldInput extends StatelessWidget {
  final String _inputText;
  final double _width;

  TextFieldInput(this._inputText, this._width);

  @override
  Widget build(BuildContext context) {

    return Container(
      width: _width,
      color: Color.fromRGBO(247, 247, 252, 1),
      child: TextField(
        decoration: InputDecoration(
          hintText: _inputText,
          border: OutlineInputBorder(),

        ),
      ),
    );


  }
}