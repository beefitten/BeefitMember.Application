import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final VoidCallback _onPressed;
  final String _text;

  CustomButton(this._text, this._onPressed);

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      onPressed: this._onPressed,
      padding: EdgeInsets.all(20),
      color: Color.fromRGBO(6, 62, 249, 1),
      textColor: Colors.white,
      child: Text(this._text),
    );
  }
}

class CustomIconButton extends StatelessWidget {
  final IconData _icon;
  final VoidCallback _onPressed;

  CustomIconButton(this._icon, this._onPressed);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(12.0, 12.0, 12.0, 0),
      child: RaisedButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        onPressed: this._onPressed,
        color: Colors.white,
        textColor: Colors.black,
        child: IconButton(
          icon: Icon(this._icon),
          onPressed: this._onPressed,
          iconSize: 35,
        ),
      ),
    );
  }
}
