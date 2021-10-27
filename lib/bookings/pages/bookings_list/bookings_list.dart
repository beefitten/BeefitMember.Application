import 'package:beefitmember_application/bookings/pages/bookings_list/booking_card.dart';
import 'package:beefitmember_application/bookings/pages/bookings_list/widgets/filter_widget.dart';
import 'package:beefitmember_application/bookings/pages/yourbookings/models/bookingModel.dart';
import 'package:beefitmember_application/shared/FitnessPackage/FitnessPackage.dart';
import 'package:beefitmember_application/shared/user/user.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as cnv;

import 'package:intl/intl.dart';

class ClassesList extends StatefulWidget {
  const ClassesList({Key? key}) : super(key: key);

  @override
  _ClassesListState createState() => _ClassesListState();
}

class _ClassesListState extends State<ClassesList> {
  bool _isBooked = false;
  List<Classes>? _allClasses;
  List<Classes>? _yourBookings;

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
    // All classes
    var fitness = User.primaryGym;
    var allClassesUrl = Uri.parse('https://bfmbookings.azurewebsites.net/getClasses/$fitness');
    var allClassesResponse = await http.get(allClassesUrl);
    List<dynamic> allClassesBody = cnv.jsonDecode(allClassesResponse.body);
    _allClasses = allClassesBody.map((dynamic item) => Classes.fromJson(item)).toList();


    // Your bookings
    var userEmail = User.email;
    var yourBookingsUrl = Uri.parse('https://bfmbookings.azurewebsites.net/getUserClasses/$userEmail');
    var yourBookingsResponse = await http.get(yourBookingsUrl);
    List<dynamic> yourBookingBody = cnv.jsonDecode(yourBookingsResponse.body);
    _yourBookings = yourBookingBody.map((dynamic item) => Classes.fromJson(item)).toList();

    setState(() {});
  }

  alreadyBooked(Classes currentClass){
    for (Classes item in _yourBookings!) {
      if (item.classId == currentClass.classId)
        return true;
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    // String timeStart = "10:30";
    // String timeEnd = "12:45";
    // String className = "Bike Standard";
    // String place = "Frederiksbjerg";
    // String city = "København";

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

    // final card = BookingCard(
    //   className: className,
    //   timeStart: timeStart,
    //   timeEnd: timeEnd,
    //   place: place,
    // );

    // final classType = FilterClass(
    //     items: ["Select class type", "Bike", "Run"],
    //     value: "Select class type");

    // final locationType = FilterClass(items: [
    //   "Select locations",
    //   "Frederiksbjerg",
    //   "Viby",
    //   "Åbyhøj",
    //   "Rundhøj",
    //   "Randers City",
    //   "Varde City"
    // ], value: "Select locations");

    // final iconTime = Container(
    //   child: Padding(
    //     padding: const EdgeInsets.only(left: 26, top: 26),
    //     child: Icon(
    //       Icons.access_time,
    //       color: Colors.blue,
    //       size: 20.0,
    //     ),
    //   ),
    // );

    // final iconTwo = Container(
    //   child: Padding(
    //     padding: const EdgeInsets.only(left: 26, top: 93),
    //     child: Icon(
    //       Icons.access_time,
    //       color: Colors.blue,
    //       size: 20.0,
    //     ),
    //   ),
    // );

    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          //generalText("Classes"),
          Expanded(
            child: _allClasses == null
                    ? Center(child: CircularProgressIndicator(
                    backgroundColor: Color(int.parse(FitnessPackage.primaryColor))))
                    : ListView.builder(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      child: BookingCard(
                        className: _allClasses![index].className,
                        timeStart: DateFormat.Hm().format(_allClasses![index].timeStart),
                        timeEnd: DateFormat.Hm().add_MMMd().format(_allClasses![index].timeEnd),
                        place: _allClasses![index].location,
                        classInfo: _allClasses![index],
                        email: User.email,
                        booked: alreadyBooked(_allClasses![index]),
                      ),
                      onTap: () {}
                    );
                  },
                  itemCount: _allClasses!.length,
                ),
          ),
        ],
      ),
      );
  }
}
