import 'package:flutter/material.dart';

class TitleText extends StatelessWidget {
  late String _text;

  TitleText(this._text);

  @override
  Widget build(BuildContext context) {
    return Text(
      _text,
      textAlign: TextAlign.center,
      style: TextStyle(
        color: Colors.black,
        fontSize: MediaQuery.of(context).size.height * 0.03,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
