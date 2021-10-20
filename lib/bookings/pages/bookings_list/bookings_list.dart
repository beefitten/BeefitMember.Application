import 'package:beefitmember_application/bookings/pages/bookings_list/booking_card.dart';
import 'package:beefitmember_application/bookings/pages/bookings_list/widgets/filter_widget.dart';
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
    String timeStart = "10:30";
    String timeEnd = "12:45";
    String className = "Bike Standard";
    String place = "Frederiksbjerg";
    String city = "København";

    final generalText = (String txt) => Padding(
          padding: const EdgeInsets.fromLTRB(8, 16, 0, 0),
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
      city: city,
    );

    final classType = FilterClass(
        items: ["Select class type", "Bike", "Run"],
        value: "Select class type");

    final locationType = FilterClass(items: [
      "Select locations",
      "Frederiksbjerg",
      "Viby",
      "Åbyhøj",
      "Rundhøj",
      "Randers City",
      "Varde City"
    ], value: "Select locations");

    final iconTime = Container(
      child: Padding(
        padding: const EdgeInsets.only(left: 26, top: 26),
        child: Icon(
          Icons.access_time,
          color: Colors.blue,
          size: 20.0,
        ),
      ),
    );

    final iconTwo = Container(
      child: Padding(
        padding: const EdgeInsets.only(left: 26, top: 93),
        child: Icon(
          Icons.access_time,
          color: Colors.blue,
          size: 20.0,
        ),
      ),
    );

    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        shrinkWrap: true,
        children: <Widget>[
          generalText("Filters"),
          Stack(
            children: [
              Column(
                children: [classType, locationType],
              ),
              iconTime,
              iconTwo,
            ],
          ),
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
