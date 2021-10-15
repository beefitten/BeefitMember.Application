import 'package:beefitmember_application/bookings/pages/yourbookings/widgets/appointmentswidget.dart';
import 'package:beefitmember_application/bookings/pages/yourbookings/widgets/booking_menu_wdiget.dart';
import 'package:beefitmember_application/bookings/pages/yourbookings/widgets/bookingswidget.dart';
import 'package:beefitmember_application/bookings/pages/yourbookings/widgets/find_classes_widget.dart';
import 'package:beefitmember_application/shared/widgets/buttons.dart';
import 'package:beefitmember_application/user/service/logout_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class More extends StatefulWidget {
  @override
  _MoreState createState() => _MoreState();
}

class _MoreState extends State<More> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        child: Center(
            child: TextButton(
              child: Text('Log out', style: TextStyle(fontSize: 20.0),),
              onPressed: () {
                LogoutService.logOut();
                Navigator.pop(context, MaterialPageRoute);
              },
        ), )
    ));
  }
}
