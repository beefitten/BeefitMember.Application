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
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.red,
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(10),
              bottomRight: Radius.circular(10))),
      constraints: BoxConstraints(
          maxHeight: MediaQuery.of(context).size.height * 0.2,
          maxWidth: MediaQuery.of(context).size.width * 0.9),
      child: Row(
        children: [
          Container(
            constraints: BoxConstraints(
                maxWidth: MediaQuery.of(context).size.width * 0.2,
                maxHeight: MediaQuery.of(context).size.height * 0.2),
            color: Colors.yellow,
            child: Image.network(logoPath, height: 75),
          ),
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 2),
                  child: Text('kundeservice@FWFinlandsgade',
                      style: TextStyle(fontSize: 16, color: Colors.blueAccent)),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 2),
                  child: Text('12 34 56 78', style: TextStyle(fontSize: 16)),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 2),
                  child: Text('$mondayThursday (Mon-Thu)',
                      style: TextStyle(fontSize: 16)),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 2),
                  child: Text('$friday (Fri)', style: TextStyle(fontSize: 16)),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
