
import 'package:flutter/material.dart';

class TextFieldInput extends StatelessWidget {
  final TextEditingController _controller;
  final TextInputType? _textInputType;
  final bool _autofocus;
  final bool _filled;

  final int _fillColorRed;
  final int _fillColorBlue;
  final int _fillColorGreen;
  final double _fillOpacity;
  final int _hintColor;

  final String _hintText;

  final double _contentPaddingLeft;
  final double _contentPaddingTop;
  final double _contentPaddingRight;
  final double _contentPaddingBottom;
  final double _borderRadius;

  TextFieldInput(
      this._controller,
      this._autofocus,
      this._filled,
      this._fillColorRed,
      this._fillColorBlue,
      this._fillColorGreen,
      this._fillOpacity,
      this._hintColor,
      this._hintText,
      this._contentPaddingLeft,
      this._contentPaddingTop,
      this._contentPaddingRight,
      this._contentPaddingBottom,
      this._borderRadius,
      [this._textInputType]);

  @override
  Widget build(BuildContext context) {

    return TextField(
        controller: _controller,
        keyboardType: _textInputType,
        autofocus: _autofocus,
        decoration: InputDecoration(
          filled: _filled,
          fillColor: Color.fromRGBO(
            _fillColorRed,
            _fillColorGreen,
            _fillColorBlue,
            _fillOpacity),
          hintStyle: TextStyle(
            color: Color(_hintColor)
          ),
        hintText: _hintText,
        contentPadding: EdgeInsets.fromLTRB(
          _contentPaddingLeft,
          _contentPaddingTop,
          _contentPaddingRight,
          _contentPaddingBottom),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(_borderRadius))
      ),
    );
  }
}