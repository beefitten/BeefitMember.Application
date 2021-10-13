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
    final green = Color.fromRGBO(0, 186, 136, 1);
    final blue = Color.fromRGBO(6, 62, 249, 1);

    String className = "Fit Fat Fuck";
    String timeStart = "11:30";
    String timeEnd = "12:45";
    String place = "Frederiksbjerg";
    String city = "København";

    String topicHeaderText = "Bookings";

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

    final generalHeaderText = (String txt) => Text(
          txt,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16.0,
          ),
        );

    final subtext = (String txt) => Padding(
      padding: EdgeInsets.only(bottom: 6.0),
      child: Text(
            txt,
            style:
                TextStyle(fontSize: 15.0, color: Color.fromRGBO(78, 75, 102, 1)),
          ),
    );

    final locationText = (String txt) => Text(
          txt,
          style: TextStyle(
              fontSize: 13.0, color: Color.fromRGBO(138, 141, 178, 1)),
        );

    final bookBtn = ElevatedButton(
      onPressed: () {
        handleBook();
      },
      child: Text(this._isBooked ? "Booked" : "Book"),
      style: ElevatedButton.styleFrom(primary: _isBooked ? green : blue),
      
    );

    final list = Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Card(
            child: ListTile(
                title: generalHeaderText("$className"),
                subtitle: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Column(
                      children: [
                        Row(
                          children: [subtext("$timeStart - $timeEnd")],
                        ),
                        locationText("$place, $city")
                      ],
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                    ),
                    SizedBox(width: 120.0,),
                    SizedBox(child: bookBtn, width: 80.0)
                  ],
                ),
                tileColor: Color.fromRGBO(247, 247, 252, 1)),
          ),
        ),
      ],
    );

    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        shrinkWrap: true,
        children: <Widget>[
          topic,
          generalText("Today"),
          list,
          generalText("Tomorrow"),
          list,
          list,
          list,
          list,
        ],
      ),
    );
  }
}