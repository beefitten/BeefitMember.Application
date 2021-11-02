import 'package:beefitmember_application/shared/FitnessPackage/FitnessPackage.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final TextStyle fontFamily =
    GoogleFonts.getFont(FitnessPackage.model.font.generalFont);

class Contact extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Text(
            "Hello there",
            style: fontFamily,
          ),
        ),
      ),
    );
  }
}
