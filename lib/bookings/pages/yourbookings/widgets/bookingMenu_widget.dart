import 'package:beefitmember_application/bookings/pages/bookings_list/classes_list.dart';
import 'package:beefitmember_application/bookings/pages/yourbookings/widgets/your_bookings.dart';
import 'package:beefitmember_application/shared/FitnessPackage/FitnessPackage.dart';
import 'package:beefitmember_application/shared/widgets/texts.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final TextStyle fontFamily =
    GoogleFonts.getFont(FitnessPackage.model.font.generalFont);

class BookingMenuWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: PreferredSize(
            preferredSize: Size(MediaQuery.of(context).size.width,
                MediaQuery.of(context).size.height * 0.16),
            child: CustomAppBar("Bookings")),
        body: TabBarView(
          children: [
            YourBookings(),
            ClassesList(),
            Center(child: Text("Coming soon!", style: fontFamily)),
          ],
        ),
      ),
    );
  }
}

class CustomAppBar extends StatelessWidget {
  String _title;

  CustomAppBar(this._title);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      H1Text(_title),
      Padding(
        padding: const EdgeInsets.only(left: 8, right: 8),
        child: TabBar(
            indicator: ShapeDecoration(
              shape: StadiumBorder(),
              color: Color(int.parse(FitnessPackage.model.secondaryColor)),
            ),
            labelStyle:
                TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            //For Selected tab
            unselectedLabelStyle: TextStyle(
              fontSize: 14,
            ),
            unselectedLabelColor: Colors.grey,
            tabs: [
              Tab(
                  icon: Text(
                "My Bookings",
                style: fontFamily,
              )),
              Tab(icon: Text("Classes", style: fontFamily)),
              Tab(icon: Text("Events", style: fontFamily)),
            ]),
      ),
    ]);
  }
}
