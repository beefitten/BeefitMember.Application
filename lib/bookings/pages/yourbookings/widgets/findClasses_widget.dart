import 'package:beefitmember_application/shared/FitnessPackage/FitnessPackage.dart';
import 'package:beefitmember_application/training_progression/widgets/image_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';


final TextStyle fontFamily =
      GoogleFonts.getFont(FitnessPackage.model.font.generalFont);

class FindClassesWidget extends StatelessWidget {
  const FindClassesWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height*0.27,
      child: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          ClipRRect(
            child: FadeInImage.assetNetwork(
              placeholder: 'lib/bookings/pages/yourbookings/assets/picture1.png',
              image: FitnessPackage.model.bookings.topPicPath,
              fit: BoxFit.fitWidth,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          Positioned(
            width: MediaQuery.of(context).size.width*0.65,
            child: Padding(
              padding: const EdgeInsets.all(25.0),
              child: Text("Find classes that motivates you!",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.bold),
                  textAlign: TextAlign.left),
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            heightFactor: 4,
            child: Padding(
              padding: const EdgeInsets.only(right: 20, bottom: 10),
              child: ElevatedButton(
                child: Text("Find classes"),
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  primary: Colors.white,
                  onPrimary:
                      Color(int.parse(FitnessPackage.model.secondaryColor)),
                  onSurface: Colors.black,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
