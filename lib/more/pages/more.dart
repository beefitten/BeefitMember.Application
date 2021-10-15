<<<<<<< HEAD
import 'package:beefitmember_application/bookings/pages/previewBookings/widgets/show_more_button.dart';
=======
import 'package:beefitmember_application/bookings/pages/yourbookings/widgets/appointmentswidget.dart';
import 'package:beefitmember_application/bookings/pages/yourbookings/widgets/booking_menu_widget.dart';
import 'package:beefitmember_application/bookings/pages/yourbookings/widgets/bookingswidget.dart';
import 'package:beefitmember_application/bookings/pages/yourbookings/widgets/find_classes_widget.dart';
import 'package:beefitmember_application/shared/FitnessPackage/FitnessPackage.dart';
import 'package:beefitmember_application/shared/widgets/buttons.dart';
>>>>>>> 15382addf1ae051750a8eb832eea54a9a56bd88e
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
    style: TextStyle(fontSize: 20.0),
  );

  @override
  void initState() {
    super.initState();
    build(context);
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    final _logOutBtn = TextButton(
      style: ButtonStyle(
        backgroundColor:  MaterialStateProperty.all(Color.fromRGBO(229, 235, 254, 1.0))),
      child: _logOut,
      onPressed: () {
        LogoutService.logOut();
        Navigator.pop(context, '/nav');
      },
    );

    final headerGeneral = (String txt) => Padding(
      padding: EdgeInsets.only(right: MediaQuery.of(context).size.width * 0.46),
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

    final more = Container(
      child: headerGeneral("More"),
    );

    return Scaffold(
<<<<<<< HEAD
        backgroundColor: Colors.white,
        body: Padding(
          padding: EdgeInsets.only(left: MediaQuery.of(context).size.width *0.05),
          child: Container(
              child: ListView(
            children: [
              membership,
              more,
              _logOutBtn,
            ],
          )),
        ));
=======
      backgroundColor: Colors.white,
      body: Container(
        child: Center(
            child: TextButton(
              child: Text('Log out', style: TextStyle(fontSize: 20.0, color: Color(int.parse(FitnessPackage.secondaryColor))),),
              onPressed: () {
                LogoutService.logOut();
                Navigator.pop(context, '/nav');
              },
        ), )
    ));
>>>>>>> 15382addf1ae051750a8eb832eea54a9a56bd88e
  }
}
