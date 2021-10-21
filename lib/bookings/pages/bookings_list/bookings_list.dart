import 'package:beefitmember_application/bookings/pages/bookings_list/booking_card.dart';
import 'package:beefitmember_application/bookings/pages/bookings_list/widgets/filter_widget.dart';
import 'package:beefitmember_application/bookings/pages/yourbookings/models/bookingModel.dart';
import 'package:beefitmember_application/shared/FitnessPackage/FitnessPackage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as cnv;

class ClassesList extends StatefulWidget {
  const ClassesList({Key? key}) : super(key: key);

  @override
  _ClassesListState createState() => _ClassesListState();
}

class _ClassesListState extends State<ClassesList> {
  bool _isBooked = false;
  List<Classes>? _classes;

  @override
  void initState() {
    getData();
    super.initState();
  }

  handleBook() {
    setState(() {
      _isBooked = !_isBooked;
    });
  }

  Future<void> getData() async {
    // var fitnessName = FitnessPackage.name[0].toUpperCase();
    var fitness = FitnessPackage.name.toString();
    print(fitness);
    var endpointUrl = Uri.parse(
        'https://beefitmemberbookings.azurewebsites.net/getClasses/$fitness');

    var response = await http.get(endpointUrl);

    List<dynamic> body = cnv.jsonDecode(response.body);
    _classes = body.map((dynamic item) => Classes.fromJson(item)).toList();
    setState(() {});
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
          // Stack(
          //   children: [
          //     Column(
          //       children: [classType, locationType],
          //     ),
          //     iconTime,
          //     iconTwo,
          //   ],
          // ),
          generalText("Classes"),
          _classes == null
          ? Center(child: CircularProgressIndicator(
                backgroundColor: Color(int.parse(FitnessPackage.primaryColor))))
          : ListView.builder(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemBuilder: (BuildContext context, int index) {
                    return BookingCard(
                        className: _classes![index].className,
                        timeStart: _classes![index].timeStart,
                        timeEnd: _classes![index].timeEnd,
                        place: _classes![index].location,
                        city: _classes![index].location
                        );
                  },
                  itemCount: _classes!.length,
          ),
        ],
      ),
    );
  }
}
