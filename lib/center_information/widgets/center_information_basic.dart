import 'package:beefitmember_application/shared/FitnessPackage/FitnessPackage.dart';
import 'package:flutter/material.dart';

var logoPath =
    "https://is5-ssl.mzstatic.com/image/thumb/Purple124/v4/b7/7b/46/b77b467f-d827-3620-8cef-65f8ccfbc588/IconFitnessWorld-0-0-1x_U007emarketing-0-0-0-5-0-0-sRGB-0-0-0-GLES2_U002c0-512MB-85-220-0-0.png/1200x630wa.png";

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
    return Center(
      child: Card(
        elevation: 3,
        color: Color(0xffF7F7FC),
        child: Container(
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(5)),
          child: Column(
            children: [
              Container(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Text("Your gym",
                      style:
                          TextStyle(fontWeight: FontWeight.w600, fontSize: 26)),
                ),
              ),
              Container(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.only(left: 20, bottom: 16),
                  child: Text('Fitness world - Jens Baggesens vej',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w300)),
                ),
              ),
              Row(
                children: [
                  Container(
                    child: Image.network(logoPath, height: 75),
                  ),
                  Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 2),
                          child: Text('kundeservice@FWFinlandsgade',
                              style: TextStyle(
                                  fontSize: 12, color: Colors.blueAccent)),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 2),
                          child: Text('12 34 56 78',
                              style: TextStyle(fontSize: 12)),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 2),
                          child: Text('$mondayThursday (Mon-Thu)',
                              style: TextStyle(fontSize: 12)),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 2),
                          child: Text('$friday (Fri)',
                              style: TextStyle(fontSize: 12)),
                        )
                      ],
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
