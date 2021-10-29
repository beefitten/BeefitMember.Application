import 'package:beefitmember_application/shared/FitnessPackage/FitnessPackage.dart';
import 'package:beefitmember_application/shared/user/user.dart';
import 'package:flutter/material.dart';

class MemberShipCard extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(double.parse(FitnessPackage.model.borderRadius)),
          color: Color(int.parse(FitnessPackage.model.backgroundColor))),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Padding(
              padding: EdgeInsets.only(
                  right: MediaQuery.of(context).size.width * 0.04,
                  left: MediaQuery.of(context).size.width * 0.02),
              child: Icon(
                Icons.beach_access,
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: Text("Membership: " + User.subscription),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: Text("Primary Gym: " + User.primaryGym),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
