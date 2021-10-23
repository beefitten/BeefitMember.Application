import 'package:beefitmember_application/bookings/pages/yourbookings/models/bookingModel.dart';
import 'package:beefitmember_application/shared/FitnessPackage/FitnessPackage.dart';
import 'package:beefitmember_application/shared/user/user.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'dart:convert' as cnv;

class BookingWidget extends StatefulWidget {
  late final Color _color;

  BookingWidget([this._color = Colors.white]);

  @override
  _BookingWidgetState createState() => _BookingWidgetState();
}

class _BookingWidgetState extends State<BookingWidget> {
  List<Classes>? _classes;

  @override void initState() {
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Text(
            "Your Bookings",
            textAlign: TextAlign.left,
            style: TextStyle(
              color: Colors.black,
              fontSize: MediaQuery.of(context).size.height * 0.03,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Container(
          color: Colors.white,
          height: MediaQuery.of(context).size.height * 0.26,
          child: _classes == null
              ? Center(child: CircularProgressIndicator(
                backgroundColor: Color(int.parse(FitnessPackage.primaryColor))))
              : _classes!.length == 0
              ? Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Center(child: Text("You have no classes booked!")),
              )
              : ListView.builder(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemBuilder: (BuildContext context, int index) {
                    return CardExample(
                        _classes![index].classImage,
                        _classes![index].className,
                        _classes![index].location,
                        DateFormat.Hm().add_E().add_MMMd().format(_classes![index].timeStart));
                  },
                  itemCount: _classes!.length,
          ),
        )
      ]),
    );
  }
  Future<void> getData() async {
    var userEmail = User.email;
    var endpointUrl = Uri.parse('https://bfmbookings.azurewebsites.net/getUserClasses/$userEmail');

    var response = await http.get(endpointUrl);

    List<dynamic> body = cnv.jsonDecode(response.body);
    _classes = body.map((dynamic item) => Classes.fromJson(item)).toList();
    setState(() { });
  }
}

class CardExample extends StatelessWidget {
  final _picture;
  final _title;
  final _subtitle;
  final _date;

  CardExample(this._picture, this._title, this._subtitle, this._date);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        elevation: 5,
        child: Container(
          height: MediaQuery.of(context).size.height * 0.25,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                alignment: Alignment.bottomRight,
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height * 0.18,
                    width: MediaQuery.of(context).size.width * 0.6,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(_picture),
                        )),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      color: Color(int.parse(FitnessPackage.secondaryColor)),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          _date,
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 12, top: 6),
                child: Text(_title,
                    style:
                        TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 12),
                child: Text(_subtitle, style: TextStyle(fontSize: 14)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
