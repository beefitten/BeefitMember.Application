import 'package:beefitmember_application/bookings/pages/yourbookings/widgets/appointments_widget.dart';
import 'package:beefitmember_application/bookings/pages/yourbookings/widgets/bookings_widget.dart';
import 'package:beefitmember_application/bookings/pages/yourbookings/widgets/findClasses_widget.dart';
import 'package:beefitmember_application/shared/FitnessPackage/FitnessPackage.dart';
import 'package:flutter/material.dart';

class YourBookings extends StatefulWidget {
  @override
  _YourBookingsState createState() => _YourBookingsState();
}

class _YourBookingsState extends State<YourBookings> {
  final _widgets = generateOrder();

  void initState() {
    super.initState();
  }

  static generateOrder() {
    var orderList = FitnessPackage.model.bookings.bookings;
    List<Widget> _widgetOptions = <Widget>[];

    _widgetOptions.add(FindClassesWidget());

    orderList.forEach((element) {
      switch (element) {
        case 0:
          _widgetOptions.add(BookingWidget());
          break;
        case 1:
          _widgetOptions.add(AppointmentsWidget());
          break;
      }
    });

    return _widgetOptions;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        shrinkWrap: true,
        children: _widgets,
      ),
    );
  }
}
