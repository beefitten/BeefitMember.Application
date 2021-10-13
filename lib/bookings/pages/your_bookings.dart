import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class YourBookings extends StatefulWidget {
  @override
  _YourBookingsState createState() => _YourBookingsState();
}


class _YourBookingsState extends State<YourBookings> {
  @override
  Widget build(BuildContext context) {
    final topic = Text(
        "Bookings",
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Colors.black,
          fontSize: MediaQuery.of(context).size.height * 0.04,
          fontWeight: FontWeight.bold,
    ));

    final logo = Center(
    );

  final menu = Row(
    children: <Widget> [
      // TextButton(child: Text("Your bookings"), onPressed: () {  }, style:
      //   ButtonStyle(
      //     shape: MaterialStateProperty.all<>
      //   ),),
      TextButton(child: Text("Classes"), onPressed: () {  },),
      TextButton(child: Text("Events"), onPressed: () {  },),
    ],
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  );


    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        shrinkWrap: true,
        children: <Widget>[
          topic,
          menu,
          logo,
        ],
      ),
    );
  }
}