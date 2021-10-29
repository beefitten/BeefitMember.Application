import 'package:beefitmember_application/bookings/pages/bookings_list/booking_card.dart';
import 'package:beefitmember_application/shared/FitnessPackage/FitnessPackage.dart';
import 'package:flutter/material.dart';

var logoPath =
    "https://d1k976m6pd0u9m.cloudfront.net/public/employer/logo/fdw6c63xu1_Fitness_World.png";

var mondayThursday = '09.00 - 16.00';
var friday = '09.00 - 14.00';

class CenterInformationBasic extends StatefulWidget {
  CenterInformationBasic();

  @override
  _CenterInformationBasicState createState() => _CenterInformationBasicState();
}

class _CenterInformationBasicState extends State<CenterInformationBasic> {
  final double borderRadius = double.parse(FitnessPackage.model.borderRadius);
  final int backgroundColor = int.parse(FitnessPackage.model.backgroundColor);
  final int secondaryColor = int.parse(FitnessPackage.model.secondaryColor);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Color(backgroundColor),
          borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(borderRadius),
              bottomLeft: Radius.circular(borderRadius))),
      constraints:
          BoxConstraints(maxWidth: MediaQuery.of(context).size.width * 0.9),
      child: Padding(
        padding: const EdgeInsets.only(left: 12, top: 16),
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              phone,
              email,
              Padding(
                padding: const EdgeInsets.only(left: 2, bottom: 10),
                child: Text('Opening hours',
                    style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey,
                        fontWeight: FontWeight.w800)),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 2),
                child: Text('$mondayThursday (Mon-Thu)',
                    style: TextStyle(fontSize: 16, color: Color(secondaryColor))),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 2, bottom: 16),
                child: Text('$friday (Fri)',
                    style: TextStyle(
                        fontSize: 16,
                        color: Color(
                            secondaryColor))),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 2, bottom: 10),
                child: Text('Manned hours',
                    style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey,
                        fontWeight: FontWeight.w800)),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 2),
                child: Text('$mondayThursday (Mon-Thu)',
                    style: TextStyle(
                        fontSize: 16,
                        color: Color(
                            secondaryColor))),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 2, bottom: 16),
                child: Text('$friday (Fri)',
                    style: TextStyle(
                        fontSize: 16,
                        color: Color(
                            secondaryColor))),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

final phone = Row(
  mainAxisAlignment: MainAxisAlignment.spaceBetween,
  children: [
    Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 2, bottom: 10),
          child: Text('Phone',
              style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey,
                  fontWeight: FontWeight.w800)),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 2, bottom: 16),
          child: Text('12 34 56 78',
              style: TextStyle(
                  fontSize: 16,
                  color:
                      Color(secondaryColor))),
        ),
      ],
    ),
    Padding(
      padding: const EdgeInsets.only(right: 12, top: 2),
      child: Icon(
        Icons.phone,
        size: 22,
        color: Color(secondaryColor),
      ),
    )
  ],
);

final email = Row(
  mainAxisAlignment: MainAxisAlignment.spaceBetween,
  children: [
    Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 2, bottom: 10),
          child: Text('Email',
              style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey,
                  fontWeight: FontWeight.w800)),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 2, bottom: 16),
          child: Text('kundeservice@FWFinlandsgade',
              style: TextStyle(
                  fontSize: 16,
                  color:
                      Color(secondaryColor))),
        ),
      ],
    ),
    Padding(
      padding: const EdgeInsets.only(right: 12, top: 10),
      child: Icon(Icons.email_rounded,
          size: 22,
          color: Color(secondaryColor)),
    ),
  ],
);
