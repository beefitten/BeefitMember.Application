import 'package:beefitmember_application/bookings/pages/bookings_list/bookings_list.dart';
import 'package:beefitmember_application/bookings/pages/yourbookings/your_bookings.dart';
import 'package:beefitmember_application/shared/FitnessPackage/FitnessPackage.dart';
import 'package:beefitmember_application/shared/widgets/texts.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BookingMenuWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: CustomAppBar("Bookings"),
        body: TabBarView(
          children: [
            YourBookings(),
            Classes(),
            Text("Not implemented..."),
          ],
        ),
      ),
    );
  }
}

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  String _title;

  CustomAppBar(this._title);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      TitleBanner(_title),
      Padding(
        padding: const EdgeInsets.only(left: 8, right: 8),
        child: TabBar(
            indicator: ShapeDecoration(
              shape: StadiumBorder(),
              color: Color(int.parse(FitnessPackage.secondaryColor)),
            ),
            labelStyle:
                TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            //For Selected tab
            unselectedLabelStyle: TextStyle(
              fontSize: 14,
            ),
            unselectedLabelColor: Colors.grey,
            tabs: [
              Tab(icon: Text("My Bookings")),
              Tab(icon: Text("Classes")),
              Tab(icon: Text("Events")),
            ]),
      ),
    ]);
  }

  @override
  Size get preferredSize => Size.fromHeight(130.0);
}
