import 'package:beefitmember_application/bookings/pages/bookings_list/booking_card.dart';
import 'package:beefitmember_application/bookings/pages/yourbookings/widgets/booking_menu_wdiget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Classes extends StatefulWidget {
  const Classes({Key? key}) : super(key: key);

  @override
  _ClassesState createState() => _ClassesState();
}

class _ClassesState extends State<Classes> {
  bool _isBooked = false;
  List<Map> _classes = [
    {
      "timeStart": "10:30",
      "timeEnd": "12:45",
      "className": "Bike Standard",
      "place": "Frederiksbjerg",
      "city": "København"
    },
    {
      "timeStart": "10:30",
      "timeEnd": "12:45",
      "className": "Bike Standard",
      "place": "Viby",
      "city": "Aarhus"
    }
  ];

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

    final selectClass = () => Container(
          width: MediaQuery.of(context).size.width * 0.95,
          padding: EdgeInsets.only(
              bottom: MediaQuery.of(context).size.height * 0.01),
          child: TextField(
            autofocus: false,
            decoration: InputDecoration(
              filled: true,
              fillColor: Color.fromRGBO(247, 247, 252, 1),
              hintStyle: TextStyle(color: Color(0xFF666666)),
              hintText: 'Select class type',
              contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
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

    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        shrinkWrap: true,
        children: <Widget>[
          BookingMenuWidget(),
          generalText("Filters"),
          Column(
            children: [selectClass(), selectClass(), selectClass()],
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
