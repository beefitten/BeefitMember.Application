import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final VoidCallback _onPressed;
  final String _text;

  CustomButton(this._text, this._onPressed);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        primary: Color.fromRGBO(6, 62, 249, 1),
        shape: new RoundedRectangleBorder(
          borderRadius: new BorderRadius.circular(10.0),
        ),
      ),
      onPressed: this._onPressed,
      child: Text(
        this._text,
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}

class CustomIconButton extends StatelessWidget {
  final IconData _icon;
  final VoidCallback _onPressed;

  CustomIconButton(this._icon, this._onPressed);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        primary: Colors.white,
        onPrimary: Colors.black,
        shape: new RoundedRectangleBorder(
          borderRadius: new BorderRadius.circular(10.0),
        ),
      ),
      onPressed: this._onPressed,
      child: IconButton(
        icon: Icon(this._icon),
        onPressed: this._onPressed,
        iconSize: 30,
      ),
    );
  }
}
