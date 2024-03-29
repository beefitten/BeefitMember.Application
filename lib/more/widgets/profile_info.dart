import 'package:beefitmember_application/shared/FitnessPackage/FitnessPackage.dart';
import 'package:beefitmember_application/shared/user/user.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfileInfo extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: EdgeInsets.only(top: MediaQuery.of(context).viewPadding.top+18.0),
        child: Center(
          child: Column(
            children: [
              CircleAvatar(
                  radius: 40, backgroundImage: NetworkImage(User.profileImage)),
              Padding(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.02),
                child: Column(
                  children: [
                    Text(User.name + " " + User.lastName, 
                    style: GoogleFonts.getFont(FitnessPackage.model.font.generalFont,fontWeight: FontWeight.bold, fontSize: 16)),
                    Padding(
                      padding: const EdgeInsets.only(top: 2),
                      child: Text(
                        User.role,
                        style: GoogleFonts.getFont(FitnessPackage.model.font.generalFont,color: Color.fromRGBO(138, 141, 178, 1), fontSize: 15),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
