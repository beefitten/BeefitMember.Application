import 'package:beefitmember_application/bookings/pages/yourbookings/models/appointmentModel.dart';
import 'package:beefitmember_application/shared/FitnessPackage/FitnessPackage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as cnv;


class AppointmentsWidget extends StatefulWidget {
  final _color;
  AppointmentsWidget([this._color = Colors.white]);

  @override
  State<AppointmentsWidget> createState() => _AppointmentsWidgetState();
}

class _AppointmentsWidgetState extends State<AppointmentsWidget> {
  List<Appointments>? _appointments;

  @override void initState() {
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 0, left: 0),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Text("Your Appointments",
              textAlign: TextAlign.left,
              style: TextStyle(
                color: Colors.black,
                fontSize: MediaQuery.of(context).size.height * 0.03,
                fontWeight: FontWeight.bold,
              )),
        ),
        BookingExample(
            "Personal Training Session",
            "On thursday at 15:40",
            "https://scontent-cph2-1.xx.fbcdn.net/v/t31.18172-8/15110434_1025175290941186_3443883879887239386_o.jpg?_nc_cat=111&ccb=1-5&_nc_sid=174925&_nc_ohc=ZNlWvVSiFtkAX_0oynG&_nc_ht=scontent-cph2-1.xx&oh=64c3148f10ef67ff62bf2c3515edb0d5&oe=618DAF3C",
            widget._color),
        BookingExample(
            "Personal Training Session",
            "On thursday at 15:40",
            "https://scontent-cph2-1.xx.fbcdn.net/v/t1.6435-9/37668083_2177504232277870_8621075462833045504_n.jpg?_nc_cat=101&ccb=1-5&_nc_sid=ad2b24&_nc_ohc=yh2q03T3h7sAX8nlc2T&_nc_ht=scontent-cph2-1.xx&oh=b0a69e9aee6802e4376695dd2a3d13b2&oe=618E8369",
            widget._color),
        BookingExample(
            "Personal Training Session",
            "On thursday at 15:40",
            "https://scontent-cph2-1.xx.fbcdn.net/v/t1.18169-9/1378411_600839369978308_67470434_n.jpg?_nc_cat=109&ccb=1-5&_nc_sid=f9d7a1&_nc_ohc=9k1UXGwl03oAX8ciRg1&_nc_ht=scontent-cph2-1.xx&oh=dafea8ba248aa34f47719789400011de&oe=618B5DD7",
            widget._color),
        BookingExample(
            "Personal Training Session",
            "On thursday at 15:40",
            "https://scontent-cph2-1.xx.fbcdn.net/v/t1.18169-9/13240161_10208065408605563_765658668488989296_n.jpg?_nc_cat=107&ccb=1-5&_nc_sid=174925&_nc_ohc=lC-0QbRHbEMAX-8pEyp&_nc_ht=scontent-cph2-1.xx&oh=8ca4fb6622da3f5971da8d19e0f9212e&oe=618DFE5E",
            widget._color),
      ]),
    );
  }

  Future<void> getData() async {
    var endpointUrl = Uri.parse('https://beefitmemberbookings.azurewebsites.net/getRandomAppointments');

    var response = await http.get(endpointUrl);

    List<dynamic> body = cnv.jsonDecode(response.body);
    _appointments = body.map((dynamic item) => Appointments.fromJson(item)).toList();
    setState(() { });
  }
}

class BookingExample extends StatelessWidget {
  final _title;
  final _date;
  final _picture;
  final _color;

  BookingExample(this._title, this._date, this._picture,
      [this._color = Colors.white]);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Flexible(
          child: Card(
            elevation: 3,
            color: _color,
            child: Container(
              height: MediaQuery.of(context).size.height * 0.1,
              child: Row(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: CircleAvatar(
                        radius: 30, backgroundImage: NetworkImage(_picture)),
                  ),
                  Container(
                    height: 100,
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(15, 10, 0, 0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            _title,
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width * 0.6,
                            child: Padding(
                              padding: const EdgeInsets.only(top: 4),
                              child: Text(
                                _date,
                                style:
                                    TextStyle(fontSize: 15, color: Colors.grey),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
