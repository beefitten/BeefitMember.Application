import 'package:beefitmember_application/shared/FitnessPackage/FitnessPackage.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class H1Text extends StatelessWidget {
  final String _title;
  final h1 = FitnessPackage.model.font.header;

  H1Text(this._title);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: MediaQuery.of(context).viewPadding.top + 12,
        bottom: 10,
      ),
      child: Container(
        child: Center(
          child: Text(
            _title,
            style: GoogleFonts.getFont(h1.family,
                fontSize: double.parse(h1.size), fontWeight: FontWeight.w700),
          ),
        ),
      ),
    );
  }
}

class H2Text extends StatelessWidget {
  final String _text;
  final h2 = FitnessPackage.model.font.headerTwo;

  H2Text(this._text);

  @override
  Widget build(BuildContext context) {
    return Text(
      _text,
      textAlign: TextAlign.left,
      style: GoogleFonts.getFont(
        h2.family,
        fontSize: double.parse(h2.size),
        fontWeight: FontWeight.w700,
      ),
    );
  }
}

class H3Text extends StatelessWidget {
  final String _text;
  final h3 = FitnessPackage.model.font.headerThree;

  H3Text(this._text);

  @override
  Widget build(BuildContext context) {
    return Text(
      _text,
      style: GoogleFonts.getFont(
        h3.family,
        fontSize: double.parse(h3.size),
        fontWeight: FontWeight.w700,
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
        style: GoogleFonts.getFont(FitnessPackage.model.font.generalFont),
      ),
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
        fontSize: 22,
        fontWeight: FontWeight.w800,
        color: Colors.white,
      )),
    );
  }
}
