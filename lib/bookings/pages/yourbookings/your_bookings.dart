import 'package:beefitmember_application/bookings/pages/yourbookings/widgets/appointments_widget.dart';
import 'package:beefitmember_application/bookings/pages/yourbookings/widgets/bookings_widget.dart';
import 'package:beefitmember_application/bookings/pages/yourbookings/widgets/findClasses_widget.dart';
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

