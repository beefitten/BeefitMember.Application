import 'dart:convert';
import 'dart:io';

import 'package:beefitmember_application/bookings/pages/yourbookings/models/bookingModel.dart';
import 'package:beefitmember_application/shared/FitnessPackage/FitnessPackage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class BookingCard extends StatefulWidget {
  final String timeStart, timeEnd, className, place, email;
  final Classes classInfo;
  final bool booked;

  const BookingCard(
      {Key? key,
      required this.timeStart,
      required this.timeEnd,
      required this.className,
      required this.place,
      required this.classInfo,
      required this.email,
      required this.booked})
      : super(key: key);

  @override
  _BookingCardState createState() => _BookingCardState();
}

class _BookingCardState extends State<BookingCard> {
  late bool _isBooked;
  bool _isFull = false;
  String book = "Book";
  String booked = "Booked";
  var listener;
  bool shouldNotify = false;
  bool loaded = false;

  late FlutterLocalNotificationsPlugin localNotification;

  @override
  void initState() {
    super.initState();
    var androidInitialize = new AndroidInitializationSettings('ic_launcher');
    var iOSInitialize = new IOSInitializationSettings();
    var initializationSettings = new InitializationSettings(android: androidInitialize, iOS: iOSInitialize);
    localNotification = new FlutterLocalNotificationsPlugin();
    localNotification.initialize(initializationSettings);
    listener = null;
    shouldNotify = false;
  }

  deleteBooking(String classId, String email) async {
    var endpointUrl = Uri.parse('https://beefitmemberbookings.azurewebsites.net/deleteBooking');

    var body = {};
    body["classId"] = classId;
    body["email"] = email;
    var bodyJson = json.encode(body);

    var headers = {
      HttpHeaders.contentTypeHeader: 'application/json; charset=UTF-8'
    };

    var response = await http.post(
      endpointUrl,
      headers: headers,
      body: bodyJson,
    );

    setState(() {
      if (response.statusCode == 200)
        _isBooked = !_isBooked;
        _isFull = false;
    });
  }

  handleBook(String classId,
      String email,
      String className) async {
    var endpointUrl = Uri.parse('https://beefitmemberbookings.azurewebsites.net/bookClass');

    var body = {};
    body["classId"] = classId;
    body["email"] = email;
    var bodyJson = json.encode(body);

    var headers = {
      HttpHeaders.contentTypeHeader: 'application/json; charset=UTF-8'
    };

    listenForBookingConfirmation(classId, email, className);

    var response = await http.post(
      endpointUrl,
      headers: headers,
      body: bodyJson,
    );

    setState(() {
      if (response.statusCode == 200){
        shouldNotify = true;
        _isBooked = !_isBooked;
        _isFull = widget.classInfo.isFull;
      }
    });
  }

  listenForBookingConfirmation(String classId,
      String email,
      String className) {
    if (listener == null){

      listener = FirebaseFirestore.instance
          .collection('Classes')
          .doc(classId)
          .snapshots()
          .listen((event) {

        print("Subscribed to " + classId);
        var participants = event.data();
        var participantsList = participants?["Participants"] as List<dynamic>;

        if (participants == null)
          return;

        var response = participantsList.where((element) => (element.contains(email))).toList();
        if (response.length >= 1 && shouldNotify){
          print(response);
          print("Send notification!");
          stopListening(classId);
          publishNotification(className);
        }else {
          print("Not in the list. Still subscribed!");
        }
      });
    }
  }

  stopListening(String classId){
    print("Unsubscribed from " + classId);
    listener.cancel();
    listener = null;
    shouldNotify = false;
  }

  Future publishNotification(String className) async {
    var androidDetails = new AndroidNotificationDetails(
        "ChannelId",
        "Message",
        "Description",
        importance: Importance.high);

    var iOSDetails = new IOSNotificationDetails();
    var generalNotificationDetails = new NotificationDetails(android: androidDetails, iOS: iOSDetails);
    await localNotification.show(
        0,
        "Class " + className + " is confirmed!",
        "We're looking forward to see you!",
        generalNotificationDetails);
  }

  @override
  Widget build(BuildContext context) {
    final green = Color.fromRGBO(0, 186, 136, 1);
    final standardBtnColor = Color(int.parse(FitnessPackage.fitnessPackageModel.secondaryColor));

    String className = widget.className;
    String timeStart = widget.timeStart;
    String timeEnd = widget.timeEnd;
    String place = widget.place;
    String email = widget.email;
    Classes classInfo = widget.classInfo;

    if (!loaded){
      _isBooked = widget.booked;
      _isFull = widget.classInfo.isFull;
      loaded = true;
    }

    final generalHeaderText = (String txt) => Padding(
          padding: const EdgeInsets.only(top: 10),
          child: Text(
            txt,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16.0,
            ),
          ),
        );

    final subtext = (String txt) => Padding(
          padding: EdgeInsets.only(bottom: 6.0, top: 6.0),
          child: Text(
            txt,
            style: TextStyle(
                fontSize: 15.0, color: Color.fromRGBO(78, 75, 102, 1)),
          ),
        );

    final locationText = (String txt) => Padding(
          padding: const EdgeInsets.only(bottom: 6.0),
          child: Text(
            txt,
            style: TextStyle(
                fontSize: 13.0, color: Color.fromRGBO(138, 141, 178, 1)),
          ),
        );

    final bookBtn = ElevatedButton(
      onPressed: () {
        if (_isFull && !_isBooked) {
          Fluttertoast.showToast(
            msg: "$className Is Fully Booked...",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            backgroundColor: Color(int.parse(FitnessPackage.primaryColor)),
            textColor: Colors.white,
            fontSize: 16.0);
          return;
        }

        if (!_isBooked)
          handleBook(classInfo.classId, email, classInfo.className);

        if (_isBooked)
          deleteBooking(classInfo.classId, email);
      },
      child: Text(this._isBooked ? booked : book),
      style: ElevatedButton.styleFrom(
          primary: this._isBooked ? green : standardBtnColor),
    );

    final card = Column(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(8, 2, 8, 0),
          child: Card(
            child: Stack(
              alignment: Alignment.centerRight,
              children: [
                ListTile(
                    title: Row(
                      children: [
                        generalHeaderText("$className"),
                        Padding(
                          padding: const EdgeInsets.only(left: 16.0, top: 10.0),
                          child: Container(
                            width: 9,
                            height: 9,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: _isFull ? Colors.red : Colors.green,
                            ),
                          ),
                        ),
                      ],
                    ),
                    subtitle: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Column(
                          children: [
                            subtext("$timeStart - $timeEnd"),
                            locationText("Location: $place")
                          ],
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.25,
                        ),
                      ],
                    ),
                    tileColor: Color.fromRGBO(247, 247, 252, 1)),
                Padding(
                  padding: const EdgeInsets.only(right: 16.0),
                  child: SizedBox(
                      child: bookBtn,
                      width: MediaQuery.of(context).size.width * 0.28),
                )
              ],
            ),
          ),
        ),
      ],
    );

    return Container(
      child: card,
    );
  }
}
