import 'package:beefitmember_application/bookings/pages/bookings_list/booking_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Classes extends StatefulWidget {
  const Classes({Key? key}) : super(key: key);

  @override
  _ClassesState createState() => _ClassesState();
}

class _ClassesState extends State<Classes> {
  bool _isBooked = false;

  handleBook() {
    setState(() {
      _isBooked = !_isBooked;
    });
  }

  @override
  Widget build(BuildContext context) {
    String topicHeaderText = "Bookings";
    String timeStart = "10:30";
    String timeEnd = "12:45";
    String className = "Bike Standard";
    String place = "Frederiksbjerg";
    String city = "København";

    final topic = Text("$topicHeaderText",
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Colors.black,
          fontSize: MediaQuery.of(context).size.height * 0.04,
          fontWeight: FontWeight.bold,
        ));

    final generalText = (String txt) => Padding(
          padding: const EdgeInsets.fromLTRB(8, 0, 0, 0),
          child: Text(
            txt,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16.0,
            ),
          ),
        );

    final card = BookingCard(
      className: className,
      timeStart: timeStart, 
      timeEnd: timeEnd,
      place: place,
      city: city,);

    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        shrinkWrap: true,
        children: <Widget>[
          topic,
          generalText("Filters"),
          generalText("Today"),
          card,
          generalText("Tomorrow"),
          card,
          card,
          card,
          card,
          card,
          card,
          card,
        ],
      ),
    );
  }
}
