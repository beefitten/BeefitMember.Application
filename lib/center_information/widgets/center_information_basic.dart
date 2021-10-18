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
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      color: Color(0xffF7F7FC),
      child: Container(
        constraints: BoxConstraints(
            maxHeight: MediaQuery.of(context).size.height * 0.2,
            maxWidth: MediaQuery.of(context).size.width * 0.9),
        child: Column(
          children: [
            Container(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.only(left: 20, bottom: 16, top: 8),
                child: Text('Fitness world - Jens Baggesens vej',
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.w400)),
              ),
            ),
            Row(
              children: [
                Padding(
                  padding:
                      const EdgeInsets.only(left: 20, bottom: 2, right: 12),
                  child: Container(
                    child: Image.network(logoPath, height: 75),
                  ),
                ),
                Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 2),
                        child: Text('kundeservice@FWFinlandsgade',
                            style: TextStyle(
                                fontSize: 16, color: Colors.blueAccent)),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 2),
                        child:
                            Text('12 34 56 78', style: TextStyle(fontSize: 16)),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 2),
                        child: Text('$mondayThursday (Mon-Thu)',
                            style: TextStyle(fontSize: 16)),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 2),
                        child: Text('$friday (Fri)',
                            style: TextStyle(fontSize: 16)),
                      )
                    ],
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
