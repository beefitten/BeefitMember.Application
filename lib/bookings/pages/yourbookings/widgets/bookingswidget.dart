import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BookingWidget extends StatelessWidget {
  const BookingWidget({Key? key}) : super(key: key);

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
          child: ListView(
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            children: [
              CardExample(
                  "https://ychef.files.bbci.co.uk/1376x774/p07ztf1q.jpg",
                  "Crossfit for øvede",
                  "Aarhus C, Ringkøbingvej 28",
                  "Thursday, 15:45"),
              CardExample(
                  "https://media.wired.com/photos/613800d714e5c8f49420c6c9/master/w_2400,h_1800,c_limit/Gear-WHOOP-Body_Intimates_Adj.Bralette_1.jpg",
                  "Crossfit for øvede",
                  "Aarhus C, Ringkøbingvej 28",
                  "Thursday, 15:45"),
              CardExample(
                  "https://i.insider.com/5b43ccf31335b831008b4c1c?width=1136&format=jpeg",
                  "Crossfit for øvede",
                  "Aarhus C, Ringkøbingvej 28",
                  "Thursday, 15:45"),
              CardExample(
                  "https://skinnyms.com/wp-content/uploads/2018/02/The-Six-Principles-of-Weight-Training-for-Women4.jpg",
                  "Crossfit for øvede",
                  "Aarhus C, Ringkøbingvej 28",
                  "Thursday, 15:45"),
            ],
          ),
        )
      ]),
    );
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
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      color: Color.fromRGBO(95, 46, 234, 1),
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
