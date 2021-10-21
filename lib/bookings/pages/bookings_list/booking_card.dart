import 'package:beefitmember_application/shared/FitnessPackage/FitnessPackage.dart';
import 'package:flutter/material.dart';

class BookingCard extends StatefulWidget {
  final String timeStart, timeEnd, className, place, city;

  const BookingCard(
      {Key? key,
      required this.timeStart,
      required this.timeEnd,
      required this.className,
      required this.place,
      required this.city})
      : super(key: key);

  @override
  _BookingCardState createState() => _BookingCardState();
}

class _BookingCardState extends State<BookingCard> {
  bool _isBooked = false;
  bool _isFull = false;

  handleBook() {
    setState(() {
      _isBooked = !_isBooked;
    });
  }

  @override
  Widget build(BuildContext context) {
    final green = Color.fromRGBO(0, 186, 136, 1);
    final blue = Color(int.parse(FitnessPackage.secondaryColor));

    String className = widget.className;
    String timeStart = widget.timeStart;
    String timeEnd = widget.timeEnd;
    String place = widget.place;
    String city = widget.city;

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
        handleBook();
      },
      child: Text(this._isBooked ? "Booked" : "Book"),
      style: ElevatedButton.styleFrom(primary: this._isBooked ? green : blue),
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
                            locationText("$place, $city")
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
