import 'package:beefitmember_application/center_information/models/center_information_package.dart';
import 'package:beefitmember_application/shared/FitnessPackage/FitnessPackage.dart';
import 'package:flutter/material.dart';

class CenterInformationBasic extends StatefulWidget {
  // CenterInformationModel _model;
  CenterInformationBasic();

  @override
  _CenterInformationBasicState createState() => _CenterInformationBasicState();
}

class _CenterInformationBasicState extends State<CenterInformationBasic> {
  // CenterInformationModel _model;

  _CenterInformationBasicState();

  @override
  void initState() {
    super.initState();
  }

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
      child: Padding(
        padding: const EdgeInsets.only(left: 12, top: 16),
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Phone(CenterInformationPackage.model.phoneNumber,
                  int.parse(FitnessPackage.model.secondaryColor)),
              Email(CenterInformationPackage.model.email,
                  int.parse(FitnessPackage.model.secondaryColor)),
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
                child: Text(
                    '${CenterInformationPackage.model.openingHours.elementAt(0).item1} - ${CenterInformationPackage.model.openingHours.elementAt(0).item2} (Mon - Thu)',
                    style:
                        TextStyle(fontSize: 16, color: Color(secondaryColor))),
              ),
              Padding(
                  padding: const EdgeInsets.only(left: 2, bottom: 16),
                  child: Text(
                      '${CenterInformationPackage.model.openingHours.elementAt(1).item1} - ${CenterInformationPackage.model.openingHours.elementAt(1).item2} (Fri)',
                      style: TextStyle(
                          fontSize: 16, color: Color(secondaryColor)))),
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
                child: Text(
                    '${CenterInformationPackage.model.mannedHours.elementAt(0).item1} - ${CenterInformationPackage.model.mannedHours.elementAt(0).item2} (Mon - Thu)',
                    style:
                        TextStyle(fontSize: 16, color: Color(secondaryColor))),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 2, bottom: 16),
                child: Text(
                    '${CenterInformationPackage.model.mannedHours.elementAt(1).item1} - ${CenterInformationPackage.model.mannedHours.elementAt(1).item2} (Mon - Thu)',
                    style:
                        TextStyle(fontSize: 16, color: Color(secondaryColor))),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Phone extends StatelessWidget {
  final String? _phoneNumber;
  final int secondaryColor;

  Phone(this._phoneNumber, this.secondaryColor);

  @override
  Widget build(BuildContext context) {
    return Row(
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
              child: Text('$_phoneNumber',
                  style: TextStyle(fontSize: 16, color: Color(secondaryColor))),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(right: 12, top: 2),
          child: Icon(Icons.phone, size: 22, color: Color(secondaryColor)),
        )
      ],
    );
  }
}

class Email extends StatelessWidget {
  final String? _email;
  final int secondaryColor;
  Email(this._email, this.secondaryColor);

  @override
  Widget build(BuildContext context) {
    return Row(
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
              child: Text('$_email',
                  style: TextStyle(
                      fontSize: 16,
                      color: Color(
                          int.parse(FitnessPackage.model.secondaryColor)))),
            ),
          ],
        ),
        Padding(
            padding: const EdgeInsets.only(right: 12, top: 10),
            child: Icon(Icons.email_rounded,
                size: 22, color: Color(secondaryColor))),
      ],
    );
  }
}
