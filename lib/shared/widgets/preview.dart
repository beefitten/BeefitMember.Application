import 'package:beefitmember_application/shared/FitnessPackage/FitnessPackage.dart';
import 'package:flutter/material.dart';

class Preview extends StatelessWidget {
  final String _title;
  final String _date;
  final String _picture;

  Preview(
    this._title,
    this._date,
    this._picture,
  );

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Flexible(
          child: Card(
            elevation: FitnessPackage.elevation,
            color: FitnessPackage.backgroundColor,
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
                                fontSize: double.parse(FitnessPackage.H1Weight), fontWeight: FontWeight.bold),
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
