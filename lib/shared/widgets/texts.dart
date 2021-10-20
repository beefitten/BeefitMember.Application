import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TitleBanner extends StatelessWidget {
  final String _title;

  const TitleBanner(this._title);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: MediaQuery.of(context).size.height * 0.05,
        bottom: 10,
      ),
      child: Container(
        child: Center(
          child: TitleText(_title),
        ),
      ),
    );
  }
}

class TitleText extends StatelessWidget {
  final String _text;

  TitleText(this._text);

  @override
  Widget build(BuildContext context) {
    return Text(
      _text,
      textAlign: TextAlign.left,
      style: TextStyle(
        color: Colors.black,
        fontSize: MediaQuery.of(context).size.height * 0.03,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}

class DescriptionText extends StatelessWidget {
  final String _text;

  DescriptionText(this._text);

  @override
  Widget build(BuildContext context) {
    return Text(
      _text,
      softWrap: true,
    );
  }
}

class CapsText extends StatelessWidget {
  final String _text;

  CapsText(this._text);
  @override
  Widget build(BuildContext context) {
    return Text(
      _text.toUpperCase(),
      style: GoogleFonts.mulish(
          textStyle: TextStyle(
              fontSize: 22, fontWeight: FontWeight.w800, color: Colors.white)),
    );
  }
}
