import 'package:beefitmember_application/shared/FitnessPackage/FitnessPackage.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final TextStyle fontFamily =
    GoogleFonts.getFont(FitnessPackage.model.font.generalFont);

class CardWidget extends StatelessWidget {
  final double _height;
  final Icon _icon;
  final String _txt;

  CardWidget(this._height, this._icon, this._txt);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: _height,
      width: MediaQuery.of(context).size.width * 0.45,
      margin: EdgeInsets.only(
          bottom: 8.0),
      decoration: BoxDecoration(
          color: Color(int.parse(FitnessPackage.model.backgroundColor)),
          borderRadius: BorderRadius.circular(
              double.parse(FitnessPackage.model.borderRadius))),
      child: Padding(
        padding: EdgeInsets.only(
            left: MediaQuery.of(context).size.width * 0.05,
            right: MediaQuery.of(context).size.width * 0.05,
            top: MediaQuery.of(context).size.height * 0.007),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _icon,
            Padding(
              padding: EdgeInsets.only(
                top: MediaQuery.of(context).size.height * 0.01,
              ),
              child: Text(
                _txt,
                style: GoogleFonts.getFont(
                    FitnessPackage.model.font.generalFont,
                    fontWeight: FontWeight.bold,
                    fontSize: 14),
              ),
            )
          ],
        ),
      ),
    );
  }
}
