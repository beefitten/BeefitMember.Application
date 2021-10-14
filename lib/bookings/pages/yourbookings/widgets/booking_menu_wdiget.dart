import 'package:beefitmember_application/bookings/pages/yourbookings/your_bookings.dart';
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
              Text("Sut"),
              Text("Dut"),
            ],
          ),
        ),
    );
  }
}

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {

  String _title;

  CustomAppBar(this._title);

  onItemTap(int index) {
    switch(index) {
      case 0:
        _title = "Bookings";
        break;
      case 1:
        _title = "D";
        break;
      case 2:
        _title = "S";
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 30),
            child: Text(
              _title,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black,
                fontSize: MediaQuery
                    .of(context)
                    .size
                    .height * 0.025,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
            child: TabBar(
                indicator: ShapeDecoration(
                  shape: StadiumBorder(),
                  color: Color.fromRGBO(95, 46, 234, 1),
                ),
                labelStyle: TextStyle(
                    color: Colors.white, fontWeight: FontWeight.bold),
                //For Selected tab
                unselectedLabelStyle: TextStyle(
                  fontSize: 14,
                ),
                unselectedLabelColor: Colors.grey,
                onTap: (index) {
                  onItemTap(index);
                },
                tabs: [
                  Tab(icon: Text("Your Bookings")),
                  Tab(icon: Text("Classes")),
                  Tab(icon: Text("Events")),
                ]),
          ),
        ]
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(100.0);
}