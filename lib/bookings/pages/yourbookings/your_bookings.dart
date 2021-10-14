import 'package:beefitmember_application/bookings/pages/yourbookings/widgets/appointmentswidget.dart';
import 'package:beefitmember_application/bookings/pages/yourbookings/widgets/booking_menu_wdiget.dart';
import 'package:beefitmember_application/bookings/pages/yourbookings/widgets/bookingswidget.dart';
import 'package:beefitmember_application/bookings/pages/yourbookings/widgets/find_classes_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class YourBookings extends StatefulWidget {
  @override
  _YourBookingsState createState() => _YourBookingsState();
}

class _YourBookingsState extends State<YourBookings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        shrinkWrap: true,
        children: <Widget>[
          FindClassesWidget(),
          BookingWidget(),
          AppointmentsWidget(),
        ],
      ),
    );
  }
}
