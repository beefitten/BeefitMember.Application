import 'package:beefitmember_application/bookings/pages/previewBookings/widgets/show_more_button.dart';
import 'package:beefitmember_application/shared/FitnessPackage/FitnessPackage.dart';
import 'package:beefitmember_application/training_progression/pages/training_progression.dart';
import 'package:beefitmember_application/training_progression/preview/training_prog_preview.dart';
import 'package:beefitmember_application/user/service/logout_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class More extends StatefulWidget {
  @override
  _MoreState createState() => _MoreState();
}

class _MoreState extends State<More> {
  final _logOut = Text(
    'Log out',
    style: TextStyle(
        fontSize: 20.0, color: Color(int.parse(FitnessPackage.secondaryColor))),
  );

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final _logOutBtn = TextButton(
      style: ButtonStyle(
          backgroundColor:
              MaterialStateProperty.all(Color.fromRGBO(229, 235, 254, 1.0))),
      child: _logOut,
      onPressed: () {
        LogoutService.logOut();
        Navigator.pop(context, '/nav');
      },
    );

    final headerGeneral = (String txt) => Padding(
          padding:
              EdgeInsets.only(right: MediaQuery.of(context).size.width * 0.44),
          child: Text(
            "$txt",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
        );

    final membership = Container(
      child: Row(
        children: [headerGeneral("Membership"), ShowMore()],
      ),
    );

    final bigCard = Container(
      height: 100,
      width: MediaQuery.of(context).size.width*0.42,
      margin: EdgeInsets.only(bottom: 8.0, right: MediaQuery.of(context).size.width*0.05),
      decoration: BoxDecoration(
          color: Color.fromRGBO(247, 247, 252, 1),
          borderRadius: BorderRadius.circular(5.0)),
      child: Column(
        children: [Text("Logo"), Text("data")],
      ),
    );

    final smallCard = Container(
      height: 85,
      width: MediaQuery.of(context).size.width*0.42,
      margin: EdgeInsets.only(bottom: 8.0, right: 16.0),
      decoration: BoxDecoration(
          color: Color.fromRGBO(247, 247, 252, 1),
          borderRadius: BorderRadius.circular(5.0)),
      child: Column(
        children: [Text("Logo"), Text("data")],
      ),
    );

    final more = Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          headerGeneral("More"),
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // left column under more
                Column(
                  children: [
                    bigCard,
                    bigCard,
                    bigCard,
                    bigCard,
                    bigCard,
                    bigCard
                  ],
                ),
                // right column under more
                Column(
                  children: [
                    smallCard,
                    smallCard,
                    smallCard,
                    smallCard,
                    smallCard,
                    smallCard,
                    smallCard
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );

    final membershipCard = Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5.0),
          color: Color.fromRGBO(247, 247, 252, 1) // whitelabelin color
          ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("Logo"),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: Text("Medlemsskab A"),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: Text("Bindsperiode: 6 måneder"),
                )
              ],
            )
          ],
        ),
      ),
    );

    return Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: EdgeInsets.only(
            left: MediaQuery.of(context).size.width * 0.05,
          ),
          child: Container(
              child: ListView(
            children: [
              membership,
              Padding(
                padding: EdgeInsets.only(
                    right: MediaQuery.of(context).size.width * 0.05,
                    bottom: MediaQuery.of(context).size.height * 0.02),
                child: membershipCard,
              ),
              more,
              Padding(
                padding: EdgeInsets.only(
                    right: MediaQuery.of(context).size.width * 0.05),
                child: _logOutBtn,
              ),
            ],
          )),
        ));
  }
}
