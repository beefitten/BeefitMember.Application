import 'package:beefitmember_application/center_information/models/center_information_model.dart';
import 'dart:convert' as cnv;
import 'package:http/http.dart' as http;
import 'package:beefitmember_application/shared/FitnessPackage/FitnessPackage.dart';
import 'package:flutter/material.dart';

class CenterInformationBasic extends StatefulWidget {
  CenterInformationModel _model;
  CenterInformationBasic(this._model);

  @override
  _CenterInformationBasicState createState() =>
      _CenterInformationBasicState(_model);
}

class _CenterInformationBasicState extends State<CenterInformationBasic> {
  CenterInformationModel _model;

  _CenterInformationBasicState(this._model);

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Color(0xFFF7F7FC),
          borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(10),
              bottomLeft: Radius.circular(10))),
      constraints:
          BoxConstraints(maxWidth: MediaQuery.of(context).size.width * 0.9),
      child: Padding(
        padding: const EdgeInsets.only(left: 12, top: 16),
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Phone(_model.phoneNumber),
              Email(_model.email),
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
                    '${_model.openingHours.elementAt(0).item1} - ${_model.openingHours.elementAt(0).item2} (Mon - Thu)',
                    style: TextStyle(
                        fontSize: 16,
                        color:
                            Color(int.parse(FitnessPackage.secondaryColor)))),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 2, bottom: 16),
                child: Text(
                    '${_model.openingHours.elementAt(1).item1} - ${_model.openingHours.elementAt(1).item2} (Fri)',
                    style: TextStyle(
                        fontSize: 16,
                        color:
                            Color(int.parse(FitnessPackage.secondaryColor)))),
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
                child: Text(
                    '${_model.mannedHours.elementAt(0).item1} - ${_model.mannedHours.elementAt(0).item2} (Mon - Thu)',
                    style: TextStyle(
                        fontSize: 16,
                        color:
                            Color(int.parse(FitnessPackage.secondaryColor)))),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 2, bottom: 16),
                child: Text(
                    '${_model.mannedHours.elementAt(1).item1} - ${_model.mannedHours.elementAt(1).item2} (Mon - Thu)',
                    style: TextStyle(
                        fontSize: 16,
                        color:
                            Color(int.parse(FitnessPackage.secondaryColor)))),
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

  Phone(this._phoneNumber);

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
                  style: TextStyle(
                      fontSize: 16,
                      color: Color(int.parse(FitnessPackage.secondaryColor)))),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(right: 12, top: 2),
          child: Icon(
            Icons.phone,
            size: 22,
            color: Color(int.parse(FitnessPackage.secondaryColor)),
          ),
        )
      ],
    );
  }
}

class Email extends StatelessWidget {
  final String? _email;
  Email(this._email);

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
                      color: Color(int.parse(FitnessPackage.secondaryColor)))),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(right: 12, top: 10),
          child: Icon(Icons.email_rounded,
              size: 22, color: Color(int.parse(FitnessPackage.secondaryColor))),
        ),
      ],
    );
  }
}
