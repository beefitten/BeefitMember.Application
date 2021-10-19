import 'package:flutter/material.dart';

class H1Text extends StatelessWidget {
  final String _title;

  const H1Text(this._title);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: MediaQuery.of(context).size.height * 0.05,
        bottom: 10,
      ),
      child: Container(
        child: Center(
          child: H2Text(_title),
        ),
      ),
    );
  }
}

class H2Text extends StatelessWidget {
  final String _text;

  H2Text(this._text);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: Text(
        _text,
        textAlign: TextAlign.left,
        style: TextStyle(
          color: Colors.black,
          fontSize: MediaQuery.of(context).size.height * 0.03,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

class H3Text extends StatelessWidget {
  final String _text;

  const H3Text(this._text);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20, bottom: 10),
      child: Text(
        _text,
        style: TextStyle(
          fontSize: MediaQuery.of(context).size.height * 0.02,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

class DescriptionText extends StatelessWidget {
  final String _text;

  DescriptionText(this._text);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0, bottom: 10),
      child: Text(
        _text,
        softWrap: true,
      ),
    );
  }
}
